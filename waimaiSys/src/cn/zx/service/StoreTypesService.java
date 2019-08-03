package cn.zx.service;

import java.util.List;

import cn.zx.entity.StoreTypes;

public interface StoreTypesService {
	/**
	 * 查询所有的商家的分类
	 * @return 商家分类集合
	 */
	public List<StoreTypes> findStoreTypes();
}
