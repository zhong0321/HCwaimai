/**
 * ����������෽���������˴򿪣���Ⱦ����λ���رյȵȻ��������ĳ��󷽷���
 *
 * @author xukai@meituan.com
 * @date 2014-01-24 ������
 */

define(['lib/jquery', 'lib/Class'], function($, Class) {
  'use stirct';
  
  // ��ֹҳ����ͬʱ���ڶ����������
  var dialog;
  
  var Dialog = Class.extend({

    /**
     * ��ʼ�����󣬴����ڹ���ʱ��Ļ���������
     *
     */
    init : function(options) {
      
      // ����Ѿ��д��ڵĵ������Ƚ�������
      dialog && dialog.destroy();
      
      this.options = options;
      this._constructHTML();
      this._bindEvt && this._bindEvt();
      dialog = this;
    },

    /**
     * ��ʾ��ǰ�ĶԻ����Ҷ�λ��
     *
     * @param {Number} position.x ��ǰ��λ����Ϣxֵ
     * @param {Number} position.y ��ǰ��λ����Ϣyֵ
     */
    show : function(position) {
      this._dialog.show();
      this._locate && this._locate(position);
      return this;
    },

    /**
     * ���ص�ʱ����õķ�����
     *
     */
    hide : function() {
      this._dialog.hide();
      return this;
    },

    /**
     * ���ٵ�ǰ�Ķ���
     *
     */
    destroy : function(evt) {
      this._dialog.remove();
      this.options.destroyEvent.call(this);
      dialog = null;
      
      // ��ֹ����ð��
      evt && evt.stopPropagation();
    },
    
    /**
     * ���õ����������Ϣ
     *
     * @param {Object} html ��ǰ��������Ҫ����ʾ��Ϣ
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
     * ͬjQuery.find
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
