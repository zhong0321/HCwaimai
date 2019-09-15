package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.DeliveryMan;
import cn.zx.entity.Order;
import cn.zx.entity.OrderDetail;
import cn.zx.service.DeliveryManService;
import cn.zx.service.OrderDetailService;
import cn.zx.service.OrderService;

@Controller
@RequestMapping("dmOrder")
public class DmOrderController {
	@Resource
	private DeliveryManService deliveryManService;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetailService orderDetailService;
	
	/**
	 * 查询待抢订单
	 * @param request
	 * @param model
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-23上午11:23:11
	 */
	@RequestMapping("/qiangDan/{orderState}")
	public String qiangDan(HttpServletRequest request,Model model,@PathVariable Integer orderState){
		DeliveryMan dm=(DeliveryMan)request.getSession().getAttribute("deliveryMan");
		List<Order> orderList=null;
		if(orderState==2){
			String address=dm.getCommonlyAddress();
			String district=address.substring(address.indexOf("市")+1, address.indexOf("区")+1);//截取出行政区
			orderList = orderService.findOrderByStoreAddress(district);
		}else{
			Order order=new Order();
			order.setDeliveryManId(dm.getId());
			order.setOrderState(orderState);
			orderList = orderService.findOrder(order);
		}
		System.out.println(orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("now", orderState);
		return "dmOrder";
		
	}
	
	/**
	 * 查询订单是否在配送范围内
	 * @param request
	 * @param ids
	 * @return 
	 * Order  
	 * @author ZX 
	 * @date 2019-8-24上午8:48:52
	 */
	@ResponseBody
	@RequestMapping("/findOrderDM")
	public Order findOrderDM(HttpServletRequest request,String ids){
		DeliveryMan dm=(DeliveryMan)request.getSession().getAttribute("deliveryMan");
		String address=dm.getCommonlyAddress();
		String district=address.substring(address.indexOf("市")+1, address.indexOf("区")+1);//截取出行政区
		Integer id=Integer.parseInt(ids);
		Order order=orderService.findDmOrderDis(id,district);
		return order;
	}
	
	/**
	 * 抢单
	 * @param request
	 * @param ids
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-24上午10:16:59
	 */
	@ResponseBody
	@RequestMapping("/sureQiangDan")
	public String sureQiangDan(HttpServletRequest request,Integer id){
		Order order = orderService.findById(id);
		if(order.getOrderState()==2 && order.getDeliveryManId()==null){//状态为2，表示还没有外卖员接单
			DeliveryMan dm=(DeliveryMan)request.getSession().getAttribute("deliveryMan");
			order.setOrderState(3);//外卖员接单
			order.setId(id);
			order.setDeliveryManId(dm.getId());
			System.out.println(order);
			orderService.updateOrder(order);
			return "1";//抢单成功
			
		}else{
			return "0";//抢单失败
		}
	}
	
	/**
	 * 确认已取餐，送达的状态修改
	 * @param request
	 * @param id
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-26下午1:57:45
	 */
	@ResponseBody
	@RequestMapping("/sureGetFood")
	public String sureGetFood(HttpServletRequest request,Integer id,Integer orderState,Double disMoney){
		Order order=new Order();
		order.setId(id);
		order.setOrderState(orderState);
		orderService.updateOrderState(order);
		if(orderState==5){
			DeliveryMan dm=(DeliveryMan)request.getSession().getAttribute("deliveryMan");
			dm.setIncome(dm.getIncome()+disMoney);
			deliveryManService.updateDmIncome(dm);
		}
		return "1";
	}
	
	/**
	 * 加载骑行路线
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-29上午10:52:36
	 */
	@RequestMapping("/rivingRoute/{sta}/{id}")
	public String rivingRoute(@PathVariable("sta") Integer sta,@PathVariable("id") Integer id,Model model){//sta：1代表取餐路线，2代表送餐路线
		Order order = orderService.findById(id);
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(id);
		List<OrderDetail> orderDetailList = orderDetailService.findOrderDetail(orderDetail);
		model.addAttribute("order", order);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("sta", sta);
		return "dmOrderDetail";
	}
	
	
}
