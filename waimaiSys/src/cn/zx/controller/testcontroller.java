package cn.zx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zx.entity.Store;

@Controller
public class testcontroller {

@RequestMapping("/json")
@ResponseBody
	public Store Json(){
	Store store = new Store();
	store.setId(1);
	store.setStoreName("发生发生");
	store.setStoreImg("gasfs");
	store.setArea("gao");
	store.setFoundtime("2012-18-12");
		return store;
		
	}
}
