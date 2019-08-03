/**
 * ��ͨ�ĵ��򣨴���͸����Ӱ�ĵ��򣩣�������ʾ������ȷ�������ɹ��ȵ���Ϣ��
 *
 * @date 2014-01-24 ������
 * 
 */

define(['lib/jquery', 'lib/Class', 'module/bridge', 'widget/dialog/Dialog', 'tpl/dialog/simple', 'util/template'], function($, Class, bridge, Dialog, tpl, template) {
  'use stirct';
  
  var jQbody = $('body'), jQwindow = $(window);
  
  var SimpleDialog = Dialog.extend({
    _mask : null,
    
    /**
     * ��ʼ���ṹ��
     *
     * @param {String} options.content ��Ҫƴװ�ĵ����е����ݲ���
     * @param {String} options.klass ��Ҫ��������������
     * @param {String} options.hasTitle �����Ƿ���Ҫ����
     * @param {String} options.destroyEvent �رյ����ʱ�򴥷����¼�
     * @param {String} options.mask �Ƿ���ʾ���֣�Ĭ��Ϊtrue
     * @param {String} options.hideOnClose ����رհ�ť�Ƿ������أ�Ĭ��Ϊfalse
     */
    init: function(options) {
      var defaults = {
        title: '',
        content : '',
        klass : '',
        hasTitle: true,
        autoHide: false,
        mask: true,
        destroyEvent: function() {}
      };
      $.extend(defaults, options);
      this._super(defaults);
      
      var self = this;
      bridge.register('dialog:close', function() {
        self.destroy();
      });
    },
    
    /**
     * �ṹ��HTML
     * 
     */
    _constructHTML : function() {
      var options = this.options;
      this._dialog = $(template(tpl, this.options));
      jQbody.append(this._dialog);
    },
    
    _bindEvt: function() {
      var self = this;
      this._dialog.find('.close, .notitle-close').bind('click', this.options.hideOnClose? $.proxy(this.hide, this) : $.proxy(this.destroy, this));

      // �Ƿ���Ҫ�Զ�����
      var autoHide = this.options.autoHide;
      if (typeof autoHide === 'number') {
        setTimeout(function() {
          self.destroy();
        }, autoHide * 1000);
      }
    },
    
    _locate : function(position) {
      var dialogBody = this._dialog.find('.simple-dialog');
      if (position) {
        dialogBody.css({
          left : position.x,
          top : position.y
        });
      } else {
        var width = jQwindow.width(), height = jQwindow.height();
        dialogBody.css({
          left : width / 2 - dialogBody.width() / 2,
          top : jQwindow.scrollTop() + 190
          // top : height / 2 - dialogBody.height() / 2 + jQwindow.scrollTop()
          // top : 180
        });
      }
    },

    show : function(position) {
      if (this.options.mask) {
        if (!this._mask) {
          this._mask = $('<div class="mask" style="display:none"></div>').appendTo(jQbody).end();
        }
        this._mask.show();
      }
      return this._super(position);
    },

    hide : function() {
      if (this._mask) {
        this._mask.hide();
      }
      return this._super();
    },

    destroy : function(evt) {
      if (this._mask) {
        this._mask.remove();
      }
      this._super(evt);
    }
  });
  
  return SimpleDialog;
});