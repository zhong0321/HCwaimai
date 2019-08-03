/**
 *  ��̬�����̼��б�ͬʱʵ��ͼƬ������
 *
 *  @author jinweigang@meituan.com
 *  @date 2016-04-07
 */

define(['lib/jquery', 'module/bridge', 'module/general','util/utils', 'util/cookie'], function($, bridge, general, utils, Cookie) {
  'use strict';

  var TIMER      = null;
  var ICON_LEN   = 0;
  var IS_LOADING = false;
  var HAS_MORE   = true;
  var CLASSIFY   = ['cate_all'];

  // ���ּ��ܻش�����: mtsi_font_css_version
  var CSS_REG = /^[\s\S]*\/font\/(\S*)\.eot[\s\S]*$/;
  var mtsi_font_css_version = '';
  if (window.cssResource) {
    mtsi_font_css_version = window.cssResource.match(CSS_REG)[1];
  }
  var PARAM      = {
    classify_type: '',
    sort_type: 0,
    price_type: 0,
    support_online_pay: 0,
    support_invoice: 0,
    support_logistic: 0,
    page_offset: 21,
    page_size: 20,
    mtsi_font_css_version: mtsi_font_css_version
  };

  //DOM����
  var DOMS = {
    container   : $(window),
    body        : $('body,html'),
    restList    : $('.rest-list ul'),
    cateFilter  : $('.imgsort-list'),
    restFilter  : $('.rest-filter a'),
    sortFilter  : $('.sort-filter .sort'),
    priceFilter : $('.prices li a'),
    priceBox    : $('.prices .all')
  };

  /**
   * @function preload
   * @description Ԥ����ͼƬ
   * @param {el} ��ǰimg����
   * @param {callback} ͼƬ������Ϻ�Ļص�����
   */
  var preload = function(el, callback) {
    var src = el.data('src');

    var i = new Image();
    //����һ��Image����ʵ��ͼƬ��Ԥ����
    i.onload = function() {
      i.onload = null;
      if (callback) {
        callback(src, {
          width: i.width,
          height: i.height
        });
      }
      el.data('loaded', 1);
    };
    i.src = src;
  };

  /**
   * @function loading
   * @description ѭ��������ͼƬ���д���
   */
  var loading = function() {
    var els = [];
    $.each($('.scroll-loading'), function(i, el) {
      el = $(el);
      if (el.data('loaded') != 1) {
        preload(el, function(src, options) {
          // �������max-width��max-height�����Զ����ž���
          var imgWidth = options.width;
          var imgHeight = options.height;
          var maxWidth = el.data('max-width');
          var maxHeight = el.data('max-height');
          if (maxWidth && maxHeight && imgWidth && imgHeight) {
            var maxRate = maxWidth / maxHeight;
            var imgRate = imgWidth / imgHeight;
            if (imgRate <= maxRate) {  // �ݸ��ͣ����Ҿ���
              imgHeight = maxHeight;
              imgWidth = imgHeight * imgRate;
            } else {  // �����ͣ����¾���
              imgWidth = maxWidth;
              imgHeight = imgWidth / imgRate;
            }

            el.css({
              width: imgWidth+'px',
              height: imgHeight+'px'
            });
          }
          el.attr('src',src);

        });

        // ��ͳ��������ŵ�
        els.push(el);
      }
    });
    if (els.length != 0) {
      bridge.trigger('log:home', els);
    }
  };

  //�̼�ģ��ƴ��
  var template = {
    //���������ڷ��ؿ��ַ���
    judgeNull: function(data, type){
      var tag = null;
      tag = type == 'num' ? 0 : '';
      return data ? data : tag;
    },
    //tag��ǩѭ��ƴ��
    loopTag: function(arr){
      var tagList = '';
      if(!arr.length) return tagList;
      arr.map(function(item, index) {
        tagList += (' data-' + item + '="1"');
      });
      return tagList;
    },

    //Ԥ��
    preview: function(data,index){
      var html,url,newRest;
      url = (data.pic_url && data.pic_url != "") ? data.pic_url : '//s3plus.sankuai.com/v1/mss_3bdfec648fc242aa88aace768b85ae32/waimai-web/poidefault_1.png';
      newRest = (data && data.new_promotion==1) ? '<div class="rest-tag rest-tag-new">�µ�</div>' : '';
      html = '<div class="preview">\
                <img data-rid="' + template.judgeNull(data.wm_poi_id) + '" data-index="' + index + '" class="scroll-loading" src="//s3plus.sankuai.com/v1/mss_3bdfec648fc242aa88aace768b85ae32/waimai-web/a.gif" data-src="' + url + '" data-max-width="208" data-max-height="156"  />\
                <div class="rest-tags">\
                  <!-- ���̼���ʾicon -->\
                  ' + newRest + '\
                </div>\
              </div>';
      return html;
    },

    shipping: function(data){
      var html, busy, scoreNum, saleNum;
      var score = (data.wmPoi4Web.wm_poi_score)/5 * 60,
          scoreEmpty = data.wmPoi4Web.wm_poi_score * 3;
      scoreNum = data.wmPoi4Web.wm_poi_score > 0 ? data.wmPoi4Web.wm_poi_score.toFixed(1)+'��'  : '����';

      if(data.busy){
        busy = '<div class="outof-sale busycolor">æµ��</div>';
      } else {
        busy = '<div class="timer-tip"><span class="timer cc-lightred-new">����Ԥ����' + template.judgeNull(data.shipping_time_info.beg_shipping_time) + '��ʼ�Ͳ�</span></div>';
      }

      if(data.wmPoi4Web.status != 3){
        if (data.wmPoi4Web.month_sale_num == 0) {
          saleNum = '<span class="total cc-lightred-new fr"></span>';
        } else if(data.wmPoi4Web.month_sale_num <= 200000) {
          saleNum = '<span class="total cc-lightred-new fr">����' + template.judgeNull(data.wmPoi4Web.month_sale_num) + '��</span>';
        } else {
          saleNum = '<span class="total cc-lightred-new fr">����200000+��</span>';
        }
      }

      if (data.shipping_time_info.in_shipping_time==0 && data.wmPoi4Web.status!=3) {
        html = busy;
      } else if (data.wmPoi4Web.status == 3) {
        html = '<div class="outof-sale">��Ϣ�У������ܶ���</div>';
      } else {
        html = '<div class="rank clearfix">\
                      <span class="star-ranking fl">\
                        <span class="star-score" style="width: '+ (score + scoreEmpty) + 'px"></span>\
                      </span>\
                      <span class="score-num fl">' + scoreNum + '</span>\
                    </div>';
      }
      return html;
    },

    //����
    content: function(data){
      var html='', busy='', shipping='', shippingFee='', shippingTime='', scoreNum='', saleNum='';

      if (data.wmPoi4Web.wmCPoiLbs.shipping_fee != 0) {
        shippingFee = '<span class="send-price mtsi-num">���ͷ�:��' + template.judgeNull(data.shipping_fee_encoded) + '</span>';
      } else {
        shippingFee = '<span class="send-price">�����ͷ�</span>';
      }

      if (data.shipping_time_info.in_shipping_time != 0) {
        if (data.wmPoi4Web.avg_delivery_time == 0) {
          shippingTime = '����';
        } else if(data.wmPoi4Web.avg_delivery_time <= 50) {
          shippingTime = data.avg_delivery_time_encoded + '����';
        } else {
          shippingTime = '50+����';
        }
      }
      html = '<div class="content">\
                  <div class="name">\
                    <span title="' + template.judgeNull(data.wmPoi4Web.name) + '">' + utils.countChars(data.wmPoi4Web.name, 22) + '</span>\
                  </div>\
                  ' + this.shipping(data) + '\
                  <div class="price">\
                    <span class="start-price mtsi-num">����:��' + template.judgeNull(data.min_price_encoded, 'num') + '</span>\
                    ' + shippingFee + '\
                    <span class="send-time mtsi-num"><i class="icon i-poi-timer"></i>' + shippingTime + '</span>\
                  </div>\
                </div>';
      return html;
    },
    //��������
    logistic: function(data){
      var html = '';
      if(data.logistic_type && data.logistic_type==1){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-delivery"></i>';
        }
        html += '<script type="text/template" data-icon="i-delivery">������ר���ṩרҵ��Ʒ���Ͳͷ���</script>';
      }
      return html;
    },

    //����֧��
    onlinePay: function(data){
      var html = '';
      if(data.wmPoi4Web.support_pay && data.wmPoi4Web.support_pay > 0){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-pay"></i>';
        }
        html += '<script type="text/template" data-icon="i-pay">���̼�֧������֧��</script>';
      }
      return html;
    },

    //֧�ִ���ȯ
    coupon: function(data){
      var html = '';
      if(data.actInfoVo && data.actInfoVo.use_coupon_marketing_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-ticket"></i>';
        }
        html += '<script type="text/template" data-icon="i-ticket">�ò���֧��ʹ�ô���ȯ<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //���û��µ���ȯ
    sendCoupon: function(data){
      var html = '',
          price = '',
          arr=[];
      var couponTip = '���û��µ�����';

      if(data.actInfoVo && data.actInfoVo.first_order_send_coupon_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-fan"></i>';
        }
        data.actInfoVo.first_order_send_coupon_logo.details.map(function(item) {
          price = item.coupon_price ? item.coupon_price.toFixed(1)+'Ԫ' : '';
          couponTip = couponTip + item.coupon_count + price;
          if(item.coupon_type == 1){
            couponTip += '����ȯ';
          } else {
            couponTip += '֧�����';
          }
          arr.push(couponTip);
        });

        html += '<script type="text/template" data-icon="i-fan">' + arr.join(',') +'<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //֧�ַ�Ʊ
    supportInvoice: function(data){
      var html = '';
      if(data.wmPoi4Web.invoice_support == 1){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-cheque"></i>';
        }
        html += '<script type="text/template" data-icon="i-cheque">֧�ֿ���Ʊ����Ʊ���'+data.wmPoi4Web.invoice_min_price+'Ԫ�������µ�ʱ��÷�Ʊ̧ͷ��'+template.judgeNull(data.wmPoi4Web.invoice_description)+'</script>';
      }
      return html;
    },

    //�°��ײ����Ż�
    fullDonation: function(data){
      var html = '',
          text = '';
      if(data.actInfoVo && data.actInfoVo.full_donation_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-free-gift"></i>';
        }
        if (data.actInfoVo.full_donation_logo && data.actInfoVo.full_donation_logo.full_price <= 0.000001) {
          text = '�µ�����' + template.judgeNull(data.actInfoVo.full_donation_logo.gift_name);
        } else {
          text = 'ÿ����' + template.judgeNull(data.actInfoVo.full_donation_logo.full_price) + 'Ԫ����' + template.judgeNull(data.actInfoVo.full_donation_logo.gift_name);
        }
        html += '<script type="text/template" data-icon="i-free-gift">' + text + '<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //�׵�����
    firstOrder: function(data){
      var html = '';
      if(data.actInfoVo && data.actInfoVo.first_order_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-first"></i>';
        }
        html += '<script type="text/template" data-icon="i-first">���û��״��µ�,����' + template.judgeNull(data.actInfoVo.first_order_logo.discount,'num') + 'Ԫ<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //��������
    fullDiscount: function(data){
      var html = '',
          discountTip = '',
          arr = [];

      if(data.actInfoVo && data.actInfoVo.full_discount_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-minus"></i>';
        }
        data.actInfoVo.full_discount_logo.discount_detail.map(function(item) {
          discountTip = discountTip + '��' + item.limit_price+'Ԫ��' + template.judgeNull(item.discount,'num').toFixed(0) + 'Ԫ';
          if(item.online_discount > 0.000001){
            discountTip = discountTip + ',����֧���ټ�' + template.judgeNull(item.online_discount,'num').toFixed(0);
          }
          arr.push(discountTip);
        });

        html += '<script type="text/template" data-icon="i-fan">' + arr.join(';') +'<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //��ʱ�⸶
    overTime: function(data){
      var html = '',
          specailMealTip = '';
      if(data.actInfoVo && data.actInfoVo.compensate_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-reimbursement"></i>';
        }
        specailMealTip = '�ò���֧�ֳ�ʱ�⸶�,��' + data.actInfoVo.compensate_logo.minutes+'����'+data.actInfoVo.compensate_logo.discount+'��'
             + data.actInfoVo.compensate_logo.note+'��Ԥ�����������볬ʱ�⸶��';
        html += '<script type="text/template" data-icon="i-reimbursement">' + specailMealTip + '<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //Ԥ�����Ż�
    aheadDiscount: function(data){
      var html = '',
          aheadTip = '',
          arr = [];

      if(data.actInfoVo && data.actInfoVo.ahead_discount_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-ding"></i>';
        }
        data.actInfoVo.ahead_discount_logo.ahead_discount_detail.map(function(item) {
          aheadTip = aheadTip + item.start_time + '-' + item.end_time+'�µ���'+item.discount+'Ԫ';
          arr.push(aheadTip);
        });

        html += '<script type="text/template" data-icon="i-ding">' + arr.join(';') +'<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //���ӵּ�ȯ�Ż�
    couponDiscount: function(data){
      var html = '';
      if(data.actInfoVo && data.actInfoVo.coupon_discount_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-di"></i>';
        }
        html += '<script type="text/template" data-icon="i-di">�ò���֧��ʹ�õּ�ȯ���õּ�ȯ���Ϳɵ�' + template.judgeNull(data.actInfoVo.coupon_discount_logo.discount).toFixed(1) + 'Ԫ<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //֧��ʹ�ô���ȯ
    supportCoupon: function(data){
      var html = '';
      if(data.is_fst5coupon_act == 1){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-ticket fl"></i>';
        }
        html += '<script type="text/template" data-icon="i-ticket">����֧��ʹ�ô���ȯ</script>';
      }
      return html;
    },

    //�����ײ���Ʒ
    mealsDonation: function(data){
      var html = '',
          mealsTip = '';

      if(data.actInfoVo && data.actInfoVo.meals_donation_enjoyed && data.actInfoVo.meal_donation_logos && data.actInfoVo.meal_donation_logos.length!=0){
        data.actInfoVo.meal_donation_logos.map(function(item, index) {
          if ((7 - ICON_LEN - index - 1) > -1 ) {
            html += '<i class="i-ph17x17"><img src="' + template.judgeNull(item.pic_url) + '" height="17" width="17"></i>';
          }
          html += '<script type="text/template" data-icon="i-ph17x17"  data-pic="' + template.judgeNull(item.pic_url) + '">' + template.judgeNull(item.description) + '<span class="special">(�ֻ��ͻ���ר��)</span></script>';
        });
        ICON_LEN += data.actInfoVo.meal_donation_logos.length;
      }
      return html;
    },

    //�����ؼ��ײ� xԪ�ܱ�
    specialMeal: function(data){
      var html = '',
          mealsTip = '';

      if(data.actInfoVo && data.actInfoVo.special_meal_enjoyed && data.actInfoVo.special_meal_logos && data.actInfoVo.special_meal_logos.length!=0){
        data.actInfoVo.special_meal_logos.map(function(item, index) {
          if ((7 - ICON_LEN - index - 1) > -1 ) {
            ICON_LEN++;
            html += '<i class="i-ph17x17"><img src="' + template.judgeNull(item.pic_url) + '" height="17" width="17"></i>';
          }
          html += '<script type="text/template" data-icon="i-ph17x17"  data-pic="' + template.judgeNull(item.pic_url) + '">' + template.judgeNull(item.act_price).toFixed(1) + 'Ԫ�ܱ�<span class="special">(�ֻ��ͻ���ר��)</span></script>';
        });
        ICON_LEN += data.actInfoVo.meal_donation_logos.length;
      }
      return html;
    },

    //�����������
    fullSendCoupon: function(data){
      var html = '',
          fullSend = '',
          arr = [];

      if(data.actInfoVo && data.actInfoVo.full_send_coupon_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-fan"></i>';
        }
        data.actInfoVo.ahead_discount_logo.ahead_discount_detail.map(function(item) {
          fullSend = fullSend +'֧�����' + item.full_price+'Ԫ��'+template.judgeNull(item.coupon_price).toFixed(1)+'Ԫ���';
          arr.push(fullSend);
        });

        html += '<script type="text/template" data-icon="i-fan">' + arr.join(';') +'<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //������
    randomCoupon: function(data){
      var html = '';
      if(data.actInfoVo && data.actInfoVo.random_red_package_enjoyed){
        if (ICON_LEN < 7) {
          ICON_LEN++;
          html += '<i class="icon i-fan"></i>';
        }
        html += '<script type="text/template" data-icon="i-fan">�µ���ѡ������֧���������' + template.judgeNull(data.actInfoVo.random_red_package_logo.max).toFixed(1) + 'Ԫ�ֻ�APPר��֧�����<span class="special">(�ֻ��ͻ���ר��)</span></script>';
      }
      return html;
    },

    //�Ƿ��ղ��̼�
    collection: function(data){
      var html = '';
      if(data.favorite_restaurant_flag && data.favorite_restaurant_flag=='YES'){
        html = '<a href="javascript:;" class="favorite j-save-up" data-poiid="' + template.judgeNull(data.wm_poi_id_str) + '" title="ȡ���ղ�">\
                    <i class="icon i-poi-fav2"></i>\
                </a>';
      } else {
        html = '<a href="javascript:;" class="un-favorite j-save-up" data-poiid="' + template.judgeNull(data.wm_poi_id_str) + '" title="�ղ��̼�">\
                    <i class="icon i-poi-fav1"></i>\
                </a>';
      }
      return html;
    },

    actInfoVos: function(data) {
        var html='',
            actInfoVos = data.actInfoVos;

        if(actInfoVos.length > 0) {
            for(var i = 0; i<actInfoVos.length;i++) {
               html += '<i class="icon" style="width:17px;height:17px;background:none;">'+
                           '<img src="'+ actInfoVos[i].iconUrl +'" style="display:block;width:100%;"/>'+
                      '</i>' +
                       '<script type="text/template">'+
                          '<i class="icon" style="width:17px;height:17px;margin:0 10px 0 -28px;background:none;">'+
                             '<img src="'+ actInfoVos[i].iconUrl +'" style="display:block;width:100%;"/>'+
                          '</i>' +
                          actInfoVos[i].text +
                          '<span class="special">(�ֻ��ͻ���ר��)</span>'+
                       '</script>';
            }
        }
        return html;
    },

    //��dom�ṹ
    main: function(data,hasmore){
      var html = '',
          restMask = '';
      var split = '<li class="rest-separate j-rest-separate"></li>';
      var noData = '<div class="no-rests"><div class="tip borderradius-2">û���ҵ������������̼ң�������������һ�Σ�</div></div>';
      for (var i = 0; i < data.length; i++) {
        restMask = data[i].wmPoi4Web.status==3 ? ' rest-mask' : '';
        html += '<li class="fl rest-li" >\
                   <div class="j-rest-outer rest-outer transition' + restMask + '">\
                      <div data-title="' + template.judgeNull(data[i].wmPoi4Web.name) + '" data-bulletin="'+ template.judgeNull(data[i].wmPoi4Web.bulletin)
                        + '" data-poiid="' + template.judgeNull(data[i].wm_poi_id_str) + '" class="restaurant" data-all="1"'
                        + this.loopTag(data[i].classify_tagset) + ' data-minpricelevel="' + template.judgeNull(data[i].min_price_level) + '">\
                        <a class="rest-atag" href="/restaurant/' + data[i].wm_poi_id_str + '" data-pos="' + i + '" target="_blank">\
                          <div class="top-content">\
                            ' + this.preview(data[i].wmPoi4Web,i) + '\
                            ' + this.content(data[i]) + '\
                             <div class="clear"></div>\
                          </div>\
                          <div class="others" style="display:none;">\
                             <div class="discount">'
                             + this.logistic(data[i])
                             + this.onlinePay(data[i])
                          //   + this.coupon(data[i])
                           ///  + this.sendCoupon(data[i])
                             + this.supportInvoice(data[i])
                          //   + this.fullDonation(data[i])
                          //   + this.firstOrder(data[i])
                         //    + this.fullDiscount(data[i])
                         //    + this.overTime(data[i])
                         //    + this.aheadDiscount(data[i])
                         //    + this.couponDiscount(data[i])
                             + this.supportCoupon(data[i])
                             + this.actInfoVos(data[i])
                         //    + this.mealsDonation(data[i])
                         //    + this.specialMeal(data[i])
                            // + this.fullSendCoupon(data[i])
                           //  + this.randomCoupon(data[i])
                             +'</div>\
                          </div>'
                          + this.collection(data[i]) +
                        '</a>\
                      </div>\
                    </div>\
                  </li>';

        if((i%4)==3 && i!=(data.length-1)) {html += split;}
        ICON_LEN = 0;
      }
      if(data.length == 0) {
        DOMS.restList.html(noData);
        return false;
      } else {
        if(hasmore) {
          html += '<li class="rest-separate j-rest-separate loading" id="loading"><div class="isloading">������ظ����̼�</div></li>';
        } else {
          html += '<li class="rest-separate j-rest-separate"><div class="isloading" style="color:#707070;">ɨ�����½Ƕ�ά��鿴�����̼�</div></li>';
        }
        return html;
      }
    }
  };

  //��ȡ�̼��б�
  var restaurants = {
    /**
     * @function request
     * @description ��ȡ�̼��б�
     */
    request: function(restart){
      PARAM.classify_type = CLASSIFY.join('|');
      PARAM.uuid = Cookie.get('w_uuid');
      PARAM.platform = 1;
      PARAM.partner = 4;
      PARAM.originUrl = encodeURIComponent(window.location.href);

      var toCaledParams = '', index = 0;
      for (var i in PARAM) {
        toCaledParams += ((index == 0) ? '' : '&') + i + '=' + PARAM[i];
        index++;
      }
      var token = Rohr_Opt.reload('http://' + 'waimai.meituan.com/ajax/poilist?' + toCaledParams);

      $.ajax({
        url: '/ajax/poilist?_token=' + token,
        type: 'POST',
        dataType: 'json',
        data: PARAM
      })
      .done(function(res) {
        if (+res.code == 0) {
          HAS_MORE = res.data.hasMore;
          var html = template.main(res.data.poiList,HAS_MORE);
          PARAM.page_offset += PARAM.page_size;
          $('#loading').remove();
          if(restart && res.data.poiList.length){DOMS.restList.html('');}
          DOMS.restList.append(html).promise().done(function(){
            IS_LOADING = false;
            TIMER && clearTimeout(TIMER);
            TIMER = setTimeout(loading, 100);
          });
        } else if (+res.code === 406) {
          if (res.customData && res.customData.verifyPageUrl && /^https?:\/\//.test(res.customData.verifyPageUrl)) {
            var verifyUrl = res.customData.verifyPageUrl;
            if (verifyUrl.indexOf('?') > -1) {
              verifyUrl += '&';
            } else {
              verifyUrl += '?';
            }
            verifyUrl += 'uuid=' + Cookie.get('w_uuid') + '&platform=1&partner=4&theme=waimai';
            window.location.href = verifyUrl;
          }
        } else {
          alert(res.msg);
        }
      });
    },

    //��������
    scrollLoad: function(){
      if(!FIRST_HAS_MORE) return;
      var me = $(this);
      me.remove();
      var isLoading = '���ظ�����...';
      if(HAS_MORE && !IS_LOADING){
        IS_LOADING = true;
        $('#loading').find('div').text(isLoading);

        // cate�Ķ�
        var currentUrl = window.location.href;
        var urlPieces = currentUrl.split('-');
        var cate;
        if (urlPieces.length === 1) {
          cate = 'cate_all';
        } else {
          cate = urlPieces[1];
        }
        CLASSIFY.length = 0;
        CLASSIFY.push(cate);
        restaurants.request(false);
      }
    },

    /**
     * @function listener
     * @description �̼ҽڵ����¼�����
     */
    listener: function(){
      //�̼ҷ���
     /*
      DOMS.cateFilter.on('click', function() {
        var self = $(this),
            parent = self.parent(),
            cate = self.data('cate'),
            activeCate = $('.imgsort-content .selected').find('a').data('cate');

        PARAM.page_offset = 1;
        FIRST_HAS_MORE = true;
        CLASSIFY = utils.popArray(activeCate, CLASSIFY);
        CLASSIFY.push(cate);
        parent.addClass('selected').siblings().removeClass('selected');
        restaurants.request(true);
      });
     */

      //�Ż�ɸѡ
      DOMS.restFilter.on('click', function() {
        var self     = $(this),
            rest     = self.data('rest'),
            checkbox = self.find('.checkbox'),
            checked  = checkbox.hasClass('checked');

        PARAM.page_offset = 1;
        FIRST_HAS_MORE = true;
        switch (rest) {
          case 'online_pay':
            PARAM.support_online_pay = checked ? 0 : 1;
            break;
          case 'logistic':
            PARAM.support_logistic = checked ? 0 : 1;
            break;
          case 'invoice':
            PARAM.support_invoice = checked ? 0 : 1;
            break;
          default:
            if(!checked){
              CLASSIFY.push(rest);
            } else {
              CLASSIFY = utils.popArray(rest, CLASSIFY);
            }
        }
        restaurants.request(true);
        checked ? checkbox.removeClass('checked') : checkbox.addClass('checked');
      });

      //����ɸѡ
      DOMS.sortFilter.on('click', function() {
        var self = $(this),
            sort = self.data('sort');

        PARAM.page_offset = 1;
        FIRST_HAS_MORE = true;
        self.addClass('active').siblings().removeClass('active');
        PARAM.sort_type = sort;
        restaurants.request(true);
      });

      //���ͼ�ɸѡ
      DOMS.priceFilter.on('click', function() {
        var self = $(this),
            price = self.data('price');

        PARAM.page_offset = 1;
        FIRST_HAS_MORE = true;
        self.parents('.prices').removeClass('hover');
        DOMS.priceBox.text(self.text());
        PARAM.price_type = price;
        restaurants.request(true);
      });

      //��������
      //DOMS.container.on('click','.loading',this.scrollLoad);
      $("body").on('click','#loading',this.scrollLoad);
    }
  };

  /**
   * @function init
   * @description ȫ�ֳ�ʼ��
   */
  var init = function(){
    //restaurants.request(false);
    restaurants.listener();
  };
  init();
    console.log('');
});
