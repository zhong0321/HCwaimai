package cn.zx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Store;

public interface StoreMapper {
	public List<Store> findStoreByAddress(Store store);
	public Store findStoreById(Integer id);
	public Store phonePwdLogin(Store store);
	public Store storePhoneLogin(@Param(value = "phone")String phone);
	public void addStore(Store store);
	public void updateStore(Store store);
}
