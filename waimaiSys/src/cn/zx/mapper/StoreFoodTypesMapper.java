package cn.zx.mapper;

import java.util.List;

import cn.zx.entity.StoreFoodTypes;

public interface StoreFoodTypesMapper {
	public List<StoreFoodTypes> findStoreFoodTypes(Integer storeId);

}
