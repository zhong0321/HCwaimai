package cn.zx.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zx.entity.DeliveryMan;
import cn.zx.service.DeliveryManService;

@Controller
@RequestMapping("dmLogin")
public class DmLoginController {
	@Resource
	private DeliveryManService deliveryManService;
	
	/**
	 * 账号密码登录
	 * @param deliveryMan
	 * @param request
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-8-21下午4:24:02
	 */
	@RequestMapping("/loginByPassword")
	public String loginByPassword(DeliveryMan deliveryMan,HttpServletRequest request){
		DeliveryMan dm = deliveryManService.dmLoginByPass(deliveryMan);
		if(dm!=null){
			request.getSession().setAttribute("deliveryMan", dm);
			return "redirect:/dmOrder/qiangDan/2";
		}else{
			
			return "";
		}
		
	}
	
}
