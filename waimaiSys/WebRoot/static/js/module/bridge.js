/**
 * ����Ϣ���ƣ����и���ģ��֮���ͨ�ţ�ϣ��������DOM���С�
 * Ex:
 *   Observer.register('signal', function(data){
 *     console.log(data);
 *   })
 *   Observer.trigger('signal');
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014.01.06
 */

define(['lib/jquery'], function($) {
  'use strict';

  // ��ű��ص����е���Ϣ��
  var events = {};
  
  // ������п�ģ��ʹ�õ��¼�
  var data = {};

  return {

    /**
     * ע��ĳ����Ϣ������֮��������һ���ص�������
     *
     * @param {Object} key ��Ҫע�����Ϣ����
     * @param {Object} value ������һ���ص�������������һ���ַ���
     */
    register : function(key, value) {
      if ($.isFunction(value)) {
        if (!events[key]) {
          events[key] = [];
        }
        events[key].push(value);
      } else {
        data[key] = value;
      }
    },

    /**
     * ����ĳ����Ϣ���¼���
     *
     * @param {Object} evt ��������Ϣ����
     * @param {Object} params �������лص��Ĳ���
     */
    trigger : function(evt, params) {
      if (!events[evt]) {
        return;
      }

      var callbacks = events[evt];
      for (var i = 0; i < callbacks.length; i++) {
        callbacks[i](params);
      }
    },
    
    /**
     * ��ȡĳ��ע��ļ�ֵ
     *
     *
     */
    get : function(key) {
      if (!key) {
        return null;
      }
      
      return data[key];
    },

    /**
     * �鿴�Ƿ�ע��������¼���������ע����������һ�����޷��ҵ���
     * @param evt �¼���
     * @param callback ���� ��������������򷵻��Ƿ��к���ע���˸��¼�
     * @return {boolean} �ҵ�����true�����򷵻�false
     */
    has : function(evt, callback) {
      if (!events[evt])
        return false;
      if (callback == null) {
        if (events[evt].length == 0)
          return false;
        else
          return true;
      }
      var evts = events[evt];
      for (var i = 0, len = evts.length; i < len; i++) {
        if (evts[i] == callback) {
          return true;
        }
      }
      return false;
    },

    /**
     * ȡ��ע�ᣬ���������޷�ȡ��
     * @param evt
     * @param callback ����������������ɾ�������¼�
     */
    unRegister : function(evt, callback) {
      if (!events[evt])
        return;
      if (callback == null) {
        events[evt] = null;
        return;
      }
      var evts = events[evt];
      var locateEvt = function() {//�ҵ���һ���¼�
        for (var i = 0, len = evts.length; i < len; i++) {
          if (evts[i] == callback) {
            return i;
          }
        }
        return -1;
      };
      var loc;
      while (( loc = locateEvt()) != -1) {
        evts.splice(loc, 1);
      }
    }
  };
});
