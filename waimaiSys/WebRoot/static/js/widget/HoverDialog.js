/**
 * 边缘带了指针的，不带透明边框的，黑色半透明的弹框。
 *
 * @author xukai@meituan.com
 * @date 2014-03-24 星期一
 */

define(['lib/jquery', 'lib/Class', 'widget/dialog/Dialog', 'tpl/dialog/hover', 'util/template'], function($, Class, Dialog, tpl, template) {
  'use stirct';

  var $body = $('body'), $window = $(window);

  var HoverDialog = Dialog.extend({

    /**
     * 初始化结构。
     *
     * @param {String} options.content 需要拼装的弹框中的内容部分
     * @param {String} options.klass 需要加在最外层的类名
     */
    init : function(options) {
      var defaults = {
        content : '',
        klass : '',
        destroyEvent: function() {}
      };
      $.extend(defaults, options);
      this._super(defaults);
    },

    /**
     * 结构化HTML
     *
     */
    _constructHTML : function() {
      var options = this.options;

      var view = {
        content : options.content,
        klass : options.klass
      };
      this._dialog = $(template(tpl, view));
      $body.append(this._dialog);
    },

    _locate : function(position) {
      this._dialog.find('.hover-dialog').css({
        left : position.left - 68,
        top : position.top + 37
      });
    }

  });

  return HoverDialog;
});
