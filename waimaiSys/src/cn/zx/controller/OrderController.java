package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Comment;
import cn.zx.entity.Order;
import cn.zx.entity.OrderDetail;
import cn.zx.entity.Store;
import cn.zx.entity.User;
import cn.zx.service.CommentService;
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
	@Resource
	private CommentService commentService;
	
	/**
	 * 用户查询当前订单详情
	 * @param model
	 * @param request
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-28下午2:49:35
	 */
	@RequestMapping("/showOrder")
	public String showOrder(Model model,HttpServletRequest request){
		Integer orderID = (Integer)request.getSession().getAttribute("orderID");
		Order order = orderService.findById(orderID);
		model.addAttribute("order", order);
		Store store = storeService.findStoreById(order.getStoreId());
		model.addAttribute("store", store);
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(orderID);
		List<OrderDetail> orderDetail2 = orderDetailService.findOrderDetail(orderDetail);//根据订单号查询订单明细
		model.addAttribute("orderDetail", orderDetail2);
		model.addAttribute("now", 0);
		
		return "order";
	}
	
	/**
	 * 根据订单id查询历史订单详情
	 * @param id
	 * @param model
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-2下午3:33:01
	 */
	@RequestMapping("/showOrderDetails/{id}")
	public String showOrderDetails(@PathVariable("id") Integer id,Model model){
		Order order = orderService.findById(id);
		model.addAttribute("order", order);
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setOrderId(id);
		List<OrderDetail> orderDetail2 = orderDetailService.findOrderDetail(orderDetail);//根据订单号查询订单明细
		model.addAttribute("orderDetail", orderDetail2);
		model.addAttribute("now", 1);
		return "order";
	}
	
	/**
	 * 查询用户的历史订单
	 * @param model
	 * @param request
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-2下午4:19:25
	 */
	@RequestMapping("/historyOrders")
	public String historyOrders(Model model,HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		Order order=new Order();
		order.setUserId(user.getId());
		List<Order> orderList = orderService.findOrder(order);
		model.addAttribute("orderList", orderList);
		model.addAttribute("now", 2);
		return "order";
	}
	
	/**
	 * 查询我的订单，如果有未完成订单则显示，没有就显示历史订单
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-3上午8:53:46
	 */
	@RequestMapping("/myOrders")
	public String myOrders(Model model,HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		List<Order> list = orderService.findOrderIncomplete(user.getId());
		if(list.size()!=0){//未完成订单
			Order order = list.get(0);
			model.addAttribute("order", order);
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setOrderId(order.getId());
			List<OrderDetail> orderDetail2 = orderDetailService.findOrderDetail(orderDetail);//根据订单号查询订单明细
			model.addAttribute("orderDetail", orderDetail2);
			model.addAttribute("now", 1);
		}else{
			Order order=new Order();
			order.setUserId(user.getId());
			List<Order> orderList = orderService.findOrder(order);
			model.addAttribute("orderList", orderList);
			model.addAttribute("now", 2);
		}
		return "order";
	}
	
	@ResponseBody
	@RequestMapping("/addComment")
	public String addComment(Integer id,Integer commentlv,String description){
		//查询订单状态，如果订单未评价，则评价
        Order order = orderService.findById(id);
        if(order.getOrderState()==5){
        	Comment comment=new Comment();
        	comment.setOrderId(order.getId());
        	comment.setStoreId(order.getStoreId());
        	comment.setUserId(order.getUserId());
        	comment.setCommentlv(commentlv);
        	comment.setDescription(description);
        	commentService.addComment(comment);//添加评价
        	order.setOrderState(6);
        	orderService.updateOrderState(order);//修改订单状态为已手动评价
        	return "1";
        }else{
        	return "0";
        }
		
		
	}
	
}
