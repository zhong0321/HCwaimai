/**
 * 普通的弹框（带了透明阴影的弹框），用来提示错误，正确，操作成功等等信息。
 *
 * @date 2014-01-24 星期五
 * 
 */

define(['lib/jquery', 'lib/Class', 'module/bridge', 'widget/dialog/Dialog', 'tpl/dialog/simple', 'util/template'], function($, Class, bridge, Dialog, tpl, template) {
  'use stirct';
  
  var jQbody = $('body'), jQwindow = $(window);
  
  var SimpleDialog = Dialog.extend({
    _mask : null,
    
    /**
     * 初始化结构。
     *
     * @param {String} options.content 需要拼装的弹框中的内容部分
     * @param {String} options.klass 需要加在最外层的类名
     * @param {String} options.hasTitle 弹框是否需要标题
     * @param {String} options.destroyEvent 关闭弹框的时候触发的事件
     * @param {String} options.mask 是否显示遮罩，默认为true
     * @param {String} options.hideOnClose 点击关闭按钮是否是隐藏，默认为false
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
     * 结构化HTML
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

      // 是否需要自动隐藏
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