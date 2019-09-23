package cn.zx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Admin;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreTypes;

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
	
	/**
	 * 查询正在审核的商家
	 * @return
	 */
	public List<Store> findExamine(int id);
	

	/**
	 * 修改商家状态（是否通过）
	 * @param id
	 * @param registState
	 */
	public int updateStoreRegistState(int id,int registState,String text);
	
	/**
	 * 查询商家的合法信息
	 * @param id
	 * @return
	 */
	public StoreAptitude findStoreAptitude(int id);
	

	/**
	 * 根据storeid查询店铺类型
	 * @param id
	 * @return
	 */
	public List<StoreTypes> findStoreType(int id);
	
	
	
}
