package cn.zx.mapper;

import cn.zx.entity.DeliveryMan;

public interface DeliveryManMapper {
	public DeliveryMan dmLoginByPass(DeliveryMan deliveryMan);
	public void updateDmIncome(DeliveryMan deliveryMan);
	public DeliveryMan dmFindPhone(String dmPhone);
	public void dmRegist(DeliveryMan dm);
}
