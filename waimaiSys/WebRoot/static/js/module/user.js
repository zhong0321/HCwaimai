/**
 * 用于封装用户的基本信息，包括设置和获取登录状态等等
 *
 * @author XU Kai(xukai@meituan.com)
 * @date 2014-02-27 星期四
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