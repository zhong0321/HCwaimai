package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.StoreStoreTypes;
import cn.zx.mapper.StoreStoreTypesMapper;
import cn.zx.service.StoreStoreTypesService;
@Service("storeStoreTypesService")
public class StoreStoreTypesServiceImpl implements StoreStoreTypesService {
	@Resource
	private StoreStoreTypesMapper storeStoreTypesMapper;

	@Override
	public void addStoreStoreTypes(StoreStoreTypes storeStoreTypes) {
		storeStoreTypesMapper.addStoreStoreTypes(storeStoreTypes);
	}

}
