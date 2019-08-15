package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Order;
import cn.zx.entity.OrderDetail;
import cn.zx.entity.Store;
import cn.zx.service.OrderDetailService;
import cn.zx.service.OrderService;

@Controller
@RequestMapping("/storeOrder")
public class StoreOrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetailService orderDetailService;
	
	@RequestMapping("/showStoreOrder/{orderState}")
	public String showStoreOrder(HttpServletRequest request,@PathVariable("orderState") Integer orderState,Model model){
		if(orderState==99){//如果为99，查询全部
			orderState=null;
		}
		Store store = (Store)request.getSession().getAttribute("store");
		Order order =new Order();
		order.setOrderState(orderState);
		order.setStoreId(store.getId());
		List<Order> order2 = orderService.findOrder(order);
		model.addAttribute("order", order2);
		return "storeOrder";
	}
	
	@ResponseBody
	@RequestMapping("/showOrderDetails")
	public List<OrderDetail> showOrderDetails(Integer orderId){
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(orderId);
		List<OrderDetail> list = orderDetailService.findOrderDetail(orderDetail);
		return list;
	}
	
	@RequestMapping("/sureOrder/{id}")
	public String sureOrder(@PathVariable("id") Integer id){
		Order order =new Order();
		order.setOrderState(4);
		order.setId(id);
		orderService.updateOrderState(order);
		return "redirect:../../storeOrder/showStoreOrder/99";
	}
}
