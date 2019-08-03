/**
 * header的搜索模块。
 *
 * @author moumingyi@meituan.com
 * @date 2014-11-03 星期一
 */

define(['lib/jquery', 'lib/jquery/easing', 'util/utils', 'util/template', 'tpl/search/food', 'tpl/search/restaurant', 'module/interface', 'util/request'], function($, easing, utils, template, foodTpl, poiTpl, i, request) {
  'use strict';

  var search = function(jQwrapper) {
    var jQwrapper = jQwrapper,
        jQinput = jQwrapper.find('.header-search'),
        jQsearchBox = jQinput.parent('.search-box'),
        jQnoResult = jQsearchBox.find('.no-result'),
        jQdoSearch = jQsearchBox.find('.doSearch'),
        jQresult = jQsearchBox.find('.result-box'),
        jQrestWords = jQresult.find('.rest-words'),
        jQfoodWords = jQresult.find('.food-words'),
        jQresultLists = jQresult.find('.result-right'),
        jQrestLists = jQresult.find('.rest-lists'),
        jQfoodLists = jQresult.find('.food-lists'),
        jQline = jQresult.find('.line'),
        originValue = jQinput.val();

    //   变量含义： 延迟加载； 输入信息； 上次输入信息； 是否有结果(boolean)， 服务器错误(boolean)
    var delaySearch, inputInfo, lastInput, hasResult, serverErr;

    // 输入过滤
    var inputFilter = function(evt) {
      if (!(/^(8|13|32|38|40)$/.test(evt.which) || /^[a-zA-Z0-9]$/.test(String.fromCharCode(evt.which)))) {
        return;
      }
      if (evt.which == 38 && hasResult) {
        keyBoardUp();
        return;
      }
      if (evt.which == 40 && hasResult) {
        keyBoardDown();
        return;
      }
      if (evt.which == 13) {
        var jQcur = jQresultLists.find('.cur a');
        if (jQcur.size()) {
          select(jQcur);
          return;
        }
        //若没有选择列表项，点击回车一律跳转到结果页
        jump();
        return;
      }
      if (evt.which == 27) {
        jQresult.hide();
        return;
      }

      doSearch();
    };

    //执行查询
    var doSearch = function() {
      jQnoResult.hide();
      jQresult.hide();
      clearTimeout(delaySearch);
      delaySearch = setTimeout(function() {
        //如果先输入特殊符号，再按空格就会去查询，这里再替换一次特殊符号
        inputInfo = replaceWords($.trim(jQinput.val()));
        if (!inputInfo || inputInfo == originValue) {
          return;
        }
        //检测 已经查询出结果的上次输入的文案 是否与 本次相同。 如果值相同并且查询正常，则显示对应的结果框。serverErr代表查询异常
        if (inputInfo === lastInput) {
          if (hasResult) {
            jQresult.show();
            return;
          } else if (!serverErr) {
            //在这里已经是 上次查询无结果，且 服务器正常，则显示没有查询到结果
            jQnoResult.show();
            return;
          }
        }
        lastInput = inputInfo;

        var params = {
          keyword : inputInfo
        };
        request.post(i.searchAll, params, function(ret) {
          jQrestLists.html('');
          jQfoodLists.html('');
          jQrestWords.hide();
          jQfoodWords.hide();
          if (ret.code == 0) {
            var  restInfo = ret.data.poiItems, foodInfo = ret.data.foodItems;
            if (!restInfo.length && !foodInfo.length) {
              hasResult = false;
              if (jQsearchBox.hasClass('focus')) {
                jQresult.hide();
                jQnoResult.show();
              }
              return;
            }
            jQnoResult.hide();
            if (restInfo && restInfo.length) {
              var restContent = '';
              for (var i = restInfo.length-1; i >= 0; i--) {
                restContent += template(poiTpl, {
                  name : utils.countChars(restInfo[i].name, 26, true),
                  name_unCount : restInfo[i].name,
                  id : restInfo[i].id,
                  pic_url : restInfo[i].pic_url,
                  avg_delivery_time : restInfo[i].avg_delivery_time
                });
              }
              jQrestWords.show();
              jQrestLists.show();
              jQrestLists.html(restContent);
            } else {
              jQrestLists.hide();
            }
            if (foodInfo && foodInfo.length) {
              var foodContent = '';
              for (var j = foodInfo.length-1; j >= 0; j--) {
                foodContent += template(foodTpl, {
                  name : utils.countChars(foodInfo[j].name, 18),
                  name_unCount : foodInfo[j].name,
                  poi_name : utils.countChars(foodInfo[j].poi_name, 14),
                  poi_name_unCount : foodInfo[j].poi_name,
                  id : foodInfo[j].id,
                  wm_poi_id : foodInfo[j].wm_poi_id,
                  price : utils.approximate(foodInfo[j].price)
                });
              }
              jQfoodWords.show();
              jQfoodLists.show();
              jQfoodLists.html(foodContent);

            } else {
              jQfoodLists.hide();
            }

            // 分界线
            if (restInfo.length && restInfo.length && foodInfo && foodInfo.length) {
              jQline.show();
            } else {
              jQline.hide();
            }

            hasResult = true;
            //显示之前查看是否焦点在输入框上
            if (jQsearchBox.hasClass('focus')) {
              jQresult.show();
            }
            //动态显示“美食”文字的高度
            if(restContent){
              jQfoodWords.css('margin-top', jQrestLists.outerHeight() - jQfoodWords.outerHeight()  + 'px');
            } else {
              jQfoodWords.css('margin-top', 0);
            }
          } else {
            //服务器出错导致的无法查询，会重新查询相同的输入数据
            serverErr = true;
            utils.showError('抱歉，查询失败...');
          }
        });
      },500);
    };

    //键盘up键，如果是列表中的第一个，再按就会取消选中
    var keyBoardUp = function() {
      var jQcur = jQresultLists.find('.cur'), jQprev = jQcur.prev();
      if (jQprev.size()) {
        jQprev.addClass('cur');
        jQcur.removeClass('cur');
      } else if (jQcur.parent().hasClass('food-lists') && jQrestLists.children().size()) {
        jQrestLists.children().last().addClass('cur');
        jQcur.removeClass('cur');
      } else {
        jQcur.removeClass('cur');
      }
    };

    //键盘down键，如果没有cur 就选中第一个
    var keyBoardDown = function() {
      var jQcur = jQresultLists.find('.cur');
      if (jQcur.size()) {
        var jQnext = jQcur.next();
        if (jQnext.size()) {
          jQnext.addClass('cur');
          jQcur.removeClass('cur');
        } else if (jQcur.parent().hasClass('rest-lists') && jQfoodLists.children().size()) {
          jQfoodLists.children().first().addClass('cur');
          jQcur.removeClass('cur');
        }
      } else {
        if (jQrestLists.children().size()) {
          jQrestLists.children().first().addClass('cur');
        } else if (jQfoodLists.children().size()) {
          jQfoodLists.children().first().addClass('cur');
        }
      }
    };

    //替换掉输入的特殊字符串
    var replaceWords = function(str) {
      var decodeForbiddenWords = [];
      forbiddenWords.forEach(function(item, index) {
        decodeForbiddenWords[index] = decodeURIComponent(item);
      });
      str = str.replace(/[\、\。\，\；\‘\“\：\》\《\？\￥\~\`\!\@\#\$\%\^\&\*\_\+\-\=\[\]\{\}:;\"\'\/\\\?,\.<>]/g, '');
      decodeForbiddenWords.map(function(val){
        str = str.replace(val, '');
      });
      return str;
    };

    //跳转到查找结果页面
    var jump = function() {
      var keyWord = replaceWords($.trim(jQinput.val()));
      if (keyWord) {
        window.location.href = "/search/rtofd?keyword=" + encodeURI(keyWord);
      }
      return false;
    };

    //回车某个li列表后的新页面打开跳转
    var select = function(cur) {
      var keyWord = encodeURI(replaceWords($.trim(jQinput.val()))),
          url = '/restaurant/' + cur.data('poiid') + '?from=search&keyword=' + keyWord,
          foodid = cur.data('foodid');
      if (foodid) {
        url += ('&wm_food_id=' + foodid + '#delicacy-' + foodid);
      }
      window.location.href = url;
      return false;
    };

    //点击li跳转
    var click = function() {
      var jQthis = $(this),
          keyWord = encodeURI(replaceWords($.trim(jQinput.val()))),
          url = '/restaurant/' + jQthis.data('poiid') + '?from=search&keyword=' + keyWord,
          foodid = jQthis.data('foodid');
      if (foodid) {
        url += ('&wm_food_id=' + foodid + '#delicacy-' + foodid);
      }
      window.location.href = url;
      return false;
    };

    var mouseMove = function() {
      var jQself = $(this);
      jQself.parents('.result-right').find('.cur').removeClass('cur');
      jQself.addClass('cur');
    };

    var focus = function(evt) {
      jQsearchBox.addClass('focus');
      if ($.trim(jQinput.val()) == originValue) {
        jQinput.val('');
      }
      evt.stopPropagation();
    };

    var blur = function() {
      jQsearchBox.removeClass('focus');
      if ($.trim(jQinput.val()) == '') {
        jQinput.val(originValue);
      }
      jQresult.hide();
      jQnoResult.hide();
    };

    var bindEvt = function() {
      jQsearchBox.on('click', jQinput, focus)
          .on('keyup', jQinput, inputFilter)
          .on('mouseover', '.result-right li', mouseMove)
          .on('click', '.result-right a', click);
      jQdoSearch.on('click', jump);
      $('html, body').on('click', blur);
    };

    bindEvt();
  };

  return search;
});
