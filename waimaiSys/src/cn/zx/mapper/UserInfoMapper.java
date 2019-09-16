package cn.zx.mapper;


import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Audit;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
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
	/**
	 * 
	 * @param phone
	 * @param password
	 * @param type
	 */
	public void updatapw(@Param(value = "phone")String phone ,@Param(value = "Password")String password,@Param(value = "type")String type);
	
	/**
	 * 查询商家信息根据手机号
	 * @param storePhone
	 * @return
	 */
	public Store findStorePhone(@Param("storePhone") String storePhone);
	
	/**
	 * 查询商家信息根据手机号
	 * @param storePhone
	 * @return
	 */
	public Store findStorebyPhone(@Param("storePhone") String storePhone);
	
	/**
	 * 修改商家入驻状态
	 * @param id 商家id
	 * @param registState 状态码
	 */
	public void updateInfo(@Param("id")int id,@Param("registState")int registState);
	
	/**
	 * 删除入驻法人信息
	 * @param storeId
	 */
	public void deleteInfo(@Param("storeId")int storeId);
	
}
