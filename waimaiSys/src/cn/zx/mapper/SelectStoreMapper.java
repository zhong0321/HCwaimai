package cn.zx.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.zx.entity.CommentLv;
import cn.zx.entity.Comment_User;
import cn.zx.entity.Food;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.Store_Comment;

public interface SelectStoreMapper {
	/**
	 * 查询商家信息
	 * @param vl 不为空商家名称 模糊搜索 为空搜索全部商家
	 * @return	list集合商家信息(商家id,商家名称,平均配送费,商家坐标,起送费,评分)
	 */
	public List<Store_Comment> selectstore (@Param(value = "vl")String vl);
	
	/**
	 * 查询菜品
	 * @param vl 菜品名称 模糊搜索
	 * @return list集合菜品信息
	 */
	public List<Food> selectMs(@Param(value = "vl")String vl);
	
	/**
	 * 查询菜品里包含vl的商家信息
	 * @param vl
	 * @return
	 */
	public List<Store_Comment> selectstoreByMs(@Param(value = "ll")String vl);
	
	/**
	 * 商家信息
	 * @param id
	 * @return
	 */
	public Store_Comment selectstores(@Param("id")int id);
	
	/**
	 * 所有评价
	 * @param id
	 * @return
	 */
	public List<Comment_User> selectComment(@Param("id")int id,@Param("nulls")int nulls);
	
	/**
	 * 差评
	 * @param id
	 * @return
	 */
	public List<Comment_User> selectBadComment(@Param("id")int id,@Param("nulls")int nulls);
	
	/**
	 * 差评个数
	 * @param id
	 * @return
	 */
	public int findBadComment(@Param("id")int id);
	
	/**
	 * 好评
	 * @param id
	 * @return
	 */
	public List<Comment_User> selectFineComment(@Param("id")int id,@Param("nulls")int nulls);
	
	/**
	 * 好评个数
	 * @param id
	 * @return
	 */
	public int findFineComment(@Param("id")int id);
	
	/**
	 * 查询店铺安全信息
	 * @param id
	 * @return
	 */
	public StoreAptitude findStoreAptitude(@Param("id")int id);
	
	/**
	 * 查询分数
	 * @param id
	 * @return
	 */
	public List<CommentLv> findComment(@Param("id")int id);
}
