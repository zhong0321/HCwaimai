package cn.zx.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping("/loginByPassword")
	public String loginByPassword(DeliveryMan deliveryMan,HttpServletRequest request){
		DeliveryMan dm = deliveryManService.dmLoginByPass(deliveryMan);
		if(dm!=null){
			request.getSession().setAttribute("deliveryMan", dm);
			return "1";
		}else{
			
			return "0";
		}
		
	}
	
	/**
	 * 检查手机号是否重复
	 * @param dmPhone
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-8上午10:22:16
	 */
	@RequestMapping("/checkPhone")
	@ResponseBody
	public String checkPhone(String dmPhone,HttpServletRequest request){
		DeliveryMan dm = deliveryManService.dmFindPhone(dmPhone);
		if(dm!=null){
			request.getSession().setAttribute("deliveryMan", dm);
			return "1";
		}else{
			return "0";
		}
	}
	
	/**
	 * 注册
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-10上午10:38:01
	 */
	@RequestMapping("/dmRegist")
	@ResponseBody
	public String dmRegist(DeliveryMan dm){
		deliveryManService.dmRegist(dm);
		return "1";
	}
	
}
