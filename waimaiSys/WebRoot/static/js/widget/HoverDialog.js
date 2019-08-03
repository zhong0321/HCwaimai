/**
 * ��Ե����ָ��ģ�����͸���߿�ģ���ɫ��͸���ĵ���
 *
 * @author xukai@meituan.com
 * @date 2014-03-24 ����һ
 */

define(['lib/jquery', 'lib/Class', 'widget/dialog/Dialog', 'tpl/dialog/hover', 'util/template'], function($, Class, Dialog, tpl, template) {
  'use stirct';

  var $body = $('body'), $window = $(window);

  var HoverDialog = Dialog.extend({

    /**
     * ��ʼ���ṹ��
     *
     * @param {String} options.content ��Ҫƴװ�ĵ����е����ݲ���
     * @param {String} options.klass ��Ҫ��������������
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
     * �ṹ��HTML
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
