package cn.zx.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Car;
import cn.zx.entity.Food;
import cn.zx.entity.Order;
import cn.zx.entity.OrderDetail;
import cn.zx.entity.Store;
import cn.zx.entity.User;
import cn.zx.entity.UserAddress;
import cn.zx.service.FoodService;
import cn.zx.service.OrderDetailService;
import cn.zx.service.OrderService;
import cn.zx.service.StoreService;
import cn.zx.service.UserAddressService;

@Controller
@RequestMapping(value="/car")
public class CarController {
	@Resource
	private UserAddressService userAddressService;
	@Resource
	private StoreService storeService;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetailService orderDetailService;
	@Resource
	private FoodService foodService;
	
	
	/**
	 * 添加地址
	 * @param contactName
	 * @param userId
	 * @param contactAddress
	 * @param contactPhone
	 * @param gender
	 * @return 
	 * List<UserAddress>  
	 * @author ZX 
	 * @date 2019-8-5上午10:38:00
	 */
	@RequestMapping("/addUserAddress")
	@ResponseBody
	public List<UserAddress> addUserAddress(String contactName,Integer userId,String contactAddress,String contactPhone,Integer gender){
		UserAddress userAddress= new UserAddress();
		userAddress.setUserId(userId);
		userAddress.setContactAddress(contactAddress);
		userAddress.setContactName(contactName);
		userAddress.setContactPhone(contactPhone);
		userAddress.setGender(gender);
		userAddressService.addUserAddress(userAddress);
		List<UserAddress> list = userAddressService.findUserAddress(userAddress);
		return list;
	}
	
	/**
	 * 显示购物车信息
	 * @param request
	 * @param storeId
	 * @param model
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-5上午10:37:44
	 */
	@RequestMapping("/showCar/{id}")
	public String showCar(HttpServletRequest request,@PathVariable(value="id") Integer storeId,Model model){
		User user=(User)request.getSession().getAttribute("user");
		UserAddress userAddress=new UserAddress();
		userAddress.setUserId(user.getId());
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
	
	/**
	 * 设置默认地址
	 * @param addressId
	 * @param userId
	 * @return 
	 * List<UserAddress>  
	 * @author ZX 
	 * @date 2019-8-5上午10:36:48
	 */
	@RequestMapping("/setDefaultAddress")
	@ResponseBody
	public List<UserAddress> setDefaultAddress(Integer addressId,Integer userId){
		UserAddress userAddress=new UserAddress();
		userAddress.setIsDefault(1);
		userAddress.setUserId(userId);
		List<UserAddress> list = userAddressService.findUserAddress(userAddress);//查询默认的地址
		if(list.size()!=0){//如果有默认地址，将默认地址状态改变
			UserAddress ua = list.get(0);
			ua.setIsDefault(0);
			userAddressService.updateUserAddress(ua);
		}
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
		userAddress3.setUserId(userId);
		List<UserAddress> list1 = userAddressService.findUserAddress(userAddress3);
		return list1;
	}
	
	@ResponseBody
	@RequestMapping("/deleteAddress")
	public String deleteAddress(Integer id){
		userAddressService.deleteUserAddress(id);
		return "1";
	}
	
	/**
	 * 查询菜品是否在售中
	 * @param storeId
	 * @param request
	 * @return 
	 * Food  
	 * @author ZX 
	 * @date 2019-9-24上午11:12:32
	 */
	@RequestMapping("/findFoodState")
	@ResponseBody
	public Food findFoodState(Integer storeId,HttpServletRequest request){
		List<Car> cars=(List<Car>)request.getSession().getAttribute("carList");
		for (Car car : cars) {
			if(car.getStoreId()==storeId){
				Food food = foodService.findFoodById(car.getFoodId());
				if(food.getFsid()!=1){
					return food;//菜品已售罄或已下架
				}
			}
		}
		return null;
	}
	
	/**
	 * 确认下单
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-5上午10:39:30
	 */
	@RequestMapping("/sureOrders/{userAddressId}/{remarks}/{storeId}")
	public String sureOrders(@PathVariable(value="userAddressId") Integer id,@PathVariable(value="remarks") String remarks,@PathVariable(value="storeId") Integer storeId,HttpServletRequest request){
		UserAddress userAddress = userAddressService.findById(id);//查询地址
		String orderAddress="";
		if(userAddress.getGender()==0){
			orderAddress=userAddress.getContactName()+"(女士)  "+userAddress.getContactPhone()+"  "+userAddress.getContactAddress();
		}else{
			orderAddress=userAddress.getContactName()+"(先生)  "+userAddress.getContactPhone()+"  "+userAddress.getContactAddress();
		}
		User user = (User)request.getSession().getAttribute("user");//获取会话中的用户信息
		String uuid = UUID.randomUUID().toString().trim();//生成16位随机数
		String orderNumber=uuid+user.getId();//订单号，为确保高并发下订单的唯一性，加入用户id
		@SuppressWarnings("unchecked")
		List<Car> cars=(List<Car>)request.getSession().getAttribute("carList");
		double totalMoney=0;
		for (Car car : cars) {
			if(car.getStoreId()==storeId){
				System.out.println(car);
				totalMoney=totalMoney+(car.getPrice()*car.getCount());
			}
		}
		Store store = storeService.findStoreById(storeId);
		double disMoney=store.getDistributionMoney();
		totalMoney=totalMoney+store.getDistributionMoney();
		if(disMoney<5){
			disMoney=5;
		}
		//添加订单
		Order order=new Order();
		order.setOrderAddress(orderAddress);
		order.setUserId(user.getId());
		order.setOrderNumber(orderNumber);
		order.setTotalMoney(totalMoney);
		order.setStoreId(storeId);
		order.setOrderRemarks(remarks);
		order.setOrderState(0);
		order.setDisMoney(disMoney);
		orderService.addOrder(order);
		Order order2 = orderService.findByOrderNumber(order);
		//添加订单明细
		OrderDetail orderDetail =new OrderDetail();
		for (Car car : cars) {
			if(car.getStoreId()==storeId){
				orderDetail.setCost(car.getPrice()*car.getCount());
				orderDetail.setCount(car.getCount());
				orderDetail.setFoodId(car.getFoodId());
				orderDetail.setOrderId(order2.getId());
				orderDetailService.addOrderDetail(orderDetail);
			}
		}
		request.getSession().setAttribute("orderID", order2.getId());
		request.getSession().removeAttribute("carList");//清除购物车session
		return "redirect:/order/showOrder";
	}
}
