package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.StoreTypes;
import cn.zx.mapper.StoreTypesMapper;
import cn.zx.service.StoreTypesService;
@Service
public class StoreTypesServiceImpl implements StoreTypesService {
	@Resource
	private StoreTypesMapper storeTypeMapper;

	@Override
	public List<StoreTypes> findStoreTypes() {
		return storeTypeMapper.findStoreTypes();
	}

}
