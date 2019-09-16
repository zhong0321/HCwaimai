package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Admin;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreTypes;
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
	
	@Override
	public List<Store> findExamine(int id) {
		return adminMapper.findexamine(id);
	}
	
	@Override
	public int updateStoreRegistState(int id, int registState,String text) {
		try {
			adminMapper.updateStoreRegistState(id, registState,text);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public StoreAptitude findStoreAptitude(int id) {
		return adminMapper.findStoreAptitude(id);
	}
	
	@Override
	public List<StoreTypes> findStoreType(int id) {
		return adminMapper.findStoreType(id);
	}
}
