package cn.zx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zx.entity.DeliveryMan;
import cn.zx.mapper.DeliveryManMapper;
import cn.zx.service.DeliveryManService;
@Service("deliveryManService")
public class DeliveryManServiceImpl implements DeliveryManService {
	@Resource
	private DeliveryManMapper deliveryManMapper;

	@Override
	public DeliveryMan dmLoginByPass(DeliveryMan deliveryMan) {
		DeliveryMan deliveryMan2 = deliveryManMapper.dmLoginByPass(deliveryMan);
		return deliveryMan2;
	}

	@Override
	public void updateDmIncome(DeliveryMan deliveryMan) {
		deliveryManMapper.updateDmIncome(deliveryMan);		
	}

	@Override
	public DeliveryMan dmFindPhone(String dmPhone) {
		DeliveryMan dm = deliveryManMapper.dmFindPhone(dmPhone);
		return dm;
	}

	@Override
	public void dmRegist(DeliveryMan dm) {
		deliveryManMapper.dmRegist(dm);
	}

}
