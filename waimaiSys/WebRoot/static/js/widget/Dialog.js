/**
 * 弹框组件基类方法，包括了打开，渲染，定位，关闭等等基本方法的抽象方法。
 *
 * @author xukai@meituan.com
 * @date 2014-01-24 星期五
 */

define(['lib/jquery', 'lib/Class'], function($, Class) {
  'use stirct';
  
  // 防止页面上同时存在多个弹框的情况
  var dialog;
  
  var Dialog = Class.extend({

    /**
     * 初始化对象，传入在构建时候的基本参数。
     *
     */
    init : function(options) {
      
      // 如果已经有存在的弹框，则先将其销毁
      dialog && dialog.destroy();
      
      this.options = options;
      this._constructHTML();
      this._bindEvt && this._bindEvt();
      dialog = this;
    },

    /**
     * 显示当前的对话框并且定位。
     *
     * @param {Number} position.x 当前的位置信息x值
     * @param {Number} position.y 当前的位置信息y值
     */
    show : function(position) {
      this._dialog.show();
      this._locate && this._locate(position);
      return this;
    },

    /**
     * 隐藏的时候调用的方法。
     *
     */
    hide : function() {
      this._dialog.hide();
      return this;
    },

    /**
     * 销毁当前的对象。
     *
     */
    destroy : function(evt) {
      this._dialog.remove();
      this.options.destroyEvent.call(this);
      dialog = null;
      
      // 阻止继续冒泡
      evt && evt.stopPropagation();
    },
    
    /**
     * 设置弹框的内容信息
     *
     * @param {Object} html 当前弹框中需要的提示信息
     */
    setContent : function(html) {
      this._dialog.find('.content').html(html);
      return this;
    },
    
    getContent: function() {
      return this._dialog.find('.content').html();
    },

    _constructHTML: function() {
      throw new Error('Abstract method !');
    },
    
    /**
     * 同jQuery.find
     *  
     */
    find : function(selector) {
      return this._dialog.find(selector);
    },
    
    delegate : function(selector, evt, callback) {
      return this._dialog.delegate(selector, evt, callback);
    }
  });

  return Dialog;
});
