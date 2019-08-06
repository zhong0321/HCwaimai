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
	 * @param order 
	 * void  
	 * @author ZX 
	 * @date 2019-8-5下午2:48:34
	 */
	public void deleteOrder(Order order);
}
