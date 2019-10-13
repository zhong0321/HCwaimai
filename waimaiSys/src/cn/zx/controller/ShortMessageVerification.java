package cn.zx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sun.org.apache.bcel.internal.classfile.PMGClass;

import cn.glh.rest.client.AbsRestClient;
import cn.glh.rest.client.JsonReqClient;


/**
 * 短信验证码获取
 * @author 20283
 *
 */
@Controller
public class ShortMessageVerification {

	static AbsRestClient InstantiationRestAPI() {
		return new JsonReqClient();
	}
	
	public static String testSendSms(String sid, String token, String appid, String templateid, String param, String mobile, String uid){
		try {
			String result=InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping("/Obtain")
	@ResponseBody
	public String getOk(String phoneNumber){
		String random = Integer.toString((int) ((Math.random()*9+1)*100000));
		if(phoneNumber!=null&& phoneNumber!=""){
			String sid = "eec6cf06def8cf261e06f4544d1422a5";
			String token = "660744f5b331d00e61b24ff493aa8aac";
			String appid = "fba8417543f54d058fb802f1ce3b2b89";
			String templateid = "477404";
			String mobile = phoneNumber;
			String uid = "";
			testSendSms(sid, token, appid, templateid, random, mobile, uid);
			return random;
		}else{
			return "000000";
		}
	}
}
