package cn.zx.controller;

import cn.zx.entity.Admin;
import cn.zx.entity.Audit;
import cn.zx.entity.Store;
import cn.zx.entity.StoreTypes;
import cn.zx.entity.User;
import cn.zx.service.AdminService;
import cn.zx.service.StoreService;
import cn.zx.service.StoreTypesService;
import cn.zx.service.UserInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private StoreTypesService storeTypesService;
    @Resource
    private StoreService storeService;
    @Resource
    private AdminService adminService;

    /**
     * 账号密码登陆
     *2019-6-30下午12:08:30
     *@param loginType
     *@param user
     *@return 1登陆成功，2登陆失败
     */
    @RequestMapping(value="/login")
    public  @ResponseBody String accountPasswordLogin(String userPhone,String userPassword,Integer loginType ,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	if(null!=userPhone && null!=userPassword){
            if(loginType==1){
            	User user=userInfoService.findUserpwLogin(userPhone,userPassword);
            	if(null!=user){
                    request.getSession().setAttribute("user", user);
                    String address=(String)request.getSession().getAttribute("address");
                    if(address!=null){
                    	return "9";//订餐地址已存入session，直接进入点餐页面
                    }else{
                    	return "1";//订餐地址未存入session，进入订餐地址界面
                    }
                }else{
                    return "0";
                }
            }else if(loginType==2){
            	Store stores=new Store();
            	stores.setStorePhone(userPhone);
            	stores.setStorePassword(userPassword);
            	Store store = storeService.phonePwdLogin(stores);
            	if(null!=store){
                    request.getSession().setAttribute("store", store);
                    return "1";
                }else{
                    return "0";
                }
            }else{
            	Admin admin = adminService.phonePwdLogin(userPhone, userPassword);
            	if(null!=admin){
                    request.getSession().setAttribute("admin", admin);
                    return "1";
                }else{
                    return "0";
                }
            }
        }else {
            return "2";
        }
    }

    @RequestMapping(value="/checkPhone/{logintype}")
    @ResponseBody
    public String checkPhone(HttpServletRequest request,String phone,@PathVariable("logintype") Integer logintype){
    	if(logintype==1){
    		User user = userInfoService.findUserPhoneLogin(phone,logintype);
            if(user==null){
                return "0";
            }else{
            	request.getSession().setAttribute("user", user);
            	String address=(String)request.getSession().getAttribute("address");
                if(address!=null){
                	return "9";//订餐地址已存入session，直接进入页面
                }else{
                	return "1";//订餐地址未存入session，进入订餐地址界面
                }
            }
    	}else{
    		Store store=storeService.storePhoneLogin(phone);
    		if(store==null){
                return "0";
            }
    		request.getSession().setAttribute("store", store);
            return "1";
    	}
    }

    @RequestMapping(value="/register/{type}")
    @ResponseBody
    public String addUserInfo(String userPhone,String userPassWord ,@PathVariable(value = "type") Integer type,HttpServletRequest request){
        try{
            if(type==1){
            	userInfoService.addUser(userPhone, userPassWord,type);
            }
            if(type==2){
            	Store store =new Store();
            	store.setStorePhone(userPhone);
            	store.setStorePassword(userPassWord);
            	storeService.addStore(store);
            	Store store2 = storeService.phonePwdLogin(store);
            	request.getSession().setAttribute("store", store2);
            	List<StoreTypes> storeTypes = storeTypesService.findStoreTypes();
            	request.getSession().setAttribute("storeTypes", storeTypes);
            }
            return "1";
        }catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value="/updatapw")
    @ResponseBody
    public String updatapw(String phone ,String password,String type){
        try {
            userInfoService.updatapw(phone, password,type);
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
        return "1";
    }
    
    
	@RequestMapping("/findstorePhone")
	public String findstorePhone(String phone,HttpServletRequest request,Model model){
		Store findStorePhone = userInfoService.findStorePhone(phone);
		List<StoreTypes> storeTypes = storeTypesService.findStoreTypes();
    	request.getSession().setAttribute("storeTypes", storeTypes);
    	model.addAttribute("store", findStorePhone);
    	switch (findStorePhone.getAudit().getAuditState()) {
		case 0:
			return "storeRegist1";
		case 1:
			return "storeRegist3";
		case 2:
			return "storeRegist3";
		case 3:
			return "redirect:storeOrder/showStoreOrder/99";
		}
		return "";
	}
    
	@RequestMapping("/findstorebyPhone")
	@ResponseBody
	public int findstoreByPhone(String phone,HttpServletRequest request,Model model){
		Store findStorePhone = userInfoService.findStorePhone(phone);
		List<StoreTypes> storeTypes = storeTypesService.findStoreTypes();
    	request.getSession().setAttribute("storeTypes", storeTypes);
    	model.addAttribute("store", findStorePhone);
		return findStorePhone.getAudit().getAuditState();
	}
	@RequestMapping("/deleteStoreinfo")
	public String deleteStoreinfo(@RequestParam("storeId")Integer storeId,@RequestParam("registState")Integer registState){
		if(registState!=null){
			userInfoService.updateInfo(storeId, registState);
		}
		if(storeId!=null){
			userInfoService.deleteInfo(storeId);
		}
		return "storeRegist1";
	}
}
