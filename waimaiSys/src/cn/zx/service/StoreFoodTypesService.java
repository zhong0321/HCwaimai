package cn.zx.service;

import java.util.List;

import cn.zx.entity.StoreFoodTypes;

public interface StoreFoodTypesService {
	/**
	 * 根据商家id查询菜品类型
	 * @param storeId
	 * @return List<StoreFoodTypes>  
	 * @author ZX 
	 * @date 2019-6-30下午1:53:11
	 */
	public List<StoreFoodTypes> findStoreFoodTypes(Integer storeId);

}
