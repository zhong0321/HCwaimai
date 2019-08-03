/**
 * 对向后台发起的ajax请求做一层的数据封装。
 * 用以以后统一的进行错误码的处理，异常的统一处理等等需求。
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014.01.06
 */

define(['lib/jquery', 'util/utils'], function($, utils) {
  'use strict';

  var convert = function(obj) {
    return Array.prototype.slice.call(obj);
  };

  return {

    /**
     * 向后台发起请求，方法参数可详见 $.post，jQuery.ajax文档
     */
    post : function() {
      return $.post.apply(this, convert(arguments)).fail(function(data, textStatus) {
        if(data.status == 400 && data.statusText == 'CSRF-TOKEN'){
          utils.showError("请求csrf_token错误，请刷新页面重试或致电客服！");
        }else if (textStatus != "abort") {
          utils.showError('网络不稳定，请稍后重试！');
        }
      });
    },

    /**
     * 向后台发起请求，方法参数可详见 $.get，jQuery.ajax文档
     */
    get : function() {
      return $.get.apply(this, convert(arguments)).fail(function(data, textStatus) {
        if (textStatus != "abort") {
          utils.showError('网络不稳定，请稍后重试！');
        }
      });
    },

    /**
     * 向后台发起请求，方法参数可详见 $.ajax，jQuery文档
     */
    ajax : function() {
      return $.ajax.apply(this, convert(arguments));
    }
  };
});
