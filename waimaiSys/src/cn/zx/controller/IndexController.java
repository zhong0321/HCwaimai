package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.zx.entity.Store;
import cn.zx.entity.StoreTypes;
import cn.zx.service.StoreService;
import cn.zx.service.StoreTypesService;

@Controller
@RequestMapping(value="index")
public class IndexController {
	@Resource
	private StoreTypesService storeTypesService;
	@Resource
	private StoreService storeService;
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request,String province,String city,String address,String lnglat){
		//将收获地址存入application
		request.getSession().setAttribute("province", province);
		request.getSession().setAttribute("city", city);
		request.getSession().setAttribute("address", address);
		request.getSession().setAttribute("lnglat", lnglat);
		return "redirect:/index/find";
	}
	
	/**
	 * 根据收货地址查询所有商家
	 * ZX 2019-6-29上午9:22:44
	 */
	@RequestMapping(value="/find")
	public String find(Model model,HttpServletRequest request){
		String province=(String)request.getSession().getAttribute("province");
		String city=(String)request.getSession().getAttribute("city");
		String address=(String)request.getSession().getAttribute("address");
		
		//查询商家分类
		List<StoreTypes> storeTypes = storeTypesService.findStoreTypes();
		request.getSession().setAttribute("storeTypes", storeTypes);
		
		//根据收获地址查询附近商家
		Store store=new Store();
		store.setProvince(province);
		store.setCity(city);
		//截取出行政区
		String district=address.substring(address.indexOf("市")+1, address.indexOf("区")+1);
		store.setArea(district);
		
		//List<Store> storeByAddress = storeService.findStoreByAddress(store);
		//request.getSession().setAttribute("storeByAddress", storeByAddress);
		
		return "index";
	}
	
	/**
	 * 根据商家分类查询
	 * ZX 2019-6-29上午9:25:37
	 */
	@RequestMapping(value="/findByStoreTypes/{id}")
	public String findByStoreTypes(@PathVariable("id") Integer storeTypeId,Model model,HttpServletRequest request){
		System.out.println(storeTypeId);
		String province=(String) request.getSession().getAttribute("province");
		String city=(String) request.getSession().getAttribute("city");
		String address=(String) request.getSession().getAttribute("address");
		
		//查询商家分类
		List<StoreTypes> storeTypes = storeTypesService.findStoreTypes();
		model.addAttribute("storeTypes", storeTypes);
		
		//根据收获地址查询附近商家
		Store store=new Store();
		store.setProvince(province);
		store.setCity(city);
		//截取出行政区
		String district=address.substring(address.indexOf("市")+1, address.indexOf("区")+1);
		store.setArea(district);
		
		if(storeTypeId!=null&&storeTypeId!=0){
			store.setStoreTypeId(storeTypeId);
		}
		
		List<Store> storeByAddress = storeService.findStoreByAddress(store);
		model.addAttribute("storeByAddress", storeByAddress);
		return "index";
	}
}
