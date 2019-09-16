package cn.zx.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Car;
import cn.zx.entity.Food;
import cn.zx.entity.Store;
import cn.zx.entity.StoreFoodTypes;
import cn.zx.service.FoodService;
import cn.zx.service.SelectStoreService;
import cn.zx.service.StoreFoodTypesService;
import cn.zx.service.StoreService;

/**
 * 商家
 * @author zx
 * @date 2019-6-30下午12:03:53
 */
@Controller
@RequestMapping(value="restaurant")
public class RestaurantController {
	@Resource
	private StoreService storeService;
	@Resource
	private SelectStoreService selectStoreService;
	@Resource
	private StoreFoodTypesService storeFoodTypesService;
	@Resource
	private FoodService foodService;
	
	@RequestMapping(value="findAll/{id}")
	public String findAll(@PathVariable(value="id") Integer storeId,Model model){
		//商家信息
		Store store = storeService.findStoreById(storeId);
		model.addAttribute("store", store);
		//菜品分类
		List<StoreFoodTypes> storeFoodTypes = storeFoodTypesService.findStoreFoodTypes(storeId);
		model.addAttribute("storeFoodTypes", storeFoodTypes);
		//菜品
		Food foods=new Food();
		foods.setStoreId(storeId);
		List<Food> food = foodService.findFood(foods);
		for (Food food2 : food) {
			System.out.println(food2.toString());
		}
		model.addAttribute("food", food);
		return "restaurant";
	}
/*	
	@RequestMapping(value="findinfo/{name}")
	public String findinfo(@PathVariable(value="name") String name,Model model){
		//商家信息
		selectStoreService.selectstores(name);
		return "pinglun";
	}*/
	/**
	 * 添加菜品到购物车
	 * @author ZX 
	 * @date 2019-7-7下午3:44:15
	 */
	@RequestMapping(value="/carAdd")
	@ResponseBody
	public List<Car> carAdd(HttpServletRequest request,HttpServletResponse response,Integer foodId,String foodName, Integer count,Integer storeId,double price){
		boolean flag = false;
		if(count==null){
			count=1;
		}
		List<Car> list = (List)request.getSession().getAttribute("carList");
		if(list==null)
		{
			list = new ArrayList<Car>();
		}
		for (Car car : list) {
			if(car.getFoodId().equals(foodId)){
				car.setCount(car.getCount()+1);
				flag = true;
				break;
			}
		}
		if(!flag)
		{
			Car car=new Car();
			car.setCount(count);
			car.setFoodId(foodId);
			car.setFoodName(foodName);
			car.setPrice(price*count);
			car.setStoreId(storeId);
			list.add(car);
		}
		
		request.getSession().setAttribute("carList", list);
		return list;
	}
	
	@RequestMapping(value="/carDelete")
	@ResponseBody
	public String carDelete(HttpServletRequest request,Integer storeId){
		List<Car> list = (List)request.getSession().getAttribute("carList");
		 Iterator it = list.iterator();
		 while(it.hasNext()){
			 Object obj = it.next();
			 System.out.println(obj);
			 if(((Car)obj).getStoreId()==storeId){
				 it.remove();
			 }
		 }
		
		request.getSession().setAttribute("carList", list);
		return "1";
	}
	
	@RequestMapping(value="/countChange")
	@ResponseBody
	public List<Car> countChange(HttpServletRequest request,Integer foodId,Integer count){
		List<Car> list = (List)request.getSession().getAttribute("carList");
		for (Car car : list) {
			System.out.println(car);
			if(car.getFoodId().equals(foodId)){
				if(count==0){
					list.remove(car); 
				}else{
					car.setCount(count);
				}
				break;
			}
		}
		request.getSession().setAttribute("carList", list);
		return list;
	}
}
