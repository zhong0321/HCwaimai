/**
 * 閺屾劒閲滈崯鍡楊啀閻ㄥ嫯褰嶉崫浣稿灙鐞涖劑銆夐棃顤庣礉閸栧懏瀚禍鍡楊嚠閼挎粌鎼ч惃鍕杻閸掔姵鐓￠弨锟�*
 * @author xukai@meituan.com
 * @date 2014-03-21 閺勭喐婀℃禍锟介柌宥嗙�妞ょ敻娼伴崥鍕瀸閸旂喕鍏樼粵澶岀搼缂佸棜濡� */

require.config({
    baseUrl: MT.STATIC_ROOT + '/js'
});

require(['lib/jquery', 'lib/Class', 'util/template', 'module/general', 'module/bridge', 'module/dynamic', 'module/shopping/cart', 'module/interface', 'module/restaurant/restheader', 'module/restaurant/restwidgets', 'module/dialog/FoodSkuDialog', 'widget/dialog/SimpleDialog', 'tpl/busy', 'module/mtgs'], function($, Class, template, general, bridge, dynamic, cart, i, header, widgets, FoodSkuDialog, SimpleDialog, busyTpl, mtgs) {
    'use strict';

    var $window = $(window);

    // 濠婃艾濮╅崚鐗堝瘹鐎规氨娈戦弽鍥╊劮
    var onScrolling = false;
    var scrollToTab = function(evt) {
        var self = $(this);

        var targetAnchorTop = $('.category .title-' + self.data('anchor')).offset().top;
        onScrolling = true;
        $('html, body').animate({
            'scrollTop': targetAnchorTop + 1
        }, 1000, 'easeInOutCubic', function() {
            onScrolling = false;
        });

        foodTyepEl.find('.active').removeClass('active');
        orifoodTypeEl.find('.active').removeClass('active');

        var anchor = self.data('anchor');
        foodTyepEl.find('a[data-anchor=' + anchor + ']').parent().addClass('active');
        orifoodTypeEl.find('a[data-anchor=' + anchor + ']').parent().addClass('active');

        // 鐏忓棙鐖ｇ粵楣冦�閻ㄥ嫮鍋ｉ崙璁崇皑娴犺泛濮為崗顨刟閺佺増宓佺紒鐔活吀
        var delegateTarget = $(evt.delegateTarget);
        if (delegateTarget.hasClass('foodtype-nav')) {
            ga('send', 'event', 'button', 'click', 'food-type link');
        }
    };


    // 缁愭褰涘姘З閻ㄥ嫭妞傞崐娆愬付閸掕埖鐖ｇ粵鎯у灙鐞涖劎娈戦崥鎼併�
    var typeContent = $('.food-nav'),
        titleEls = typeContent.find('.title'),
        blankTitleEl = typeContent.find('.title-blank');

    var titleTop = [],
        contentHeight = [],
        stitleTop, titleCount = titleEls.size();
    titleEls.each(function(rank, titleEl) {
        var topoffset = $(titleEl).offset().top;
        titleTop.push(topoffset);
        contentHeight.push($(titleEl).parent().height());
        if (rank == 0) {
            stitleTop = topoffset;
        }
    });

    var loadTi;
    var fixTop = function() {
        /* if (!-[1,]&&!window.XMLHttpRequest) {
         return;
         } */

        var scrollTop = $(window).scrollTop();
        if (isfoodTypeBlock) {
            foodTyepEl.hide();
            loadTi && clearTimeout(loadTi);
            loadTi = setTimeout(function() {
                if (!isfoodTypeBlock) {
                    return;
                }

                var target;
                if (scrollTop < stitleTop || scrollTop + 50 > stitleTop + typeContent.height()) {
                    target = typeContent.find('.title-0 .classic');
                } else {
                    target = blankTitleEl.find('.classic');
                }

                foodTyepEl.show().css({
                    'top': target.offset().top + 35,
                    'left': target.offset().left - 411
                });
            }, 500);
        }

        if (scrollTop < stitleTop || scrollTop + 50 > stitleTop + typeContent.height()) {
            foodTyepEl.hide();
            blankTitleEl.hide();
            isfoodTypeBlock = false;
        } else {
            for (var j = 0; j < titleCount; j++) {
                var currentTop = titleTop[j];
                if (scrollTop > currentTop && scrollTop < currentTop + contentHeight[j]) {

                    // 閺囧瓨鏌婃径鎾劥閺嶅洨顒烽惃鍕繆閹垽绱欓弽鍥╊劮閻ㄥ嫬鎮曠粔鏉挎嫲閸ョ偓鐖ｉ敍灞筋渾閺嬫粍婀侀惃鍕樈閿涳拷                    var taraEl = blankTitleEl.find('.tag-na'),
                        oriaEl = titleEls.eq(j).find('.tag-na'),
                        oriiEl = titleEls.eq(j).find('.i-ph17x17, .online-pricetag');
                    taraEl.text(oriaEl.text());
                    blankTitleEl.find('.i-ph17x17, .online-pricetag').remove();
                    if (oriiEl.size()) {
                        taraEl.before(oriiEl.clone());
                    }
                    break;
                }
            }
            blankTitleEl.show();
        }
    };

    var foodSkuDlg;
    var foodSkuDlgId = 0;

    //瑜版挸鑴婂鍡楀彠闂傤厾娈戦弮璺猴拷閿涘矁袝閸欐垵缍嬮弮鏈电稊閻劎娈戦幐澶愭尦閸ョ偛顦鹃悩鑸碉拷
    bridge.register('FoodSkuDialog:destroy', function(options) {
        var jQtrigger = options.jQtrigger;
        jQtrigger.removeClass('addcart-expand');
        foodSkuDlg = null;
        foodSkuDlgId = 0;
    });

    //閻愮懓鍤い鐢告桨閻ㄥ嫬鍙剧�鍐ㄦ勾閺傜櫢绱濋崗鎶芥４瀵顢�    $('body').on('click', function(evt) {
        var target = evt.target;
        if (foodSkuDlg != null) {
            var jQdlgTrigger = foodSkuDlg.getjQtrigger();
            var jQdlg = foodSkuDlg.getjQelem();
            var jQfoodItem = jQdlgTrigger.parents('.j-pic-food,.j-text-food'); //閻愮懓鍤懣婊冩惂妞ょ懓鎷板瑙勵攱閸愬懍绗夋导姘彠闂傤厼鑴婂锟�           if (jQfoodItem.get(0) != target && jQfoodItem.find(target).size() == 0 && jQdlg.get(0) != target && jQdlg.find(target).size() == 0) {
                foodSkuDlg.destroy();
            }
        
    });

    // 缂佹瑨褰嶉崫浣稿綁闁插繐濮炴稉濠傜毈閻炲啰娈戦崣鍌涙殶
    var foodCarryBall = function(foodParam, jQbeginButton) {
        var endX = $('.shopping-cart').offset().left + 30,
            endY = $(window).height() - 35,
            x0 = jQbeginButton.offset().left + 5,
            y0 = jQbeginButton.offset().top - $(window).scrollTop();
        var cartBallInfo = {
            endX: endX,
            endY: endY,
            x0: x0,
            y0: y0
        };
        foodParam.cartBallInfo = cartBallInfo;
    };

    // 濞ｈ濮為懣婊冩惂閸掓媽鍠橀悧鈺勬簠
    var foodToCart = function(evt) {
        var self = $(this);
        if (self.find('.tips').size()) {
            return;
        }
        var jQaddButton = self.hasClass('j-addcart') ? self : self.find('.j-addcart'); //閻㈠彉绨瑂elf娑撳秳绔寸�姘Цbutton閿涘本鏅犵�姘秴鏉╂瑤閲渂utton閿涘苯鎮楅棃銏㈡畱瀵顢嬫担宥囩枂娓氭繆绂嗙�锟�       var targetParas;
        var skuDlgAllignType = 'topleft'; //閸ュ墽澧栭崪灞炬瀮鐎涙娈戝瑙勵攱娴ｅ秶鐤嗘稉宥呮倱
        try {
            targetParas = JSON.parse(self.find('script').html());
        } catch (e) {;
        }
        if (!targetParas) {
            try {
                targetParas = JSON.parse(self.parents('.pic-food').find('script').html());
                skuDlgAllignType = 'bottomright';
            } catch (e) {;
            }
        }

        if (targetParas) {
            if ((targetParas.sku && targetParas.sku.length > 1) || targetParas.attr) { //婵″倹鐏夐懣婊冩惂鐢附婀乻ku娣団剝浼�                if (foodSkuDlgId == targetParas.id) { //閻愮懓鍤崥灞肩娑擃亝瀵滈柦顕嗙礉閸掓瑦澧﹀锟藉綁閹存劕鍙ч梻锟�                   if (foodSkuDlg != null) {
                        foodSkuDlg.destroy();
                    }
                } else {
                    if (foodSkuDlg != null) {
                        foodSkuDlg.destroy(); //閸忔娊妫撮崗璺虹暊閻ㄥ嫬鑴婂锟�                   }
                    jQaddButton.addClass('addcart-expand');
                    foodSkuDlg = new FoodSkuDialog({
                        data: targetParas,
                        jQtrigger: jQaddButton,
                        alignType: skuDlgAllignType
                    });
                    foodSkuDlgId = targetParas.id;
                    bridge.register('sc:beforeAdd', function(params) {
                        foodCarryBall(params, foodSkuDlg.getjQAddBtn());
                    });
                }
             else if (targetParas.onSale == 1) {
                foodCarryBall(targetParas, jQaddButton);
                if (targetParas.sku && targetParas.sku.length === 1) { //閸楁洑绔寸憴鍕壐閻ㄥ嫯褰嶉崫渚婄礉閺嶈宓侀幒銉ュ經缁撅箑鐣鹃敍灞藉絿閺佹壆绮嶉惃鍕儑娑擄拷閲�                    targetParas.sku = targetParas.sku[0];
                }
                bridge.trigger('sc:add', targetParas);
            }
        }
    };

    //閼挎粌鎼ч弫浼村櫤閸欐ɑ娲块敍宀�祲鎼存梻娈戦弰鍓с仛娑旂喎褰夐弴锟�   var foodNumAltered = function(foodParas) {
        var foodId = foodParas.foodId,
            foodKey = foodParas.foodKey,
            foodNum = foodParas.foodNum,
            jQdisplay = $('#food' + foodId + '-cart-num');
        var cartNum = jQdisplay.data('cartNum') || {};
        cartNum[foodKey] = foodNum;
        jQdisplay.data('cartNum', cartNum);
        var totalFoodNum = 0;
        for (var i in cartNum) {
            if (cartNum[i] > 0) {
                totalFoodNum += parseInt(cartNum[i], 10);
            }
        }
        jQdisplay.text(totalFoodNum);
        (totalFoodNum == 0) ? jQdisplay.hide(): jQdisplay.show();
        });
    // 姒х姵鐖ｇ粔璇插З閸滃瞼些閸戠儤鐓囨稉顏呯垼缁涘墽娈戞禍瀣倵濞ｈ濮為崪灞藉灩闂勵槨ver缁鎮�    // 閺嶅洨顒锋い鐢垫祲閸忚櫕鎼锋担婊冨敶鐎瑰綊鍎撮崚锟�   var foodtypeTpl = document.getElementById('foodtype-template');
    var foodTyepEl = $(foodtypeTpl.innerHTML);
    $('body').append(foodTyepEl);

    var isfoodTypeBlock = false;
    var toggleOverAdd = function(evt) {
        var self = $(this);

        self.addClass('over');
        if (self.hasClass('classic')) {
            var target = $(evt.currentTarget);
            foodTyepEl.show().css({
                'top': target.offset().top + 35,
                'left': target.offset().left - 411
            });
            isfoodTypeBlock = true;
        }
    };

    var toggleOverRev = function() {
        $(this).removeClass('over');
    };

    var hideTagDialog = function() {
        if (!onScrolling) {
            foodTyepEl.hide();
            isfoodTypeBlock = false;
        }
    };

    // 鐠佸墽鐤嗙捄瀹犳祮閻ㄥ嫰鏁嬮悙锟�   var setAnchor = function(evt) {
        evt.preventDefault();
        var self = $(this);
        if (self.hasClass('active')) {
            return;
        }

        var scrollTop = $window.scrollTop();
        location.href = self.data('href') + '#' + scrollTop;
    ;

    var locateHash = function() {
        var hash = location.hash || 0;
        if (hash) {
            // 婵″倹鐏夐弰顖滃仯閸戞槒褰嶉崫浣界儲鏉烆剝绻冮弶銉ф畱閻╁瓨甯寸捄鍐插煂閼挎粌鎼ф稉濠忕礉婵″倹鐏夐弰顖涘笓鎼村繐鍩涢弬鎵畱閿涘苯鍨捄瀹犳祮閸掔増甯撴惔蹇氼唶瑜版洖婀撮悙锟�           if (/(#delicacy\-)/.test(hash)) {
                var foodId = hash.replace(/[^\d]/g, '');
                var jQfood = $('#' + foodId);
                if (jQfood.size()) {
                    $window.scrollTop(jQfood.offset().top - 400);
                }
                return;
            }
            $window.scrollTop(hash.slice(1));
        }
    ;

    // 妞佹劕宸鸿箛娆戞畱瀵湱鐛ラ幓鎰仛
    var busyAlert = function() {
        var isBusy = JSON.parse($('#j-isBusy-flag').html());
        if (isBusy.busyFlag) {
            var opts = {
                'klass': 'dialog-accept',
                'title': '閹绘劗銇�,
                'content': busyTpl
            };
            var dialog = new SimpleDialog(opts);
            dialog.show();

            dialog.find('.carry-on').click(function() {
                dialog.destroy();
            });
        }
    };

    // PV
    var sendPageView = function() {

        var poi_id = $("[data-pv-flag='1']").attr('data-poi-id');
        LXPV('c_CijEL', function(valLab) {
            // TODO: cat_id
            valLab = $.extend(valLab, {
                'ct_poi': '',
                'stid': '',
                'poi_id': poi_id,
                'cat_id': '',
                'activityid': '',
                'custom': {
                    'user_id': $.cookie('u') ? $.cookie('u') : '',
                    'ys': '',
                    'ys_id': '',
                },
            });
            return valLab;
        });
    };

    // 娴滃娆㈢紒鎴濈暰
    var textFood = $('.text-food'),
        picFood = $('.pic-food'),
        orifoodTypeEl = $('.ori-foodtype-nav');
    var bindEvt = function() {
        typeContent.find('.actions a').mouseover(toggleOverAdd).mouseleave(toggleOverRev).click(setAnchor);
        bridge.register('sc:foodChange', foodNumAltered);
        //濞夈劌鍞介懣婊冩惂閺佷即鍣洪崣妯绘纯娴滃娆�        foodTyepEl.mouseleave(hideTagDialog).delegate('.type', 'click', scrollToTab);
        orifoodTypeEl.delegate('.type', 'click', scrollToTab);

        textFood.hover(toggleOverAdd, toggleOverRev).click(foodToCart);
        picFood.hover(toggleOverAdd, toggleOverRev).delegate('.add', 'click', foodToCart);
        $window.on('scroll', fixTop);
    };
    var announcement = function() {
        var cityId = (window.getCookie("w_cid") || '').slice(0, 3);
        var cityName = window.getCookie("w_cpy");
        var ANNOUNCE_HTML = mtgs.ANNOUNCE_HTML;

        if (true || cityId == "110" || cityName == "beijing") {
            var newDiv = document.createElement('div');
            newDiv.innerHTML = ANNOUNCE_HTML;
            var topNode = document.getElementById('announcement-area');
            topNode.appendChild(newDiv);
        }
    }
    bindEvt();
    announcement();
    locateHash();
    fixTop();
    cart.tellFoodsStatus();
    busyAlert();
    sendPageView();
);