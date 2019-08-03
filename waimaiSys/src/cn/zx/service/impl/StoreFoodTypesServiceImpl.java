package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.StoreFoodTypes;
import cn.zx.mapper.StoreFoodTypesMapper;
import cn.zx.service.StoreFoodTypesService;
@Service(value="storeFoodTypesService")
public class StoreFoodTypesServiceImpl implements StoreFoodTypesService {
	@Resource
	private StoreFoodTypesMapper storeFoodTypesMapper;
	
	@Override
	public List<StoreFoodTypes> findStoreFoodTypes(Integer storeId) {
		return storeFoodTypesMapper.findStoreFoodTypes(storeId);
	}

}
