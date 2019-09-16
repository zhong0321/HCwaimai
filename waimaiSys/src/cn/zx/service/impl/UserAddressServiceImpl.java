package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.UserAddress;
import cn.zx.mapper.UserAddressMapper;
import cn.zx.service.UserAddressService;
@Service(value="userAddressService")
public class UserAddressServiceImpl implements UserAddressService {
	@Resource
	private UserAddressMapper userAddressMapper;

	@Override
	public List<UserAddress> findUserAddress(UserAddress userAddress) {
		List<UserAddress> list = userAddressMapper.findUserAddress(userAddress);
		return list;
	}

	@Override
	public void addUserAddress(UserAddress userAddress) {
		userAddressMapper.addUserAddress(userAddress);
	}

	@Override
	public void updateUserAddress(UserAddress userAddress) {
		userAddressMapper.updateUserAddress(userAddress);
	}

	@Override
	public UserAddress findById(Integer addressId) {
		UserAddress userAddress=userAddressMapper.findById(addressId);
		return userAddress;
	}

	@Override
	public void deleteUserAddress(Integer id) {
		userAddressMapper.deleteUserAddress(id);
		
	}

}
