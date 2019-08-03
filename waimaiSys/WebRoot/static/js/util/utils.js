/**
 * 工具类方法，具体功能可参考注释。
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014.01.06
 */

define(['lib/jquery', 'widget/dialog/SimpleDialog'], function($, SimpleDialog) {
  'use strict';

  // 直接返回工具类对象集合
  return {

    /**
     * 获取参数
     *
     * @param {String} href 需要传入的url参数
     * @return {Object} 参数的键值对结合
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
     * 计算字符串的长度
     *
     * @param {Object} str 需要带计算的字符串
     */
    charLength : function(str) {
      var total = str.replace(/[u222-u2323]+/, '**');
      return total.length;
    },

    /**
     * 截取固定长度字符串Utils.countChars
     * @param {String} str 要截取的字符串
     * @param {Number} len 要截取的长度，一个全角=2个半角
     * @param {Blooean} flag 是否显示...
     * @param {Blooean} html_replace 是否先过滤html标签
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
     * 转义字符串中的特殊HTML符号
     * @function Utils.encodeSpecialHtmlChar
     * @param {String}str 要替换的字符串
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
     * 反转义字符串中的特殊HTML符号
     * @function Utils.decodeSpecialHtmlChar
     * @param {String}str 要替换的字符串
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
     * 近似某小数到后边position位
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
     * 成功提示的弹框
     * @param {String} str 需要展示的成功提示语
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
     * 错误的提示弹框
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
     * 延迟跳转，以便于在跳转前发送统计请求
     * @param u url或者是执行的函数
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
     * @description 删除数组中某个元素
     * @param {item} 要删除的数组元素
     * @param {arr} 数组
     */
    popArray: function(item, arr){
      var index = arr.indexOf(item);
      if(index != -1) {arr.splice(index,1);}
      return  arr;
    }
  };
});
