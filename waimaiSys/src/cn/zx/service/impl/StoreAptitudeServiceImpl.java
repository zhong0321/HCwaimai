package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.StoreAptitude;
import cn.zx.mapper.StoreAptitudeMapper;
import cn.zx.service.StoreAptitudeService;
@Service("storeAptitudeService")
public class StoreAptitudeServiceImpl implements StoreAptitudeService {
	@Resource
	private StoreAptitudeMapper storeAptitudeMapper;

	@Override
	public void addStoreAptitude(StoreAptitude storeAptitude) {
		storeAptitudeMapper.addStoreAptitude(storeAptitude);
	}

}
