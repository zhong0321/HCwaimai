package cn.zx.service;

import cn.zx.entity.DeliveryMan;

public interface DeliveryManService {
	/**
	 * 账号密码登录
	 * @param deliveryMan
	 * @return 
	 * DeliveryMan  
	 * @author ZX 
	 * @date 2019-8-26下午2:36:34
	 */
	public DeliveryMan dmLoginByPass(DeliveryMan deliveryMan);
	/**
	 * 修改外卖员账户收益
	 * @param deliveryMan 
	 * void  
	 * @author ZX 
	 * @date 2019-8-26下午2:35:54
	 */
	public void updateDmIncome(DeliveryMan deliveryMan);
}
