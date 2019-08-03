package cn.zx.service;

import cn.zx.entity.Admin;

public interface AdminService {
	/**
	 * 账号密码登录
	 * @param adminName
	 * @param adminPassword
	 * @return 
	 * Admin  
	 * @author ZX 
	 * @date 2019-7-31上午11:31:20
	 */
	public Admin phonePwdLogin(String adminName,String adminPassword); 
}
