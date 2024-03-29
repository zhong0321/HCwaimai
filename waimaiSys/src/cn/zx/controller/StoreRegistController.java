package cn.zx.controller;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.zx.entity.Audit;
import cn.zx.entity.IndexParameter;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreStoreTypes;
import cn.zx.entity.Store_Comment;
import cn.zx.service.AuditService;
import cn.zx.service.StoreAptitudeService;
import cn.zx.service.StoreService;
import cn.zx.service.StoreStoreTypesService;

import cn.zx.service.UserInfoService;


@Controller
@RequestMapping("storeRegist")
public class StoreRegistController {
	@Resource
	private StoreService storeService;
	@Resource
	private StoreStoreTypesService storeStoreTypesService;
	@Resource
	private StoreAptitudeService storeAptitudeService;
	@Resource
	private AuditService auditService;
	@Resource
	private UserInfoService infoService;
	
	
	@RequestMapping("/addStore")
	public String addStore(Store store,@RequestParam("storeType") String storeType,@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String uuid = UUID.randomUUID().toString().trim();
        String fileN=file.getOriginalFilename();
        int index=fileN.indexOf(".");
        String fileName=uuid+fileN.substring(index);//文件名
        String opath = request.getServletContext().getRealPath("static"+File.separator+"images");
        String path=opath+File.separator+fileName;
        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        
        //截取出行政区
      	String district=store.getStoreAddress().substring(store.getStoreAddress().indexOf("市")+1, store.getStoreAddress().indexOf("区")+1);
      	store.setArea(district);
        store.setStoreImg(fileName);
        store.setOrdrenum(0);
        storeService.updateStore(store);//添加商家
        //添加商家分类
        StoreStoreTypes storeStoreTypes=new StoreStoreTypes();
        storeStoreTypes.setStoreId(store.getId());
        storeStoreTypes.setStoreTypeId(Integer.parseInt(storeType));
        storeStoreTypesService.addStoreStoreTypes(storeStoreTypes);
		return "storeRegist02";
	}
	
	@RequestMapping("/addStoreAptitude")
	public String addStoreAptitude(@RequestParam("file") MultipartFile file[],StoreAptitude storeAptitude,HttpServletRequest request) throws IllegalStateException, IOException{
		String fileName[] = new String [3];
		for (int i = 0; i < file.length; i++) {
			String uuid = UUID.randomUUID().toString().trim();
	        String fileN=file[i].getOriginalFilename();
	        int index=fileN.indexOf(".");
	        fileName[i]=uuid+fileN.substring(index);
	        String opath = request.getServletContext().getRealPath("static"+File.separator+"images");
	        String path=opath+File.separator+fileName[i];
	        File newFile=new File(path);
	        file[i].transferTo(newFile);
		}
		storeAptitude.setIDCardImg(fileName[0]);
		storeAptitude.setShopCardImg(fileName[1]);
		storeAptitude.setFoodLicenceImg(fileName[2]);
		storeAptitudeService.addStoreAptitude(storeAptitude);//添加资质信息
		//添加审核记录 
		Audit audit =new Audit();
		audit.setStoreId(storeAptitude.getStoreId());
		audit.setAuditState(1);
		auditService.updateAudit(audit);
		return "redirect:/storeRegist/auditResult";
	}
	
	/**
	 * 查询审核结果
	 * @return 
	 * String  
	 * @author ZX 
	 * @date 2019-9-17上午11:08:07
	 */
	@RequestMapping("/auditResult")
	public String auditResult(HttpServletRequest request,Model model){
		Store store = (Store)request.getSession().getAttribute("store");
		Store sto = infoService.findStorePhone(store.getStorePhone());
		
		model.addAttribute("sto", sto);
		return "storeRegist3";
	}
	
	
	@RequestMapping("/gao")
	public void test(){
		List<Store_Comment> list=storeService.findStoreInfo(0, 1, 2, "116.346711,39.732871");
		for (Store_Comment store_Comment : list) {
			System.out.println(store_Comment.getStoreName()+store_Comment.getJuli());
		}
	}
	
	@RequestMapping(value="/findStoreComment",method=RequestMethod.POST)
	@ResponseBody
	public  List<Store_Comment> findStoreComment(@RequestBody IndexParameter indexParameter,HttpServletRequest request){
		List<Store_Comment> list=storeService.findStoreInfo(indexParameter.getStoreTypeId(), indexParameter.getSorttype(), indexParameter.getSortorder(),indexParameter.getAdd());
/*		int page=(pageNo-1)*20;   //每页的起始索引
		int pageSize=20; // 每页记录数
		List<Store_Comment> list2=new ArrayList<Store_Comment>();
		Integer sum = list.size(); //记录总数
		if (page+pageSize > sum) {
		       list2 = list.subList(page,sum );
		       request.getSession().setAttribute("max", sum/20);
		 }else {
		       list2 = list.subList(page,page+pageSize);
		}*/
		return list;
	}
}
