package cn.zx.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.glh.tools.MapHelper;
import cn.zx.entity.Store;
import cn.zx.entity.Store_Comment;
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
	
	@Override
	public List<Store_Comment> findStoreInfo(int storeTypeId, int sorttype,
			int sortorder,String add) {
		List<Store_Comment> list=storeMapper.findStoreInfo(storeTypeId, sorttype, sortorder);
			String Storeaddnum1="";
			if(add!=""&&add!=null){
				String[]  strs=add.split(",");
				Storeaddnum1=strs[1]+","+strs[0];
			}
			List<Store_Comment> list2 = new ArrayList<Store_Comment>();
			for (Store_Comment store2 : list) {
				String gg=store2.getCoordinate();
				String[]  strs=gg.split(",");
				String Storeaddnum2=strs[1]+","+strs[0];
				store2.setCoordinate(Storeaddnum2);
				double dd = MapHelper.GetPointDistance(Storeaddnum1, store2.getCoordinate());
				if(dd<=5.00){
					BigDecimal b = new BigDecimal(dd*1000);                                
					double f1 = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();      
					store2.setJuli(f1);
					list2.add(store2);
				}
			}
			if(sorttype==1){
			//根据距离正序
			if(sortorder==2){
			    Collections.sort(list2,new Comparator<Store_Comment>() {
			    	  @Override
			    	  public int compare(Store_Comment o1, Store_Comment o2) {
			    	      return (int)o1.getJuli() - (int)o2.getJuli();
			    	  }
			    	});
			}else{//倒序
			    Collections.sort(list2,new Comparator<Store_Comment>() {
			    	  @Override
			    	  public int compare(Store_Comment o1, Store_Comment o2) {
			    	      return (int)o2.getJuli() - (int)o1.getJuli();
			    	  }
			    });
			}
			list=list2;
		}
		return list2;
	}
}

