package cn.zx.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.zx.entity.Food;
import cn.zx.entity.FoodStatus;
import cn.zx.entity.FoodTypeInfo;
import cn.zx.entity.Store;
import cn.zx.service.StoreFoodTypesService;
import cn.zx.service.StoreService;

@Controller
public class StoreShowFoodController {
	@Resource
	private StoreFoodTypesService foodTypesService;
	@Resource
	private StoreService storeService;

	@RequestMapping("/findfoodtype/{id}/{num}/{state}")
	public String findfoodtype(Model model, @PathVariable("id") int id,
			@PathVariable("num") int nums, @PathVariable("state") int state) {
		List<FoodTypeInfo> findStoreFoodType = foodTypesService
				.findStoreFoodType(id, nums);
		List<FoodStatus> findStoreFoodStatus = foodTypesService
				.findStoreFoodStatus(id);
		List<Food> findFood = foodTypesService.findFood(id, nums, state);
		int num = 0;
		for (FoodStatus foodStatus : findStoreFoodStatus) {
			num += foodStatus.getNum();
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
	public int findfoodTypes(int storeId, int foodType) {
		return foodTypesService.findfoodType(storeId, foodType);
	}

	@RequestMapping("/findFoodName")
	@ResponseBody
	public int findFoodName(int storeId, String foodName) {
		return foodTypesService.findFoodName(storeId, foodName);
	}


	@RequestMapping("/findFoodNames")
	@ResponseBody
	public int findFoodNames(int storeId, String foodName,int foodid) {
		return foodTypesService.findFoodNames(storeId, foodName,foodid);
	}
	@RequestMapping("/findAllFoodType")
	@ResponseBody
	public int findAllFoodType(String foodType) {
		return foodTypesService.findAllFoodType(foodType);
	}

	@RequestMapping("/addFoodTypes")
	@ResponseBody
	public int addFoodTypes(String foodType) {
		return foodTypesService.addFoodTypes(foodType);
	}

	@RequestMapping("/addStoreStoretypes")
	@ResponseBody
	public int addStoreStoretypes(int storeId, int storeTypeId) {
		return foodTypesService.addStoreStoretypes(storeId, storeTypeId);
	}

	String imgName="";
	
	@RequestMapping("/addFood")
	@ResponseBody
	public int addFood(int storeId, String foodName, int foodtypeid,
			double jiage) {
		 int a=foodTypesService.addFood(storeId, foodName, foodtypeid, jiage,
				imgName);
		 Store store = storeService.findStoreById(storeId);
		 if(store.getRegistState()==0){
			 storeService.updateStoreRegistState(storeId);
		 }
		 imgName="";
		 return a;
	}

	@RequestMapping("/uploadimg")
	@ResponseBody
	public int uploadimg(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		String uuid = UUID.randomUUID().toString().trim();
		try {
			String fileN = file.getOriginalFilename();
			int index = fileN.indexOf(".");
			String fileName = uuid + fileN.substring(index);// 文件名
			String opath = request.getServletContext().getRealPath(
					"static" + File.separator + "images");
			String path = opath + File.separator + fileName;
			File newFile = new File(path);
			// 通过CommonsMultipartFile的方法直接写文件（注意这个时候）
			file.transferTo(newFile);
			imgName=fileName;
			return 1;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@RequestMapping("/updataFoodState")
	@ResponseBody
	public int updataFoodState(@RequestParam("foodid")int foodid,@RequestParam("fsid")int fsid){
		return foodTypesService.updataFoodState(foodid,fsid);
	}
	
	@RequestMapping("/deleteFood")
	@ResponseBody
	public int deleteFood(@RequestParam("foodid")int foodid){
		return foodTypesService.deleteFood(foodid);
	}
	
	@RequestMapping("/findFoodInfo")
	@ResponseBody
	public Food findFoodInfo(int foodid){
		Food food = foodTypesService.findFoodInfo(foodid);
		return food;
		
	}
	
	@RequestMapping("/updataFoodInfo")
	@ResponseBody
	public int updataFoodInfo(Food food){
		food.setFoodImage(imgName);
		return foodTypesService.updataFoodInfo(food);
	}
	
	@RequestMapping("/deleteFoodByType")
	@ResponseBody
	public int deleteFoodByType(int storeId,int typeid){
		try {
			foodTypesService.deleteFoodByType(storeId,typeid);
			foodTypesService.deleteFoodType(storeId, typeid);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
