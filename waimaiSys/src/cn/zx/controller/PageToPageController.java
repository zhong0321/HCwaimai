package cn.zx.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PageToPageController {
    @RequestMapping("/gologin/{id}")
    public String userLogin(@PathVariable("id") Integer loginType, Model model){
        if(loginType==1){
            //客户登录
            model.addAttribute("title","客户登录");
            model.addAttribute("code",1);
        }else if(loginType==2){
            //商家登录
            model.addAttribute("title","商家登录");
            model.addAttribute("code",2);
        }else if(loginType==3){
            //后台登录
            model.addAttribute("title","平台管理员登录");
            model.addAttribute("code",3);
        }else{
            return "error";
        }
        return "login";
    }


    @RequestMapping(value = "/gogetpass/{type}")
    public String toGetPass(@PathVariable(value = "type") Integer type, Model model){
        if(type==1){
            model.addAttribute("code","1");
        }else if(type==2){
            model.addAttribute("code","2");
        }else{
            return "error";
        }
        return "getpass";
    }

    @RequestMapping(value = "/goreg/{type}")
    public String toReg(@PathVariable(value = "type") Integer type, Model model){
        if(type==1){
            //客户登录
            model.addAttribute("title","客户注册");
            model.addAttribute("code","1");
        }else if(type==2){
            //商家登录
            model.addAttribute("title","商家入驻");
            model.addAttribute("code","2");
        }else{
            return "error";
        }
        return "reg";
    }

}
