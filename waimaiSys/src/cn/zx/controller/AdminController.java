package cn.zx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreTypes;
import cn.zx.service.AdminService;

@Controller
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/admins")
	public String FindStoreExamine(Model model){
		List<Store> findExamine = adminService.findExamine(0);
		model.addAttribute("list", findExamine);
		return "admin";
	}
	
	@RequestMapping("/findStoreExamine")
	public String findStoreExamine(Model model,HttpServletRequest request){
		int parameter =Integer.parseInt(request.getParameter("storeId"));
		StoreAptitude findExamine = adminService.findStoreAptitude(parameter);
		List<StoreTypes> storeTypes = adminService.findStoreType(parameter);
		model.addAttribute("storeAptitude",findExamine);
		model.addAttribute("storeTypes",storeTypes);
		return "adminInfo";
	}
	
	@RequestMapping("/updateStoreRegistState")
	@ResponseBody
	public int updateStoreRegistState(int id,int registState,String text,HttpServletRequest request){
		/*int id=Integer.parseInt(request.getParameter("id"));
		int registState=Integer.parseInt(request.getParameter("registState"));*/
		return adminService.updateStoreRegistState(id, registState,text);
	}
}
