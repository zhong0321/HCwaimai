package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zx.entity.Store;
import cn.zx.entity.User;
import cn.zx.mapper.UserInfoMapper;
import cn.zx.service.UserInfoService;

/**
 *@author GLH
 */
@Service(value="userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Resource
    @Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public User findUserPhoneLogin(String phone,Integer logintype) {
		return userInfoMapper.findUserPhoneLogin(phone,logintype);
	}
	
	@Override
	public User findUserpwLogin(String phone, String userPassword) {
		User user=userInfoMapper.findUserpwLogin(phone, userPassword);
		return user;
	}
	
	@Override
	public void addUserInfo(String phone) {
		userInfoMapper.addUserInfo(phone);
	}
	
	@Override
	public void addUser(String userPhone ,String userPassword,Integer type) {
		userInfoMapper.addUser(userPhone,userPassword,type);
	}
	
	@Override
	public void updatapw(String phone, String password, String tpye) {
		userInfoMapper.updatapw(phone,password,tpye);
	}
	
	@Override
	public Store findStorePhone(String storePhone) {
		return userInfoMapper.findStorePhone(storePhone);
	}

	@Override
	public int updateInfo(int id, int registState) {

		try {
			userInfoMapper.updateInfo(id, registState);
			return 1; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 2;
		}
		
	}

	@Override
	public int deleteInfo(int storeId) {
		try {
			userInfoMapper.deleteInfo(storeId);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public Store findStorebyPhone(String storePhone) {
		return userInfoMapper.findStorebyPhone(storePhone);
	}
}