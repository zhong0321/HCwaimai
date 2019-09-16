package cn.zx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.Food;
import cn.zx.entity.FoodStatus;
import cn.zx.entity.FoodTypeInfo;
import cn.zx.entity.StoreFoodTypes;

public interface StoreFoodTypesMapper {
	
	/**
	 * 
	 * @param storeId
	 * @return
	 */
	List<StoreFoodTypes> findStoreFoodTypes(Integer storeId);
	
	/**
	 * 查询订单售卖中个数
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusOne(Integer storeId);
	
	/**
	 * 查询订单已下架个数
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusTwo(Integer storeId);
	
	/**
	 * 查询订单已售罄个数
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusThree(Integer storeId);
	
	/**
	 * 查询店铺菜品可根据类型 状态查询
	 * @param storeid
	 * @param num
	 * @param state
	 * @return
	 */
	List<Food> findFood(@Param("storeid")int storeid,@Param("num")int num,@Param("state")Integer state);
	
	/**
	 * 店铺的菜品分类
	 * @param storeId
	 * @return
	 */
	List<FoodTypeInfo> findStoreFoodType(Integer storeId);
	
	
	/**
	 * 店铺菜品分类的菜品个数
	 * @param storeId
	 * @param foodTypeId
	 * @return
	 */
	FoodTypeInfo findStoreFoodTypenum(@Param("foodTypeId")Integer foodTypeId,@Param("storeId")Integer storeId,@Param("fsid")int fsid);
	
	/**
	 * 查询店铺内是否存在食品类型
	 * @param storeId
	 * @param foodType
	 * @return
	 */
	int findfoodType(@Param("storeId")int storeId,@Param("foodTypeId")int foodTypeId);
	
	/**
	 * 查看是否存在食品类型
	 * @param foodType
	 * @return
	 */
	Integer findAllFoodType(@Param("foodType")String foodType);
	
	/**
	 * 添加食品类型
	 * @param foodType
	 */
	void addFoodTypes(@Param("foodType")String foodType);
	
	/**
	 * 添加食品类型中间表
	 * @param storeId
	 * @param storeTypeId
	 */
	void addStoreStoretypes(@Param("storeId")int storeId,@Param("storeTypeId")int storeTypeId);
}
