package cn.zx.controller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Car;
import cn.zx.entity.Store;
import cn.zx.entity.User;
import cn.zx.entity.UserAddress;
import cn.zx.service.StoreService;
import cn.zx.service.UserAddressService;

@Controller
@RequestMapping(value="car")
public class CarController {
	@Resource
	private UserAddressService userAddressService;
	@Resource
	private StoreService storeService;
	
	@RequestMapping("addUserAddress")
	@ResponseBody
	public List<UserAddress> addUserAddress(String contactName,Integer userId,String contactAddress,String contactPhone,Integer gender){
		UserAddress userAddress= new UserAddress();
		userAddress.setUserId(1);
		userAddress.setContactAddress(contactAddress);
		userAddress.setContactName(contactName);
		userAddress.setContactPhone(contactPhone);
		userAddress.setGender(gender);
		userAddressService.addUserAddress(userAddress);
		List<UserAddress> list = userAddressService.findUserAddress(userAddress);
		return list;
	}
	
	@RequestMapping("showCar/{id}")
	public String showCar(HttpServletRequest request,@PathVariable(value="id") Integer storeId,Model model){
		User user=(User)request.getSession().getAttribute("user");
		UserAddress userAddress=new UserAddress();
		userAddress.setUserId(1);
		//地址
		List<UserAddress> userAddressList = userAddressService.findUserAddress(userAddress);
		model.addAttribute("userAddressList", userAddressList);
		//商家信息
		Store store = storeService.findStoreById(storeId);
		model.addAttribute("store", store);
		@SuppressWarnings("unchecked")
		List<Car> list = (List<Car>)request.getSession().getAttribute("carList");
		request.getSession().setAttribute("carList", list);
		return "car";
	}
	
	@RequestMapping("setDefaultAddress")
	@ResponseBody
	public List<UserAddress> setDefaultAddress(Integer addressId,Integer userId){
		UserAddress userAddress=new UserAddress();
		userAddress.setIsDefault(1);
		userAddress.setUserId(1);
		List<UserAddress> list = userAddressService.findUserAddress(userAddress);//查询默认的地址
		UserAddress ua = list.get(0);
		ua.setIsDefault(0);
		userAddressService.updateUserAddress(ua);
		/*Iterator it = list.iterator();
		while(it.hasNext()){
			UserAddress ua = (UserAddress) it.next();
			ua.setIsDefault(0);
			userAddressService.updateUserAddress(ua);
		 }*/
		//重新设置默认地址
		UserAddress userAddress2=userAddressService.findById(addressId);
		userAddress2.setIsDefault(1);
		userAddressService.updateUserAddress(userAddress2);
		UserAddress userAddress3=new UserAddress();
		userId=1;
		userAddress3.setUserId(userId);
		List<UserAddress> list1 = userAddressService.findUserAddress(userAddress3);
		return list1;
	}
}
