package cn.zx.service;


import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Audit;
import cn.zx.entity.Store;
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
	public Store findStorebyPhone(String storePhone);
	
	/**
	 * 修改商家入驻状态
	 * @param id 商家id
	 * @param registState 状态码
	 */
	public int updateInfo(@Param("id")int id,@Param("registState")int registState);
	
	/**
	 * 删除入驻法人信息
	 * @param storeId
	 */
	public int deleteInfo(@Param("storeId")int storeId);
	
}
