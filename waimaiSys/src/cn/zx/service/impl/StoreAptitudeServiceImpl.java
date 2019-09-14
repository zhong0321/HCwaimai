package cn.zx.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.StoreAptitude;
import cn.zx.mapper.StoreAptitudeMapper;
import cn.zx.mapper.StoreMapper;
import cn.zx.service.StoreAptitudeService;
@Service("storeAptitudeService")
public class StoreAptitudeServiceImpl implements StoreAptitudeService {
	@Resource
	private StoreAptitudeMapper storeAptitudeMapper;
	
	@Resource
	private StoreMapper storeMapper;

	@Override
	public void addStoreAptitude(StoreAptitude storeAptitude) {
		storeAptitudeMapper.addStoreAptitude(storeAptitude);
	}
	
	public void updateStoreAptitude(StoreAptitude storeAptitude){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		storeMapper.updateAudit(storeAptitude.getStoreId(),1, df.format(new Date()).toString(), "");
	}
}
