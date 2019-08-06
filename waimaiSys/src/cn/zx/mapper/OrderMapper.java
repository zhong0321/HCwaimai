package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.Order;

public interface OrderMapper {
	public void addOrder(Order order);
	public List<Order> findOrder(Order order);
	public Order findById(Integer id);
	public Order findByOrderNumber(Order order);
	public void updateOrderState(Order order);
	public void deleteOrder(Order order);
}
