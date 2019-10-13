package cn.zx.service;

import java.util.List;

import cn.zx.entity.Order;

public interface OrderService {
	/**
	 * 新增订单
	 * @param order 
	 * void  
	 * @author ZX 
	 * @date 2019-8-5下午2:46:59
	 */
	public void addOrder(Order order);
	/**
	 * 查询所有订单（或按条件查询订单）
	 * @param order
	 * @return 
	 * List<Order>  
	 * @author ZX 
	 * @date 2019-8-5下午2:47:17
	 */
	public List<Order> findOrder(Order order);
	/**
	 * 根据id查询订单
	 * @param id
	 * @return 
	 * Order  
	 * @author ZX 
	 * @date 2019-8-5下午2:47:46
	 */
	public Order findById(Integer id);
	/**
	 * 根据订单号查询唯一订单
	 * @param order
	 * @return 
	 * Order  
	 * @author ZX 
	 * @date 2019-8-5下午2:47:59
	 */
	public Order findByOrderNumber(Order order);
	/**
	 * 修改订单状态
	 * @param orderState 
	 * void  
	 * @author ZX 
	 * @date 2019-8-5下午2:48:15
	 */
	public void updateOrderState(Order order);
	/**
	 * 删除订单（取消订单时）
	 * @param orderId 
	 * void  
	 * @author ZX 
	 * @date 2019-8-5下午2:48:34
	 */
	public void deleteOrder(Integer orderId);
	/**
	 * 外卖员根据坐标查询待抢订单
	 * @param district
	 * @return 
	 * List<Order>  
	 * @author ZX 
	 * @date 2019-8-21下午5:28:17
	 */
	public List<Order> findOrderByStoreAddress(String district);
	/**
	 * 查询订单是否在配送区域内
	 * @param id
	 * @param district
	 * @return 
	 * Order  
	 * @author ZX 
	 * @date 2019-8-23上午11:32:13
	 */
	public Order findDmOrderDis(Integer id, String district);
	/**
	 * 修改订单
	 * @param order 
	 * void  
	 * @author ZX 
	 * @date 2019-8-24上午11:16:33
	 */
	public void updateOrder(Order order);
	/**
	 * 查询用户未完成订单
	 * @param userId
	 * @return 
	 * List<Order>  
	 * @author ZX 
	 * @date 2019-9-3上午9:05:51
	 */
	public List<Order> findOrderIncomplete(Integer userId);
}
