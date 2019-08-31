package cn.zx.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.zx.entity.Audit;
import cn.zx.entity.Store;
import cn.zx.entity.StoreAptitude;
import cn.zx.entity.StoreStoreTypes;
import cn.zx.service.AuditService;
import cn.zx.service.StoreAptitudeService;
import cn.zx.service.StoreService;
import cn.zx.service.StoreStoreTypesService;

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
        store.setRegistState(0);
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
		System.out.println(fileName.length);				
		for (int i = 0; i < file.length; i++) {
			String uuid = UUID.randomUUID().toString().trim();
	        String fileN=file[i].getOriginalFilename();
	        int index=fileN.indexOf(".");
	        System.out.println(fileN.substring(index));
	        System.out.println(uuid+fileN.substring(index));
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
		auditService.addAudit(audit);
		return "storeRegist3";
	}
}
