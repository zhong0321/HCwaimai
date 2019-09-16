package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Food;
import cn.zx.entity.FoodStatus;
import cn.zx.entity.FoodTypeInfo;
import cn.zx.service.StoreFoodTypesService;
@Controller
public class StoreShowFoodController {
	@Resource
	private StoreFoodTypesService foodTypesService;
	@RequestMapping("/findfoodtype/{id}/{num}/{state}")
	public String findfoodtype(Model model,@PathVariable("id") int id,@PathVariable("num")int nums,@PathVariable("state")int state){
		List<FoodTypeInfo> findStoreFoodType = foodTypesService.findStoreFoodType(id,nums);
		List<FoodStatus> findStoreFoodStatus = foodTypesService.findStoreFoodStatus(id);
		List<Food> findFood = foodTypesService.findFood(id, nums,state);
		int num=0;
		for (FoodStatus foodStatus : findStoreFoodStatus) {
			num+=foodStatus.getNum();
		}
		model.addAttribute("findStoreFoodType", findStoreFoodType);
		model.addAttribute("one", findStoreFoodStatus.get(0).getNum());
		model.addAttribute("two", findStoreFoodStatus.get(2).getNum());
		model.addAttribute("three", findStoreFoodStatus.get(1).getNum());
		model.addAttribute("num", num);
		model.addAttribute("findFood", findFood);
		model.addAttribute("id", id);
		model.addAttribute("nums", nums);
		return "storeShowFood";
	}
	
	@RequestMapping("/findfoodTypes")
	@ResponseBody
	public int findfoodTypes(int storeId,int foodType){
		return foodTypesService.findfoodType(storeId, foodType);
	}
	@RequestMapping("/findAllFoodType")
	@ResponseBody
	public int findAllFoodType(String foodType){
		return foodTypesService.findAllFoodType(foodType);
	}
	
	@RequestMapping("/addFoodTypes")
	@ResponseBody
	public int addFoodTypes(String foodType){
		return foodTypesService.addFoodTypes(foodType);
	}
	@RequestMapping("/addStoreStoretypes")
	@ResponseBody
	public int addStoreStoretypes(int storeId,int storeTypeId){
		return foodTypesService.addStoreStoretypes(storeId, storeTypeId);
	}
	
}
