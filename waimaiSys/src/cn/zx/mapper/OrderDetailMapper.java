package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.OrderDetail;

public interface OrderDetailMapper {
	public void addOrderDetail(OrderDetail orderDetail);
	public List<OrderDetail> findOrderDetail(OrderDetail orderDetail);
}
