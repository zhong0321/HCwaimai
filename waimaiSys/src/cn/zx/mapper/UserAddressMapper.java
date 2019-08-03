package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.UserAddress;

public interface UserAddressMapper {
	public List<UserAddress> findUserAddress(UserAddress userAddress);
	public void addUserAddress(UserAddress userAddress);
	public void updateUserAddress(UserAddress userAddress);
	public UserAddress findById(Integer addressId);
}