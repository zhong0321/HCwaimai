package cn.zx.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.zx.entity.CommentLv;
import cn.zx.entity.Comment_User;
import cn.zx.entity.Food;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.Store_Comment;
import cn.zx.service.SelectStoreService;

@Controller
public class SelectStoreController {
	@Resource
	public SelectStoreService selectStoreService;
	@RequestMapping("/selects")
	public String selectStore(HttpServletRequest request,Model model){
		String add=null;
		String vl=null;
		add = request.getParameter("add");
		vl = request.getParameter("vl");
		if(add!=null&&vl!=null&&add!=""&&vl!=""){
			List<Store_Comment> list=selectStoreService.selectstore(add, vl);
			model.addAttribute("list", list);
			model.addAttribute("vl", vl);
		}
		return "select";
	}
	
	@RequestMapping(value="selectMs")
	public String selectMs( Model model,HttpServletRequest request){
		String add=null;
		String vl=null;
		add = request.getParameter("add");
		vl = request.getParameter("vl");
		if(add!=null&&vl!=null&&add!=""&&vl!=""){
			List<Store_Comment> list2=selectStoreService.selectstoreByMs(vl, add);
			List<Food> list1=selectStoreService.selectMs(vl);
			if(list1.size()>0){
				model.addAttribute("list", list2);
				model.addAttribute("list1", list1);
			}
			model.addAttribute("vl", vl);
		}
		return "selects";
	}
	
	/**
	 * 店铺评论
	 * @param id 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/findStor/{id}")
	public String findStor(@PathVariable("id")int id,Model model,HttpServletRequest request){
		Store_Comment store_Comment=selectStoreService.selectstores(id);
		int bad=selectStoreService.findBadComment(id);
		int fine=selectStoreService.findFineComment(id);
		List<CommentLv> list=selectStoreService.findComment(id);
		model.addAttribute("store_comment", store_Comment);
		model.addAttribute("bad", bad);
		model.addAttribute("fine", fine);
		model.addAttribute("all", bad+fine);
		List<CommentLv> list2 = new ArrayList<CommentLv>();
		CommentLv commentLv = null;
		int allnum =0;
		int allnum2 =0;
		int alllv=0;
		for (int i = 0; i < list.size(); i++) {
			int num3= list.get(i).getCommentnum();
			allnum2 += num3;
		}
		for (int i = 0; i < list.size(); i++) {
			commentLv = new CommentLv();
			int num2 = list.get(i).getCommentlv();
			int num3= list.get(i).getCommentnum();
			alllv +=num2*num3;
			allnum += num3;
			
			int num=list.get(i).getCommentnum();

			double avg2 = 0;
			if(num!=0){
				avg2 = Double.parseDouble(String.format("%.1f", (double)num/allnum2));
			}
			commentLv.setCommentlv(list.get(i).getCommentlv());
			commentLv.setAvg(avg2);
			list2.add(commentLv);
		}
		double avg=0;
		if(alllv!=0){
		avg=alllv/allnum;
		}
		model.addAttribute("list2", list2);
		model.addAttribute("avg", avg);
		return "pinglun";
	}
	
	/**
	 * 店铺安全信息
	 * @param id 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/findanqian/{id}")
	public String findanqian(@PathVariable("id")int id,Model model){
		Store_Comment store_Comment=selectStoreService.selectstores(id);
		model.addAttribute("store_comment", store_Comment);
		StoreAptitude findStoreAptitude = selectStoreService.findStoreAptitude(id);
		model.addAttribute("findStoreAptitude", findStoreAptitude);
		return "anquan";
	}
	/**
	 * 
	 * @param id 店铺id
	 * @param num 当前页数
	 * @param request
	 * @return 全部评论信息
	 */
	@RequestMapping("/select/{id}/{num}/{nulls}")
	@ResponseBody
	public List<Comment_User> selectComment_User(@PathVariable("id")int id,@PathVariable("num")int num,@PathVariable("nulls")int nulls,HttpServletRequest request){
		PageInfo<Comment_User> pageInfo=selectStoreService.selectComment(id,nulls, num, 10);
		List<Comment_User> list=pageInfo.getList();
		request.getSession().setAttribute("pageinfo", pageInfo);
		return list;
	}
	
	
	/**
	 * 
	 * @param id 
	 * @param num
	 * @param request
	 * @return 差评
	 */
	@ResponseBody
	@RequestMapping("/selectBad/{id}/{num}/{nulls}")
	public List<Comment_User> selectBadComment(@PathVariable("id")int id,@PathVariable("num")int num,@PathVariable("nulls")int nulls,HttpServletRequest request){
		PageInfo<Comment_User> pageInfo=selectStoreService.selectBadComment(id,nulls, num, 10);
		List<Comment_User> list=pageInfo.getList();
		request.getSession().setAttribute("bad", pageInfo.getPages());
		return list;
	}
	
	/**
	 * @param id 
	 * @param num
	 * @param request
	 * @return 好评
	 */
	@ResponseBody
	@RequestMapping("/selectFine/{id}/{num}/{nulls}")
	public List<Comment_User> selectFineComment(@PathVariable("id")int id,@PathVariable("num")int num,@PathVariable("nulls")int nulls,HttpServletRequest request){
		PageInfo<Comment_User> pageInfo=selectStoreService.selectFineComment(id,nulls, num, 10);
		List<Comment_User> list=pageInfo.getList();
		request.getSession().setAttribute("fine", pageInfo.getPages());
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping("/findStoreName")
	public int findStoreName(HttpServletRequest request){
		String StoreName=request.getParameter("StoreName");
		String storePhone=request.getParameter("storePhone");
		return selectStoreService.findStoreName(StoreName,storePhone);
	}
	
	
}
