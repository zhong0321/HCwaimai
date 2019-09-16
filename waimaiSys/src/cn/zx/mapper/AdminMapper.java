package cn.zx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Admin;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreTypes;


public interface AdminMapper {
	
	/**
	 * 后台登录
	 * @param adminName
	 * @param adminPassword
	 * @return
	 */
	public Admin phonePwdLogin(@Param(value="adminName")String adminName,@Param(value="adminPassword")String adminPassword); 
	
	/**
	 * 查询正在审核的商家
	 * @return
	 */
	public List<Store> findexamine(@Param(value = "sid")int id);
	
	/**
	 * 查询商家的合法信息
	 * @param id
	 * @return
	 */
	public StoreAptitude findStoreAptitude(@Param(value = "id")int id);
	
	/**
	 * 根据storeid查询店铺类型
	 * @param id
	 * @return
	 */
	public List<StoreTypes> findStoreType(@Param(value = "id")int id);
	
	/**
	 * 修改商家审核状态
	 * @param id
	 * @param registState
	 */
	public void updateStoreRegistState(@Param(value = "id")int id,@Param(value = "registState")int registState,@Param(value = "text")String text);
}
