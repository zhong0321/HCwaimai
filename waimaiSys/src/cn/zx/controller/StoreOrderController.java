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
import cn.zx.websocket.MyWebSocket;

@Controller
@RequestMapping("/storeOrder")
public class StoreOrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetailService orderDetailService;
	private MyWebSocket socket=new MyWebSocket();
	
	/**
	 * 根据订单状态查询订单
	 * @param request
	 * @param orderState
	 * @param model
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-21下午4:23:38
	 */
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
		model.addAttribute("now", orderState);
		return "storeOrder";
	}
	
	/**
	 * 查询订单明细
	 * @param orderId
	 * @return 
	 * List<OrderDetail>  
	 * @author ZX 
	 * @date 2019-8-21下午4:23:18
	 */
	@ResponseBody
	@RequestMapping("/showOrderDetails")
	public List<OrderDetail> showOrderDetails(Integer orderId){
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(orderId);
		List<OrderDetail> list = orderDetailService.findOrderDetail(orderDetail);
		return list;
	}
	
	/**
	 * 商家确认订单
	 * @param id
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-21下午4:22:48
	 */
	@RequestMapping("/sureOrder/{id}")
	public String sureOrder(@PathVariable("id") Integer id){
		Order order =new Order();
		order.setOrderState(2);
		order.setId(id);
		orderService.updateOrderState(order);
		socket.onMessage(""+id, null);
		return "redirect:../../storeOrder/showStoreOrder/99";
	}
	
	/**
	 * 商家拒单
	 * @param id
	 * @param storeId
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-30下午3:22:23
	 */
	@ResponseBody
	@RequestMapping("/findRefuseOrderNum")
	public Order findRefuseOrderNum(Integer id,Integer storeId){
		Order order=new Order();
		order.setStoreId(storeId);
		order.setOrderState(12);
		List<Order> list1 = orderService.findOrder(order);
		order.setOrderState(13);
		List<Order> list2 = orderService.findOrder(order);
		int number=list1.size()+list2.size();
		Order o = null;
		if(number<5){//一天拒单次数不能超过5次
			order.setOrderState(12);
			order.setId(id);
			orderService.updateOrderState(order);
			o = orderService.findById(id);
			return o;
		}else{
			return o;
		}
	}
}
