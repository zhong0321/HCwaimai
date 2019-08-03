package cn.zx.mapper;


import org.apache.ibatis.annotations.Param;

import cn.zx.entity.User;

/**
 * 手机号验证码登陆
 * @author GLH
 * @date�� ���ڣ�2019-6-21 ʱ�䣺����10:43:45
 */
public interface UserInfoMapper {
	/**
	 * 手机号验证码登录
	 * @param phone
	 * @return
	 */
	public User findUserPhoneLogin(@Param(value = "phone")String phone,@Param(value = "loginType")Integer loginType);
	
	/**
	 * 账号密码登陆
	 * @param phone
	 * @param userPassword
	 * @return
	 */
	public User findUserpwLogin(@Param(value = "phone") String phone, @Param(value = "userPassword") String userPassword);
	
	/**
	 *添加用户
	 */
	public void addUserInfo(String phone);
	
	/**
	 * 账号密码注册*
	 *2019-6-30下午1:37:26
	 */
	public void addUser(@Param(value = "userPhone")String userPhone,@Param(value = "userPassword")String userPassword,@Param(value = "type") Integer type);

	public void updatapw(@Param(value = "phone")String phone ,@Param(value = "Password")String password,@Param(value = "type")String type);
	
}
