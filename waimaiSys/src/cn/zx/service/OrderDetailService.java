package cn.zx.service;

import java.util.List;

import cn.zx.entity.OrderDetail;

public interface OrderDetailService {
	/**
	 * 添加订单明细
	 * @param orderDetail 
	 * void  
	 * @author ZX 
	 * @date 2019-8-5下午3:26:06
	 */
	public void addOrderDetail(OrderDetail orderDetail);
	/**
	 * 查询订单明细
	 * @param orderDetail
	 * @return 
	 * List<OrderDetail>  
	 * @author ZX 
	 * @date 2019-8-5下午3:26:27
	 */
	public List<OrderDetail> findOrderDetail(OrderDetail orderDetail);
}
