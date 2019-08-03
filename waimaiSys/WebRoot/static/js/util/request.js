/**
 * �����̨�����ajax������һ������ݷ�װ��
 * �����Ժ�ͳһ�Ľ��д�����Ĵ����쳣��ͳһ����ȵ�����
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
     * ���̨�������󣬷������������ $.post��jQuery.ajax�ĵ�
     */
    post : function() {
      return $.post.apply(this, convert(arguments)).fail(function(data, textStatus) {
        if(data.status == 400 && data.statusText == 'CSRF-TOKEN'){
          utils.showError("����csrf_token������ˢ��ҳ�����Ի��µ�ͷ���");
        }else if (textStatus != "abort") {
          utils.showError('���粻�ȶ������Ժ����ԣ�');
        }
      });
    },

    /**
     * ���̨�������󣬷������������ $.get��jQuery.ajax�ĵ�
     */
    get : function() {
      return $.get.apply(this, convert(arguments)).fail(function(data, textStatus) {
        if (textStatus != "abort") {
          utils.showError('���粻�ȶ������Ժ����ԣ�');
        }
      });
    },

    /**
     * ���̨�������󣬷������������ $.ajax��jQuery�ĵ�
     */
    ajax : function() {
      return $.ajax.apply(this, convert(arguments));
    }
  };
});
