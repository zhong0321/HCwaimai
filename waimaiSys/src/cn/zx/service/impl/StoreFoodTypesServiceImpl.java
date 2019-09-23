package cn.zx.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import cn.zx.entity.Food;
import cn.zx.entity.FoodStatus;
import cn.zx.entity.FoodTypeInfo;
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
	
	@Override
	public List<FoodTypeInfo> findStoreFoodType(Integer storeId,int fsid) {
		List<FoodTypeInfo> list = storeFoodTypesMapper.findStoreFoodType(storeId);
		for (FoodTypeInfo foodTypeInfo : list) {
			FoodTypeInfo gao =storeFoodTypesMapper.findStoreFoodTypenum(foodTypeInfo.getFoodTypeId(),storeId, fsid);
			foodTypeInfo.setNum(gao.getNum());
		}
		return list;
	}
	

	@Override
	public List<FoodStatus> findStoreFoodStatus(Integer storeId) {
			FoodStatus findStoreFoodStatusOne = storeFoodTypesMapper.findStoreFoodStatusOne(storeId);
			FoodStatus findStoreFoodStatusTwos = storeFoodTypesMapper.findStoreFoodStatusTwo(storeId);
			FoodStatus findStoreFoodStatusThree = storeFoodTypesMapper.findStoreFoodStatusThree(storeId);
			List<FoodStatus> list=new ArrayList<FoodStatus>();
			list.add(0, findStoreFoodStatusOne);
			list.add(1, findStoreFoodStatusTwos);
			list.add(2, findStoreFoodStatusThree);
			return list;
	}
	
	@Override
	public List<Food> findFood(int storeid, int num,int state) {
		List<Food> findFood = storeFoodTypesMapper.findFood(storeid, num,state);
		return findFood;
	}

	@Override
	public int findfoodType(int storeId, int foodTypeiId) {
		Integer num=storeFoodTypesMapper.findfoodType(storeId, foodTypeiId);
		if(num==null){
			num=0;
		}
		return num;
	}

	@Override
	public Integer findAllFoodType(String foodType) {
		Integer num= storeFoodTypesMapper.findAllFoodType(foodType);
		if(num==null){
			num=0;
		}
		return num;
	}

	@Override
	public int addFoodTypes(String foodType) {
		try {
			storeFoodTypesMapper.addFoodTypes(foodType);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int addStoreStoretypes(int storeId, int storeTypeId) {
		try {
			storeFoodTypesMapper.addStoreStoretypes(storeId, storeTypeId);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int findFoodName(int storeId, String foodName) {
		return storeFoodTypesMapper.findFoodName(storeId,foodName);
	}

	@Override
	public int addFood(int storeId, String foodName, int foodtypeid,
			double jiage, String imgName) {
		int num = 0;
		try {
			storeFoodTypesMapper.addFood(storeId,foodName,foodtypeid,jiage,imgName);
			num=1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			num=0;
		}
		return num;
	}
	@Override
	public int updataFoodState(int foodid, int fsid) {
		try {
			Food food = new Food();
			food.setId(foodid);
			food.setFsid(fsid);
			storeFoodTypesMapper.updataFoodState(food);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public int deleteFood(int foodid) {
		try {
			storeFoodTypesMapper.deleteFood(foodid);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public Food findFoodInfo(int foodid) {
		Food food = storeFoodTypesMapper.findFoodInfo(foodid);
		return food;
	}

	@Override
	public int findFoodNames(int storeId, String foodName, int foodid) {
		return storeFoodTypesMapper.findFoodNames(storeId, foodName, foodid);
	}

	@Override
	public int updataFoodInfo(Food food) {
				try {
					storeFoodTypesMapper.updataFoodState(food);
					return 1;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return 0;
				}

	}

	@Override
	public int deleteFoodByType(int storeId, int typeid) {
		storeFoodTypesMapper.deleteFoodByType(storeId,typeid);
		return 0;
	}

	@Override
	public int deleteFoodType(int storeId, int typeid) {
		storeFoodTypesMapper.deleteFoodType(storeId,typeid);
		return 0;
	}
}