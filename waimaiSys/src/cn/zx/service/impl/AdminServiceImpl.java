package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Admin;
import cn.zx.mapper.AdminMapper;
import cn.zx.service.AdminService;
@Service(value="adminService")
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper adminMapper;

	@Override
	public Admin phonePwdLogin(String adminName, String adminPassword) {
		return adminMapper.phonePwdLogin(adminName, adminPassword);
	}

}
