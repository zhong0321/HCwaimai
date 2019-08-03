package cn.zx.service;


import cn.zx.entity.User;

/**
 *@author GLH
 *@version ����ʱ�䣺2019-6-23 ����10:27:45
 *
 *
 */

public interface UserInfoService {

	/**
	 * �ֻ����֤���½
	 * @param phone
	 * @return
	 */
	public User findUserPhoneLogin(String phone,Integer logintype);

	/**
	 * �˺������½
	 * @param phone
	 * @param userPassword
	 * @return
	 */
	public User findUserpwLogin(String phone, String userPassword);
	
	/**
	 *添加用户
	 */
	public void addUserInfo(String phone);
	/**
	 *账号密码注册
	 */
	public void addUser(String userPhone, String userPassWord,Integer type);

	public void updatapw(String phone ,String password,String tpye);
}
