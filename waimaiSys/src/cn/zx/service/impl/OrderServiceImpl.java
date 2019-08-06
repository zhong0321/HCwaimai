package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.Order;
import cn.zx.mapper.OrderMapper;
import cn.zx.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderMapper orderMapper;

	@Override
	public void addOrder(Order order) {
		orderMapper.addOrder(order);
	}

	@Override
	public List<Order> findOrder(Order order) {
		List<Order> list = orderMapper.findOrder(order);
		return list;
	}

	@Override
	public Order findById(Integer id) {
		Order order = orderMapper.findById(id);
		return order;
	}

	@Override
	public Order findByOrderNumber(Order order) {
		Order order2 = orderMapper.findByOrderNumber(order);
		return order2;
	}

	@Override
	public void deleteOrder(Order order) {
		orderMapper.deleteOrder(order);
	}

	@Override
	public void updateOrderState(Order order) {
		orderMapper.updateOrderState(order);
	}

}
