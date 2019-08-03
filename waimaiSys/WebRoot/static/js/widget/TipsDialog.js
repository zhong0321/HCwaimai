/**
 * 边缘带了指针的，带透明边框的对话框。
 *
 * @author xukai@meituan.com
 * @date 2014-01-24 星期五
 */

define(['lib/jquery', 'lib/Class', 'widget/dialog/Dialog', 'tpl/dialog/tips', 'util/template'], function($, Class, Dialog, tpl, template) {
  'use stirct';

  var jQbody = $('body');
  
  var TipsDialog = Dialog.extend({

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
        direction : 'left',
        destroyEvent : function() {}
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
        klass : options.klass,
        direction : options.direction
      };
      this._dialog = $(template(tpl, view));
      jQbody.append(this._dialog);
    },

    _locate : function(position) {
      this._dialog.find('.tips-dialog').css({
        left : position.left,
        top : position.top - 2
      });
    }
  });

  return TipsDialog;
});
