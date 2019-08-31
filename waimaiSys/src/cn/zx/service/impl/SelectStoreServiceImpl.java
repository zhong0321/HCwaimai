package cn.zx.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.glh.tools.MapHelper;
import cn.zx.entity.CommentLv;
import cn.zx.entity.Comment_User;
import cn.zx.entity.Food;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.Store_Comment;
import cn.zx.mapper.SelectStoreMapper;
import cn.zx.service.SelectStoreService;
@Service(value="selectStoreService")
public class SelectStoreServiceImpl implements SelectStoreService {
	@Resource
	private SelectStoreMapper selectStoreMapper;
	
	@Override
	public List<Store_Comment> selectstore(String add, String vl) {
		List<Store_Comment> list=selectStoreMapper.selectstore(vl);
		String Storeaddnum1="";
		if(add!=""&&add!=null){
			String[]  strs=add.split(",");
			Storeaddnum1=strs[1]+","+strs[0];
		}
		List<Store_Comment> list1 = new ArrayList<Store_Comment>();
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
				list1.add(store2);
			}
		}
		return list1;
	}
	
	@Override
	public List<Food> selectMs(String vl) {
		return selectStoreMapper.selectMs(vl);
	}

	@Override
	public List<Store_Comment> selectstoreByMs(String vl,String add) {
		List<Store_Comment> list=selectStoreMapper.selectstoreByMs(vl);
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
		return list2;
	}
	@Override
	public Store_Comment selectstores(int id) {
		return selectStoreMapper.selectstores(id);
	}
		
	@Override
	public PageInfo<Comment_User> selectComment(int id,int nulls,int number,int size) {
		PageHelper.startPage(number,size);
		List<Comment_User> list=selectStoreMapper.selectComment(id,nulls);
		PageInfo<Comment_User> pageInfo = new PageInfo<Comment_User>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<Comment_User> selectBadComment(int id, int nulls,int num, int size) {
		PageHelper.startPage(num,size);
		List<Comment_User> list=selectStoreMapper.selectBadComment(id,nulls);
		PageInfo<Comment_User> pageInfo = new PageInfo<Comment_User>(list);
		return pageInfo;
	}

	@Override
	public int findBadComment(int id) {

		return selectStoreMapper.findBadComment(id);
	}

	@Override
	public PageInfo<Comment_User> selectFineComment(int id, int nulls,int num, int size) {
		PageHelper.startPage(num,size);
		List<Comment_User> list=selectStoreMapper.selectFineComment(id,nulls);
		PageInfo<Comment_User> pageInfo = new PageInfo<Comment_User>(list);
		return pageInfo;
	}
	@Override
	public int findFineComment(int id) {
		return selectStoreMapper.findFineComment(id);
	}

	@Override
	public StoreAptitude findStoreAptitude(int id) {
		return selectStoreMapper.findStoreAptitude(id);
	}

	@Override
	public List<CommentLv> findComment(int id) {
		// TODO Auto-generated method stub
		return selectStoreMapper.findComment(id);
	}
}
