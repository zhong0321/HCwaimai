/**
 * 页面上的通用功能模块。
 *
 * @date 2014.01.26
 */

define(['lib/jquery', 'lib/raven', 'lib/jquery/cookie', 'lib/jquery/easing', 'lib/json2', 'module/user', 'module/interface', 'module/recruit', 'module/bridge', 'util/request', 'util/utils', 'module/toptips', 'module/utmredirect', 'module/search', 'module/detectzoom'], function ($, Raven, cookie, easing, json2, user, i, job, bridge, request, utils, toptips, utmredirect, search, detectzoom) {
  'use strict';

  var jQdocument = $(document), jQsendFeedback = $('#top-nav-send-fb'), jQasideFeedback = $('#aside-feedback'), jQchange = $('#changePosition'), jQislogin = $('#is-login'), jQbody = $('body'), jQmiddlewrap = $('.middlenav-wrap');

  //修改页面中我要开店的地址
  (function(){
    request.get('/contact/openstore',function(res){
      if(res.code == 0){
        $(".kaidian_address").attr('href', res.data);
      }else{
        $(".kaidian_address").attr('href', '//kd.meituan.com');
      }
    });
  })();

  var addUserToolsEvent = function() {
      // 用户登录模块JS
      var username = $('#user-tools-username');
      var userTools = $('#new-user-tools');
      var timer = null;

      userTools.hover(function() {
          clearTimeout(timer);
      }, function() {
          userTools.css({ display: 'none' });
      });

      username.hover(function() {
          userTools.css({ display: 'block' });
      }, function() {
          timer = setTimeout(function() {
            userTools.css({ display: 'none' });
          }, 200);
      });
  };

  addUserToolsEvent();

  //设置页面头部的搜索
  if (jQmiddlewrap.size()) {
    search(jQmiddlewrap);
  }
  // 设置当前用户信息
  if (MT.isLogin) {
    user.setUser(true);
  }

  // 监听页面上的所有鼠标和键盘事件
  var keyboardEvt = function(evt) {
    if (evt.which == 27) {
      bridge.trigger('dialog:close', {});
    }
    if (evt.which == 48 && (evt.metaKey || evt.ctrlKey)) {
      hideIgnoreInfo();
    }
  };

  var mouseEvt = function(evt) {
    bridge.trigger('tags:close', evt);
    
    // 主用于地图页面隐藏弹框的各种功能
    bridge.trigger('dialog:close-city', evt);
    bridge.trigger('dialog:close-history', evt);
  };

  // 页面头部黄条的登录和注册功能
  var continueStr = null;
  var currPage = location.href;
  if (currPage.indexOf('http://') == 0) { //一定的安全性的考虑
    continueStr = '?continue=' + encodeURIComponent(currPage);
  }

  var jQloginBar = $('#dis-login');
  if (continueStr) {
    jQloginBar.find('.j-login,.j-register').add('#logout').each(function() {
      //判断如果登录后有continue了，则无变化，如果没有，则加上continue=当前页
      var continueUrl = null;
      var setTokenUrl = utils.urlParams(this.href)['continue'];
      if (setTokenUrl) {
        setTokenUrl = decodeURIComponent(setTokenUrl);
        continueUrl = utils.urlParams(setTokenUrl)['continue'];
      }
      if (!continueUrl) {
        this.href = this.href+encodeURIComponent(continueStr);
      }
    });
  }

  // 当其他模块触发了登录事件的时候触发的登录操作
  bridge.register('user:login', function(userName) {
      user.setUser(true);

      var pageName = 'home';

      // 只会是home页
      if (pageName == 'home') {
          jQloginBar.replaceWith('<a id="user-tools-username" class="new-username-home fr">' + userName + '</a>' +
                                 '<a class="new-list-btn fr" href="/customer/order/list">我的订单</a>' +
                                 '<ul class="new-tools" id="new-user-tools">' +
                                 '<li class="divide-line"><a href="/favorite/restaurant">我的收藏</a></li>' +
                                 '<li><a href="' + (continueStr? i.logoutUrl+encodeURIComponent(continueStr) : i.logoutUrl) + '">退出</a></li>' +
                                 '</ul>'
          );
      } else if (pageName == 'map') {
          jQloginBar.replaceWith('<a id="user-tools-username" class="new-username-map fr">' + userName + '</a>' +
                                 '<a class="new-list-btn fr" href="/customer/order/list">我的订单</a>' +
                                 '<ul class="new-tools" id="new-user-tools">' +
                                 '<li class="divide-line"><a href="/favorite/restaurant">我的收藏</a></li>' +
                                 '<li><a href="' + (continueStr? i.logoutUrl+encodeURIComponent(continueStr) : i.logoutUrl) + '">退出</a></li>' +
                                 '</ul>'
          );
      }

      addUserToolsEvent();
  });
  
  // 曝光日志统计记录，只在商家页面上做统计   
  var href = window.location.href;  
  if (href.indexOf('\/home\/') != -1) {
    bridge.register('log:home', function(els) {
      var params = [];
      for (var j = 0; j < els.length; j++) {
        params.push({
          id : els[j].data('rid'),
          pos : els[j].data('index')
        })
      }

      // TODO 日志曝光接口
      var requests = {
        params : params,
        url : location.href
      }
      request.post(i.logger, {
        key : 'homeexposure',
        value : JSON.stringify(requests)
      });
    });
  }

  //头顶黄条逻辑
  toptips.init();
  
  // 发送错误（Google analysis）日志
  var sendfeedback = function() {
    ga('send', 'event', 'button', 'click', '找客服');  //点击统计
    utils.delayGo(this.href);
    return false;
  };
  
  var asidefeedback = function() {
    ga('send', 'event', 'button', 'click', '意见反馈');  //点击统计
  };
  
  // 鼠标移入和移除历史地址按钮时候的情况
  var plusHover = function() {
    $(this).addClass('hover');
  };
  
  var removeHover = function() {
    $(this).removeClass('hover');
  };

  // 招聘信息的打印
  job.print();
  
  // Raven前端错误日志的监控
  Raven.config('//c423d173e8b04c0ab92b8a31ef28c96b@sentry.sankuai.com/56', {
     whitelistUrls: [MT.STATIC_ROOT]
  }).install();
  
  var bindEvt = function() {
    jQdocument.keydown(keyboardEvt).click(mouseEvt);
    jQchange.mouseenter(plusHover).mouseleave(removeHover);
    jQislogin.mouseenter(plusHover).mouseleave(removeHover);
    
    jQsendFeedback.click(sendfeedback);
    jQasideFeedback.click(asidefeedback);
  };
  bindEvt();
  

  // 检测页面是否缩放
  var hideIgnoreInfo = function(evt) {
    if (!jQignore) {
      return;
    }
    
    jQignore.remove();
    evt && $.cookie('ignore_zoom', 1);
  };
  
  if ($.cookie('ignore_zoom') != 1) {
    var zoom = 1;
    try {
      zoom = detectzoom.zoom();
    } catch (e) {
      ;
    }
    if (utils.approximate(zoom, 1) != 1) {
      
      // 针对了不同的平台显示不同的按键（Mac，PC） 
      var targetKey = ($.inArray(navigator.platform, ['Mac68K', 'MacPPC', 'Macintosh', 'MacIntel']) != -1) ? 'Command' : 'Ctrl';
      var jQignore = $('<div class="zoom-detect" id="zoom-detect"><span class="content">您所访问的网页内容被缩放可能影响正常使用，可以使用键盘快捷键' + targetKey + ' + 0 恢复正常</span><a class="ignore" href="javascript:;">不再提醒</a></div>');
      jQbody.append(jQignore);
      jQignore.delegate('.ignore', 'click', hideIgnoreInfo);
    }
  }
});
