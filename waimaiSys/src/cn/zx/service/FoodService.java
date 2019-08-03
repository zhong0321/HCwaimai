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
}
