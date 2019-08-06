package cn.zx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.OrderDetail;
import cn.zx.mapper.OrderDetailMapper;
import cn.zx.service.OrderDetailService;
@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {
	@Resource
	private OrderDetailMapper orderDetailMapper;

	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
		orderDetailMapper.addOrderDetail(orderDetail);
	}

	@Override
	public List<OrderDetail> findOrderDetail(OrderDetail orderDetail) {
		List<OrderDetail> list = orderDetailMapper.findOrderDetail(orderDetail);
		return list;
	}

}

