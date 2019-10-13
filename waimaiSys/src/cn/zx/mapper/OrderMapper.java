package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.Order;

public interface OrderMapper {
	public void addOrder(Order order);
	public List<Order> findOrder(Order order);
	public Order findById(Integer id);
	public Order findByOrderNumber(Order order);
	public void updateOrderState(Order order);
	public void deleteOrder(Integer orderId);
	public List<Order> findOrderByStoreAddress(String district);
	public Order findDmOrderDis(Integer id, String district);
	public void updateOrder(Order order);
	public List<Order> findOrderIncomplete(Integer userId);
}
