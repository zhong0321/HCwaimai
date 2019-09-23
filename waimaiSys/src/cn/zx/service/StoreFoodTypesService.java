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
	 * @param storeId 
	 * @param foodType
	 * @param imgName 
	 * @param jiage 
	 * @param foodtypeid 
	 */
	int addFoodTypes(String foodType);
	
	/**
	 * 添加食品类型中间表
	 * @param storeId
	 * @param storeTypeId
	 */
	int addStoreStoretypes(int storeId,int storeTypeId);
	
	/**
	 * 查看店铺内是否存在商品
	 * @param storeId
	 * @param foodName
	 * @return
	 */
	public int findFoodName(int storeId, String foodName);
	
	/**
	 * 添加商品
	 * @param storeId
	 * @param foodName
	 * @param foodtypeid
	 * @param jiage
	 * @param imgName
	 * @return
	 */
	public int addFood(int storeId, String foodName, int foodtypeid,
			double jiage, String imgName);
	
	/**
	 * 修改商品上架下架状态
	 * @param foodid
	 * @param storeid
	 */
	public int updataFoodState(int foodid, int fsid);
	
	/**
	 * 删除商品
	 * @param foodid
	 * @return
	 */
	public int deleteFood(int foodid);
	
	/**
	 * 根据商品id查询商品信息
	 * @param foodid
	 * @return
	 */
	public Food findFoodInfo(int foodid);
	
	
	public int findFoodNames(int storeId, String foodName, int foodid);
	/**
	 * 修改商品信息
	 * @param food
	 * @return
	 */
	public int updataFoodInfo(Food food);
	
	/**
	 * 根据商品类型删除商品
	 * @param storeId
	 * @param typeid
	 * @return
	 */
	public int deleteFoodByType(int storeId, int typeid);
	
	/**
	 * 删除商品和类型的中间表
	 * @param storeId
	 * @param typeid
	 * @return
	 */
	public int deleteFoodType(int storeId, int typeid);
}
