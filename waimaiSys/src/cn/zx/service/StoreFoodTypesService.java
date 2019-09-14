package cn.zx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Food;
import cn.zx.entity.FoodStatus;
import cn.zx.entity.FoodTypeInfo;
import cn.zx.entity.StoreFoodTypes;

public interface StoreFoodTypesService {
	
	public List<FoodStatus> findStoreFoodStatus(Integer storeId);
	/**
	 * 根据商家id查询菜品类型
	 * @param storeId
	 * @return List<StoreFoodTypes>  
	 * @author ZX 
	 * @date 2019-6-30下午1:53:11
	 */
	public List<StoreFoodTypes> findStoreFoodTypes(Integer storeId);
	
	/**
	 * 店铺的菜品分类
	 * @param storeId
	 * @return
	 */
	List<FoodTypeInfo> findStoreFoodType(Integer storeId,int fsid);
	
	
	List<Food> findFood(int storeid,int num,int state);
	
	/**
	 * 查询店铺内是否存在食品类型
	 * @param storeId
	 * @param foodType
	 * @return
	 */
	int findfoodType(int storeId,int foodTypeId);
	
	/**
	 * 查看是否存在食品类型
	 * @param foodType
	 * @return
	 */
	Integer findAllFoodType(String foodType);
	
	/**
	 * 添加食品类型
	 * @param foodType
	 */
	int addFoodTypes(String foodType);
	
	/**
	 * 添加食品类型中间表
	 * @param storeId
	 * @param storeTypeId
	 */
	int addStoreStoretypes(int storeId,int storeTypeId);
}
