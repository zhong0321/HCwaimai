package cn.zx.service;

import java.util.List;

import cn.zx.entity.UserAddress;

public interface UserAddressService {
	/**
	 * 查询用户地址
	 * @param userAddress
	 * @return List<UserAddress>  
	 * @author ZX 
	 * @date 2019-7-13下午2:50:25
	 */
	public List<UserAddress> findUserAddress(UserAddress userAddress);
	/**
	 * 新增地址
	 * @param userAddress 
	 * @author ZX 
	 * @date 2019-7-13下午2:50:52
	 */
	public void addUserAddress(UserAddress userAddress);
	/**
	 * 修改地址
	 * @param userAddress 
	 * @author ZX 
	 * @date 2019-7-16上午8:46:23
	 */
	public void updateUserAddress(UserAddress userAddress);
	/**
	 * 根据id查询
	 * @param addressId 
	 * @author ZX 
	 * @return 
	 * @date 2019-7-16上午9:15:56
	 */
	public UserAddress findById(Integer addressId);
}