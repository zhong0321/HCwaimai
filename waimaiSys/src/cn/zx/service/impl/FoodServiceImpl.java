package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Food;
import cn.zx.mapper.FoodMapper;
import cn.zx.service.FoodService;
@Service(value="foodService")
public class FoodServiceImpl implements FoodService{

	@Resource
	private FoodMapper foodMapper;
	
	@Override
	public List<Food> findFood(Food food) {
		return foodMapper.findFood(food);
	}

}
