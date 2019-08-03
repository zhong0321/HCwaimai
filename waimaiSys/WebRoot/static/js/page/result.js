/**
 * 搜索结果页面功能。
 *
 * @author moumingyi@meituan.com
 * @date 2014-11-04 星期二
 */

require.config({
  baseUrl : MT.STATIC_ROOT + '/js'
});

require(['lib/jquery', 'module/general', 'util/utils', 'module/addtocart', 'module/interface', 'util/request', 'module/bridge', 'module/dialog/FoodSkuDialog'], function($, general, utils, add, i, request, bridge, FoodSkuDialog) {
  'use strict';

  var jQbox = $('.inner-wrap .result-wrap');

  // 搜索结果 页面 通用
  var keyWord = decodeURI(utils.urlParams(location.href)['keyword']);

  // 切换结果页面的tab
  var changePage = function() {
    var jQself = $(this);
    if (jQself.hasClass('cur-sort')) {
      return;
    }
    var geoid = jQself.data('geoid');
    if (jQself.hasClass('food')) {
      location.href = "/search/"+geoid+"/fd?keyword=" + encodeURI(keyWord);
    } else {
      location.href = "/search/"+geoid+"/rt?keyword=" + encodeURI(keyWord);
    }
    //兼容ie6 location不跳转问题
    return false;
  };

  // 美食结果 页面 start
  var foodRestaurantMap = {}; //由于sku选择弹框比较独立，确定选择后并没有返回poi的信息，得通过foodId反查，故设置一个反查表
  var foodSkuDlg;
  var foodSkuDlgId = 0;

  // 添加菜品到购物车
  var addToCart = function(evt) {
    var jQbutton = $(this),
        jQparent = jQbutton.parents('li'),
        poiid = jQparent.data('poiid'),
        foodid = jQparent.data('foodid');
    var param = {
      poiid : poiid,
      foodid : foodid
    };
    var dataJsonStr = jQparent.find('script').html();
    var targetParas;
    try {
      targetParas = JSON.parse(dataJsonStr);
    } catch (e) {
      ;
    }
    request.post(i.searchFoodBuy, param, function() {
      if ((targetParas.sku && targetParas.sku.length>1) || targetParas.attr) { //含有sku，出sku选择框
        if (!foodRestaurantMap[targetParas.id]) {
          foodRestaurantMap[targetParas.id] = {
            poiid : jQparent.data('poiid'),
            poiname : jQparent.data('poiname')
          };
        }
        if (foodSkuDlgId == targetParas.id) {  //点击同一个按钮，则打开变成关闭
          if (foodSkuDlg!=null) {
            foodSkuDlg.destroy();
          }
        } else {
          if (foodSkuDlg!=null) {
            foodSkuDlg.destroy();  //关闭其它的弹框
          }
          foodSkuDlg = new FoodSkuDialog({
            data : targetParas,
            jQtrigger : jQbutton,
            alignType : 'bottomright'
          });
        }
      } else {  //保持原来的点菜方式
        add.addToCart({
          'jump' : true,
          'foodInfo' : dataJsonStr,
          'poiid' : jQparent.data('poiid'),
          'poiname' : jQparent.data('poiname')
        });
      }
    });
    evt.preventDefault();
    evt.stopPropagation();
  };

  //当弹框关闭的时候
  bridge.register('FoodSkuDialog:destroy', function(options) {
    foodSkuDlg = null;
    foodSkuDlgId = 0;
  });
  //点击页面的其它地方，关闭弹框
  $('body').on('click', function(evt) {
    var target = evt.target;
    if (foodSkuDlg != null) {
      var jQdlgTrigger = foodSkuDlg.getjQtrigger();
      var jQdlg = foodSkuDlg.getjQelem();
      if (jQdlgTrigger.get(0)!=target && jQdlgTrigger.find(target).size()==0 && jQdlg.get(0)!=target && jQdlg.find(target).size()==0) {
        foodSkuDlg.destroy();
      }
    }
  });
  // sku选择框确认选择后会触发sc:add事件
  bridge.register('sc:add', function(foodSkuInfo) {
    if (foodSkuDlg) foodSkuDlg.destroy();
    var restaurantInfo = foodRestaurantMap[foodSkuInfo.id];
    var options = {
      'jump' : true,
      'foodInfo' : foodSkuInfo,
      'poiid' : restaurantInfo.poiid,
      'poiname' : restaurantInfo.poiname
    };
    add.addToCart(options);
  });

  // 餐厅结果 页面 start
  var mouseIn = function() {
    $(this).addClass('hover');
  };

  var mouseOut = function() {
    $(this).parent().find('.hover').removeClass('hover');
  };

  //绑定事件
  var bindEvt = function() {
    jQbox.on('mouseenter', '.rest-list', mouseIn)
         .on('mouseleave', '.rest-list', mouseOut)
         .on('click', '.result-sort', changePage)
         .on('click', '.buy', addToCart);
  };

  // PV
  var sendPageView = function() {
    LXPV('c_nfqbfvw', function(valLab) {
      valLab = $.extend(valLab, {
          'stid': '',
          'keyword': keyWord,
          'custom': {
            'label_word': ''
          },
      });
      return valLab;
    });
  }

  bindEvt();
  sendPageView();
});
