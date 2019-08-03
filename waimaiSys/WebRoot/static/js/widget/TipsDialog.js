/**
 * ��Ե����ָ��ģ���͸���߿�ĶԻ���
 *
 * @author xukai@meituan.com
 * @date 2014-01-24 ������
 */

define(['lib/jquery', 'lib/Class', 'widget/dialog/Dialog', 'tpl/dialog/tips', 'util/template'], function($, Class, Dialog, tpl, template) {
  'use stirct';

  var jQbody = $('body');
  
  var TipsDialog = Dialog.extend({

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
        direction : 'left',
        destroyEvent : function() {}
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
