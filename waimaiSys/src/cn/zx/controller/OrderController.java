package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zx.entity.Order;
import cn.zx.entity.OrderDetail;
import cn.zx.entity.Store;
import cn.zx.service.OrderDetailService;
import cn.zx.service.OrderService;
import cn.zx.service.StoreService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetailService orderDetailService;
	@Resource
	private StoreService storeService;
	
	@RequestMapping("/showOrder")
	public String showOrder(Model model,HttpServletRequest request){
		Integer orderID = (Integer)request.getSession().getAttribute("orderID");
		Order order = orderService.findById(orderID);
		model.addAttribute("order", order);
		Store store = storeService.findStoreById(orderID);
		model.addAttribute("store", store);
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(orderID);
		List<OrderDetail> orderDetail2 = orderDetailService.findOrderDetail(orderDetail);//根据订单号查询订单明细
		model.addAttribute("orderDetail", orderDetail2);
		return "order";
	}

}
