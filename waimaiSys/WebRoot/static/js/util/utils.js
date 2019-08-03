/**
 * �����෽�������幦�ܿɲο�ע�͡�
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014.01.06
 */

define(['lib/jquery', 'widget/dialog/SimpleDialog'], function($, SimpleDialog) {
  'use strict';

  // ֱ�ӷ��ع�������󼯺�
  return {

    /**
     * ��ȡ����
     *
     * @param {String} href ��Ҫ�����url����
     * @return {Object} �����ļ�ֵ�Խ��
     */
    urlParams : function(href) {
      href = href || window.location.search;
      var data = {}, reg = /([^?=&]+)(=([^&]*))?/g;
      if (href) {
        href.replace(reg, function($0, $1, $2, $3) {
          data[$1] = $3;
        });
      }
      return data;
    },

    /**
     * �����ַ����ĳ���
     *
     * @param {Object} str ��Ҫ��������ַ���
     */
    charLength : function(str) {
      var total = str.replace(/[u222-u2323]+/, '**');
      return total.length;
    },

    /**
     * ��ȡ�̶������ַ���Utils.countChars
     * @param {String} str Ҫ��ȡ���ַ���
     * @param {Number} len Ҫ��ȡ�ĳ��ȣ�һ��ȫ��=2�����
     * @param {Blooean} flag �Ƿ���ʾ...
     * @param {Blooean} html_replace �Ƿ��ȹ���html��ǩ
     */
    countChars : function(str, len, flag, html_replace) {
      if (str) {
        var strLen = str.replace(/[\u4e00-\u9fa5\s]/g, '**').length, newStr = [], totalCount = 0;
        if (html_replace) {
          var $elem = $('<div></div>').html(str);
          str = $elem.text();
          $elem = null;
        }

        if (strLen <= len) {
          return str;
        } else {
          for (var i = 0; i < strLen; i++) {
            var nowValue = str.charAt(i);
            if (/[^\x00-\xff]/.test(nowValue)) {
              totalCount += 2;
            } else {
              totalCount += 1;
            }
            newStr.push(nowValue);
            if (totalCount >= len) {
              break;
            }
          }
          if (flag) {
            return newStr.join('');
          } else {
            return newStr.join('') + '...';
          }
        }
      } else {
        return '';
      }
    },

    /**
     * ת���ַ����е�����HTML����
     * @function Utils.encodeSpecialHtmlChar
     * @param {String}str Ҫ�滻���ַ���
     * @return {String}
     */
    encodelHtmlChar : function(str) {
      if (str) {
        // var codingchar = ['"', '&', '<', '>'];
        var codingchar = ['<', '>'];
        // var sepchar = ['&quot;', '&amp;', '&lt;', '&gt;'];
        var sepchar = ['&lt;', '&gt;'];
        var len = sepchar.length;

        for (var i = 0; i < len; i++) {
          str = str.replace(new RegExp(codingchar[i], "g"), sepchar[i]);
        }
        return str;
      } else {
        return "";
      }
    },

    /**
     * ��ת���ַ����е�����HTML����
     * @function Utils.decodeSpecialHtmlChar
     * @param {String}str Ҫ�滻���ַ���
     * @return {String}
     */
    decodeHtmlChar : function(str) {
      if (str) {
        var codingchar = ['&quot;', '&amp;', '&lt;', '&gt;'];
        var sepchar = ['"', '&', '<', '>'];
        var len = sepchar.length;

        for (var i = 0; i < len; i++) {
          str = str.replace(new RegExp(codingchar[i], "g"), sepchar[i]);
        }
        return str;
      } else {
        return "";
      }
    },

    /**
     * ����ĳС�������positionλ
     *
     *
     */
    approximate : function(value, position) {
      if (!value) {
        return 0;
      }

      position = position || 2;
      var tpRank = Math.pow(10, position);
      return Math.round(value * tpRank) / tpRank;
    },

    getTime: function(format, time) {
      var now = (time) ? new Date(time * 1000) : new Date();

      var o = {
        "M+" : now.getMonth() + 1,
        "d+" : now.getDate(),
        "h+" : now.getHours(),
        "m+" : now.getMinutes(),
        "s+" : now.getSeconds(),
        "q+" : Math.floor((now.getMonth() + 3) / 3),
        "S" : now.getMilliseconds()
      };

      if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (now.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
      }
      for ( var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
          format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
              : ("00" + o[k]).substr(("" + o[k]).length));
        }
      }
      return format;
    },

    /**
     *
     */
    getById : function(id) {
      if (!id) {
        return null;
      }

      return document.getElementById(id);
    },

    /**
     * �ɹ���ʾ�ĵ���
     * @param {String} str ��Ҫչʾ�ĳɹ���ʾ��
     */
    showOK : function(str, callback) {
      if ($.trim(str).length == 0) {
        return;
      }
      var options = {
        'klass' : 'dialog-success',
        'hasTitle' : false,
        'autoHide' : 5,
        'content' : '<i class="icon i-dialog-right"></i><span class="tips">' + str + '</span>',
        'destroyEvent' : callback
      };
      return new SimpleDialog(options).show();
    },

    /**
     * �������ʾ����
     *
     */
    showError : function(str, callback) {
      if ($.trim(str).length == 0) {
        return;
      }
      var options = {
        'klass' : 'dialog-failed',
        'hasTitle' : false,
        'autoHide' : 5,
        'content' : '<i class="icon i-dialog-wrong"></i><span class="tips">' + str + '</span>',
        'destroyEvent' : callback
      };
      return new SimpleDialog(options).show();
    },

    /**
     * �ӳ���ת���Ա�������תǰ����ͳ������
     * @param u url������ִ�еĺ���
     */
    delayGo : function(u,time) {
      if (time==null) time = 300;
      setTimeout(function() {
        if ( typeof u == 'string')
          window.location = u;
        else if ( typeof u == 'function')
          u();
      }, time);
    },
    /**
     * @function popArray
     * @description ɾ��������ĳ��Ԫ��
     * @param {item} Ҫɾ��������Ԫ��
     * @param {arr} ����
     */
    popArray: function(item, arr){
      var index = arr.indexOf(item);
      if(index != -1) {arr.splice(index,1);}
      return  arr;
    }
  };
});
