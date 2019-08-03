/**
 * 头部滚动条的js模块，淡入淡出效果。
 *
 * @author moumingyi@meituan.com
 * @date 2014-10-21 星期二
 */

define(['lib/jquery', 'lib/jquery/easing'], function($, easing) {
  'use strict';

  var container = $('.notice'), bannerBtnEls = container.find('.btns'), btnHookEls = bannerBtnEls.find('a');

  var jQpointFirst = container.find('.btns a').eq(0),
      jQpointLast = container.find('.btns a').last(),
      jQpicList = container.find('.shown li');

  var btnLength = btnHookEls.size();

  var timer;

  var autoPlay = function (option){
    timer = btnLength ? setInterval(function() {
      changePics(option);
    }, 4000) : null;
  };
  //切换图片，根据小圆点进行判断
  var changePics = function (option){
    var jQpointCur = container.find('.active'),
        jQpointNext = option ? jQpointCur.next() : jQpointCur.prev();
    if (option){
      jQpointNext = jQpointNext.size() ? jQpointNext : jQpointFirst;
    }else {
      jQpointNext = jQpointNext.size() ? jQpointNext : jQpointLast;
    }
    jQpicList.eq(jQpointCur.index()).stop(true,true).fadeOut(1000).removeClass('current');
    jQpicList.eq(jQpointNext.index()).stop(true,true).fadeIn(1000).addClass('current');
    jQpointCur.removeClass('active');
    jQpointNext.addClass('active');
  };
  //点击小圆点进行切换
  var changeBanner = function() {
    var self = $(this);
    if (self.hasClass('active')) {
      return;
    }
    self.parent().find('.active').removeClass('active');
    self.addClass('active');
    container.find('.current').stop(true,true).fadeOut(1000).removeClass('current');
    container.find('.shown li').eq(self.index()).stop(true,true).fadeIn(1000).addClass('current');
  };

  var prev =function (){
    changePics(false);
  };
  var next = function () {
    changePics(true);
  };
  var moveIn = function() {
    $(this).addClass('moveIn');
    clearInterval(timer);
  };
  var moveOut = function () {
    $(this).removeClass('moveIn');
    autoPlay(true);
  };

  autoPlay(true);
  container.on('mouseenter', moveIn)
           .on('mouseleave', moveOut)
           .on('click', '.btns a',changeBanner)
           .on('click', '#banner-prev', prev)
           .on('click', '#banner-next', next);
});