package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Store;
import cn.zx.mapper.StoreMapper;
import cn.zx.service.StoreService;
@Service
public class StoreServiceImpl implements StoreService {
	@Resource
	private StoreMapper storeMapper;

	@Override
	public List<Store> findStoreByAddress(Store store) {
		return storeMapper.findStoreByAddress(store);
	}

	@Override
	public Store findStoreById(Integer id) {
		return storeMapper.findStoreById(id);
	}

	@Override
	public Store phonePwdLogin(Store store) {
		Store stores = storeMapper.phonePwdLogin(store);
		return stores;
	}

	@Override
	public Store storePhoneLogin(String phone) {
		Store store=storeMapper.storePhoneLogin(phone);
		return store;
	}

	@Override
	public void addStore(Store store) {
		storeMapper.addStore(store);
	}

	@Override
	public void updateStore(Store store) {
		storeMapper.updateStore(store);
	}


}
