/**
 * ���ڷ�װ�û��Ļ�����Ϣ���������úͻ�ȡ��¼״̬�ȵ�
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014-02-27 ������
 */

define(function() {
  'use strict';

  var isLogin = false;

  var User = {
    isLogin: function() {
      return isLogin;
    },
    
    setUser: function(loginStatus) {
      isLogin = loginStatus;
    }
  };
  
  return User;
}); 