package cn.zx.service;

import java.util.List;

import cn.zx.entity.Store;

public interface StoreService {
	/**
	 * 根据收获地址搜索附近商家
	 * @param store
	 * @return
	 */
	public List<Store> findStoreByAddress(Store store);
	/**
	 * 根据id查询商家
	 * @param id
	 * @return Store  
	 * @author ZX 
	 * @date 2019-6-30下午1:26:07
	 */
	public Store findStoreById(Integer id);
	/**
	 * 账号密码登录
	 * @param storePhone
	 * @param storePassword
	 * @return 
	 * Store  
	 * @author ZX 
	 * @date 2019-7-30下午3:58:23
	 */
	public Store phonePwdLogin(Store store);
	/**
	 * 手机号登录
	 * @param phone
	 * @return 
	 * Store  
	 * @author ZX 
	 * @date 2019-7-31下午12:20:18
	 */
	public Store storePhoneLogin(String phone);
	/**
	 * 添加店铺
	 * @param store 
	 * void  
	 * @author ZX 
	 * @date 2019-7-31下午12:58:21
	 */
	public void addStore(Store store);
	/**
	 * 修改店铺
	 * @param store 
	 * void  
	 * @author ZX 
	 * @date 2019-7-31下午12:58:42
	 */
	public void updateStore(Store store);
}
