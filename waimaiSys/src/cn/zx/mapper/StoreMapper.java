package cn.zx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Store;
import cn.zx.entity.Store_Comment;

public interface StoreMapper {
	
	public List<Store> findStoreByAddress(Store store);
	
	public Store findStoreById(Integer id);
	
	public Store phonePwdLogin(Store store);
	
	public Store storePhoneLogin(@Param(value = "phone")String phone);
	
	public void addStore(Store store);
	
	/**
	 * 修改店铺
	 * @param store 
	 * @return void  
	 * @author ZX 
	 * @date 2019-7-31下午12:58:42
	 */
	public void updateStore(Store store);
	
	/**
	 * 查询商家信息和评价平均分
	 * 可根据商家类型查询
	 * @param storeTypeId 传入空时查询5公里内所有商家
	 * @param sorttype 排序类型 
	 * @param sortorder 排序方式 
	 * @return List<Store_Comment>
	 */
	public List<Store_Comment> findStoreInfo(@Param(value = "storeTypeId")int storeTypeId,@Param(value = "sorttype")int sorttype,@Param(value = "sortorder")int sortorder);
	
	/**
	 * 添加Audit审核表
	 * @param storeId
	 * @param auditState
	 * @param auditTime
	 * @param auditComment
	 */
	public void addAudit(@Param(value = "storeId")int storeId,@Param(value = "auditState")int auditState,@Param(value = "auditTime")String auditTime, @Param(value = "auditComment")String auditComment);
	
	/**
	 * 修改Audit审核表
	 * @param auditState
	 * @param auditTime
	 * @param auditComment
	 */
	public void updateAudit(@Param(value = "storeId")int storeId,@Param(value = "auditState")Integer auditState,@Param(value = "auditTime")String auditTime, @Param(value = "auditComment")String auditComment);

	public void updateStoreRegistState(Integer storeId);
}
