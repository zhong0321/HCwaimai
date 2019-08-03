package cn.zx.service.impl;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zx.entity.User;
import cn.zx.mapper.UserInfoMapper;
import cn.zx.service.UserInfoService;


/**
 *@author GLH
 *@version ����ʱ�䣺2019-6-23 ����10:28:43
 */
@Service(value="userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Resource
    @Autowired
	private UserInfoMapper userInfoMapper;
	@Override
	public User findUserPhoneLogin(String phone,Integer logintype) {
		System.out.println(phone+"aaaa"+logintype);
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
}