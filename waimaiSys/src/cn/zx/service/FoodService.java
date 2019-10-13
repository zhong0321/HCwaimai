package cn.zx.service;

import java.util.List;

import cn.zx.entity.Food;

public interface FoodService {
	/**
	 * 查询商家菜品
	 * @param food
	 * @return List<Food>  
	 * @author ZX 
	 * @date 2019-6-30下午2:12:19
	 */
	public List<Food> findFood(Food food);
	/**
	 * 根据id查询菜品
	 * @param id
	 * @return 
	 * Food  
	 * @author ZX 
	 * @date 2019-9-24上午10:58:06
	 */
	public Food findFoodById(Integer id);
}
