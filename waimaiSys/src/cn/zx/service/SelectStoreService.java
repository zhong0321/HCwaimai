package cn.zx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

import cn.zx.entity.CommentLv;
import cn.zx.entity.Comment_User;
import cn.zx.entity.Food;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.Store_Comment;

public interface SelectStoreService {
	/**
	 * 查询商家信息
	 * @param vl 不为空商家名称 模糊搜索 为空搜索全部商家
	 * @return	list集合商家信息(商家id,商家名称,平均配送费,商家坐标,起送费,评分)
	 */
	public List<Store_Comment> selectstore (String add,String vl);
	/**
	 * 查询菜品
	 * @param vl 菜品名称 模糊搜索
	 * @return list集合菜品信息
	 */
	public List<Food> selectMs(String vl);
	
	/**
	 * 查询菜品里包含vl的商家信息
	 * @param vl
	 * @return
	 */
	public List<Store_Comment> selectstoreByMs(String vl,String add);
	
	/**
	 * 商家信息
	 * @param id
	 * @return
	 */
	public Store_Comment selectstores(int id);
	
	/**
	 * 所有评价
	 * @param id
	 * @param number
	 * @param size
	 * @return
	 */
	public PageInfo<Comment_User> selectComment(int id,int nulls,int number,int size);
	
	/**
	 * 差评
	 * @param id
	 * @param num
	 * @param size
	 * @return
	 */
	public PageInfo<Comment_User> selectBadComment(int id,int nulls, int num, int size);
	
	/**
	 * 差评个数
	 * @param id
	 * @return
	 */
	public int findBadComment(int id);
	
	/**
	 * 好评
	 * @param id
	 * @param num
	 * @param size
	 * @return
	 */
	public PageInfo<Comment_User> selectFineComment(int id,int nulls, int num, int size);
	
	/**
	 * 好评个数
	 * @param id
	 * @return
	 */
	public int findFineComment(int id);
	
	public StoreAptitude findStoreAptitude(int id);
	
	
	/**
	 * 查询分数
	 * @param id
	 * @return
	 */
	public List<CommentLv> findComment(int id);
	
	
	/**
	 * 根据商店名称查询商店是否存在
	 * @param StoreName
	 * @return
	 */
	public int findStoreName(String StoreName,String storePhone);
}
