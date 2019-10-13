package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.Food;

public interface FoodMapper {
	public List<Food> findFood(Food food);
	public Food findFoodById(Integer id);
}
