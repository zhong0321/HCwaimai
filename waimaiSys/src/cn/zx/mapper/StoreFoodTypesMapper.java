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
	 * 
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusOne(Integer storeId);

	/**
	 * 查询订单已下架个数
	 * 
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusTwo(Integer storeId);

	/**
	 * 查询订单已售罄个数
	 * 
	 * @param storeId
	 * @return
	 */
	FoodStatus findStoreFoodStatusThree(Integer storeId);

	/**
	 * 查询店铺菜品可根据类型 状态查询
	 * 
	 * @param storeid
	 * @param num
	 * @param state
	 * @return
	 */
	List<Food> findFood(@Param("storeid") int storeid, @Param("num") int num,
			@Param("state") Integer state);

	/**
	 * 店铺的菜品分类
	 * 
	 * @param storeId
	 * @return
	 */
	List<FoodTypeInfo> findStoreFoodType(Integer storeId);

	/**
	 * 店铺菜品分类的菜品个数
	 * 
	 * @param storeId
	 * @param foodTypeId
	 * @return
	 */
	FoodTypeInfo findStoreFoodTypenum(@Param("foodTypeId") Integer foodTypeId,
			@Param("storeId") Integer storeId, @Param("fsid") int fsid);

	/**
	 * 查询店铺内是否存在食品类型
	 * 
	 * @param storeId
	 * @param foodType
	 * @return
	 */
	int findfoodType(@Param("storeId") int storeId,
			@Param("foodTypeId") int foodTypeId);

	/**
	 * 查看是否存在食品类型
	 * 
	 * @param foodType
	 * @return
	 */
	Integer findAllFoodType(@Param("foodType") String foodType);

	/**
	 * 添加食品类型
	 * 
	 * @param foodType
	 */
	void addFoodTypes(@Param("foodType") String foodType);

	/**
	 * 添加食品类型中间表
	 * 
	 * @param storeId
	 * @param storeTypeId
	 */
	void addStoreStoretypes(@Param("storeId") int storeId,
			@Param("storeTypeId") int storeTypeId);

	/**
	 * 查看店铺内是否存在商品
	 * 
	 * @param storeId
	 * @param foodName
	 * @return
	 */
	int findFoodName(@Param("storeId") int storeId,
			@Param("foodName") String foodName);

	/**
	 * 添加商品
	 * 
	 * @param storeId
	 * @param foodName
	 * @param foodtypeid
	 * @param jiage
	 * @param imgName
	 */
	void addFood(@Param("storeId") int storeId,
			@Param("foodName") String foodName,
			@Param("foodTypeId") int foodtypeid, @Param("price") double jiage,
			@Param("foodImage") String imgName);

	/**
	 * 修改商品信息
	 * 
	 * @param foodid
	 * @param storeid
	 */
	void updataFoodState(@Param("food")Food food);

	/**
	 * 删除商品
	 * @param foodid
	 */
	void deleteFood(int foodid);
/**
 * 根据商品id查询商品
 * @param foodid
 * @return
 */
	Food findFoodInfo(int foodid);

int findFoodNames(@Param("storeId") int storeId, @Param("foodName") String foodName, @Param("foodid") int foodid);

void deleteFoodByType(@Param("storeId")int storeId, @Param("foodTypeId")int typeid);

void deleteFoodType(@Param("storeId")int storeId,@Param("foodTypeId")int typeid);
}
