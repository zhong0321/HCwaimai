//页面加载
$(function(){
	//计算总价
	var totalPrice=0;
	var totalCount=0;
	$(".checkoutcart-group dd .checkoutcart-tablerow").each(function(i,dom){
		var count=$(dom).children(".itemquantity").children(".ng-pristine").val();
		var price=$(dom).children(".itemtotal").children("span").html();
		totalPrice=totalPrice+parseFloat(price);
		totalCount=totalCount+parseFloat(count);
	});
	var distributionMoney=$(".checkoutcart-distributionMoney .distributionMoney").html();
	totalPrice=totalPrice+parseFloat(distributionMoney);
	//写入总价
	$(".checkoutcart-total span").html(parseFloat(totalPrice));
	$(".checkoutcart-totalextra span").html(totalCount);
	
	//地址样式
	$(".checkout-address-list li label").each(function(i,dom){
		var a=$(dom).children(".addressRadio").attr("checked");
		if(a=="checked"){
			$(dom).parent().css({"background":"#fff0e8","border":"1px solid #ff4400"});
			$(dom).next().css("display","inline");
		}
	});
	
});

//减
function btnMinus(e){
	$(".checkoutcart-group dd").remove();
	var count=$(e).next().val();
	var foodId=$(e).parent().prev().val();
	var totalPrice=0;
	var totalCount=0;
	if(count>1){
		count=count-1;
	}else{
		count=1;
	}
		$.ajax({
			   type: "POST",
			   url: "/waimaiSys/restaurant/countChange",
			   data: {"foodId":foodId,"count":count},
			   success: function(obj){
				   	for(var i=0,l=obj.length;i<l;i++){
				   		$(".checkoutcart-group").append("<dd class='ng-scope'>	<div class='checkoutcart-tablerow'>	<div class='cell itemname ng-binding' title='"+
				   				obj[i].foodName+"'>"+obj[i].foodName+"</div>  <input type='hidden' class='foodId' value='"+
				   				obj[i].foodId+"'/>  <div class='cell itemquantity'> <button class='minus' onclick='btnMinus($(this));'>-</button>  <input class='ng-pristine ng-valid' value='"+
				   				obj[i].count+"'>  <button class='plus' onclick='btnPlus($(this));'>+</button>	</div>	<input type='hidden' class='foodPrice' value='"+
				   				obj[i].price+"'/>  <div class='cell itemtotal ng-binding'>¥<span>"+obj[i].count*obj[i].price+"</span></div></div>	</dd>  ");
				   		totalPrice=totalPrice+parseFloat(obj[i].count*obj[i].price);
				   		totalCount=totalCount+parseFloat(obj[i].count);	
					}
				   	var distributionMoney=$(".checkoutcart-distributionMoney .distributionMoney").html();
					totalPrice=totalPrice+parseFloat(distributionMoney);
				   	//写入总价
					$(".checkoutcart-total span").html(parseFloat(totalPrice));
					$(".checkoutcart-totalextra span").html(totalCount);
			   }
		});
		
	
}

//数量改变
function countChange(e){
	$(".checkoutcart-group dd").remove();
	var count=$(e).val();
	alert(count);
	if(count<=0 || isNaN(count)==true || count==null){
		$(e).val(1);
		count=1;
	}
		var foodId=$(e).parent().prev().val();
		var totalPrice=0;
		var totalCount=0;
		$.ajax({
			   type: "POST",
			   url: "/waimaiSys/restaurant/countChange",
			   data: {"foodId":foodId,"count":count},
			   success: function(obj){
				   for(var i=0,l=obj.length;i<l;i++){
				   		$(".checkoutcart-group").append("<dd class='ng-scope'>	<div class='checkoutcart-tablerow'>	<div class='cell itemname ng-binding' title='"+
				   				obj[i].foodName+"'>"+obj[i].foodName+"</div>  <input type='hidden' class='foodId' value='"+
				   				obj[i].foodId+"'/>  <div class='cell itemquantity'> <button class='minus' onclick='btnMinus($(this));'>-</button>  <input class='ng-pristine ng-valid' value='"+
				   				obj[i].count+"'>  <button class='plus' onclick='btnPlus($(this));'>+</button>	</div>	<input type='hidden' class='foodPrice' value='"+
				   				obj[i].price+"'/>  <div class='cell itemtotal ng-binding'>¥<span>"+obj[i].count*obj[i].price+"</span></div></div>	</dd>  ");
				   		totalPrice=totalPrice+parseFloat(obj[i].count*obj[i].price);
				   		totalCount=totalCount+parseFloat(obj[i].count);	
					}
				   	var distributionMoney=$(".checkoutcart-distributionMoney .distributionMoney").html();
					totalPrice=totalPrice+parseFloat(distributionMoney);
				   	//写入总价
					$(".checkoutcart-total span").html(parseFloat(totalPrice));
					$(".checkoutcart-totalextra span").html(totalCount);
			   }
		});
	
}

//加
function btnPlus(e){
	$(".checkoutcart-group dd").remove();
	var count=$(e).prev().val();
	var foodId=$(e).parent().prev().val();
	var totalPrice=0;
	var totalCount=0;
	count++;
	$.ajax({
		   type: "POST",
		   url: "/waimaiSys/restaurant/countChange",
		   data: {"foodId":foodId,"count":count},
		   success: function(obj){
			   for(var i=0,l=obj.length;i<l;i++){
			   		$(".checkoutcart-group").append("<dd class='ng-scope'>	<div class='checkoutcart-tablerow'>	<div class='cell itemname ng-binding' title='"+
			   				obj[i].foodName+"'>"+obj[i].foodName+"</div>  <input type='hidden' class='foodId' value='"+
			   				obj[i].foodId+"'/>  <div class='cell itemquantity'> <button class='minus' onclick='btnMinus($(this));'>-</button>  <input class='ng-pristine ng-valid' value='"+
			   				obj[i].count+"'>  <button class='plus' onclick='btnPlus($(this));'>+</button>	</div>	<input type='hidden' class='foodPrice' value='"+
			   				obj[i].price+"'/>  <div class='cell itemtotal ng-binding'>¥<span>"+obj[i].count*obj[i].price+"</span></div></div>	</dd>  ");
			   		totalPrice=totalPrice+parseFloat(obj[i].count*obj[i].price);
			   		totalCount=totalCount+parseFloat(obj[i].count);	
				}
			   	var distributionMoney=$(".checkoutcart-distributionMoney .distributionMoney").html();
				totalPrice=totalPrice+parseFloat(distributionMoney);
			   	//写入总价
				$(".checkoutcart-total span").html(parseFloat(totalPrice));
				$(".checkoutcart-totalextra span").html(totalCount);
		   }
	});
}

//添加地址按钮
function addAddress(){
	$("#panel").css("display","none");
	//$(".addressformfield input").val("");
	$(".addressformfield input").next().css("color","#b5b5b5");
	$("#addAddressDiv").css("display","block");
	
}

//地图加载
var map = new AMap.Map("container", {
    resizeEnable: true
});

function addressChange(){
	$("#panel").css("display","block");
	var input=$("#tipinput").val();
	
    AMap.service(["AMap.PlaceSearch"], function() {
        //构造地点查询类
        var placeSearch = new AMap.PlaceSearch({ 
            type: '', // 兴趣点类别
            city: "北京", // 兴趣点城市
            citylimit: true,  //是否强制限制在设置的城市内搜索
            panel: "panel", // 结果列表将在此容器中进行展示。
        });
        
        var storeCoordinate=($("#storeCoordinate").val()).split(",");
        var cpoint = [storeCoordinate[0], storeCoordinate[1]]; //中心点坐标
        placeSearch.searchNearBy(input, cpoint, 6000, function(status, result) {

        });
        //点击panel列表的点标记     	
        //listElementClick--使用map、panel属性后，结果面板中POI对应的列表项被点击时触发
        AMap.event.addListener(placeSearch,"listElementClick",function(e) {
	    	console.log(e.data.location);//当前marker的经纬度信息    
	    	console.log(e.data.address);//获取当前marker的具体地址信息    
	    	console.log(e.data);//则是包含所有的marker数据
	    	$("#tipinput").val(e.data.name);
	    	$("#xiangxiAddress").val(e.data.cityname+e.data.adname+e.data.address);
	    	$("#panel").css("display","none");
	    });
        
    });
}

//关闭弹框
function closeDiv(){
	$("#addAddressDiv").css("display","none");
	
}


//失去焦点判断
function inputBlur(e){
	if($(e).val()==null || $(e).val()==" "){
		$(e).next().css("color","red");
		return false;
	}else{
		$(e).next().css("color","#b5b5b5");
		return true;
	}
}

/*//失去焦点判断
function inputBlur(){
	var contactName=$("#contactName").val();
	if(contactName==null || contactName==" "){
		$("#contactName").next().css("color","red");
		return false;
	}else{
		$("#contactName").next().css("color","#b5b5b5");
		return true;
	}
	
	var tipinput=$("#tipinput").val();
	if(tipinput==null || tipinput==" "){
		$("#tipinput").next().css("color","red");
		return false;
	}else{
		$("#tipinput").next().css("color","#b5b5b5");
		return true;
	}
	
	var menpaihao=$("#menpaihao").val();
	if(menpaihao==null || menpaihao==" "){
		$("#menpaihao").next().css("color","red");
		return false;
	}else{
		$("#menpaihao").next().css("color","#b5b5b5");
		return true;
	}
	
	var contactPhone=$("#contactPhone").val();
	if(contactPhone==null || contactPhone==" "){
		$("#contactPhone").next().css("color","red");
		return false;
	}else{
		$("#contactPhone").next().css("color","#b5b5b5");
		return true;
	}
}*/

//检查手机号
function checkPhone(){ 
    var phone = $("#contactPhone").val();
    var reg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
    if(phone!=null && phone!=" "){
    	if(!(reg.test(phone))){ 
    		$("#contactPhone").next().text("(请输入正确的手机号)");
    		$("#contactPhone").next().css("color","red");
        	return false;
        }else{
        	$("#contactPhone").next().text("(请输入您的手机号)");
        	$("#contactPhone").next().css("color","#b5b5b5");
        	return true;
        } 
    }else{
    	$("#contactPhone").next().css("color","red");
    	return false;
    }
}

//新增地址
function saveAddress(){
	if(checkPhone()==true){
		var contactName=$("#contactName").val();
		var userId=$("#userId").val();
		var contactAddress=$("#xiangxiAddress").val();
		var contactPhone=$("#contactPhone").val();
		var gender = $(".addressdialog-content .addressform .sexfield div").find("input[name='gender']:checked").val();
		//alert("sex:"+gender);
		$.ajax({
			   type: "POST",
			   url: "/waimaiSys/car/addUserAddress",
			   data: {"contactName":contactName,"userId":userId,"contactAddress":contactAddress,"contactPhone":contactPhone,"gender":gender},
			   success: function(obj){
				   closeDiv();
				   $(".checkout-address-list li").remove();
				   for ( var i = 0; i < obj.length; i++) {
					   $(".checkout-address-list").append("<li>  <label class='addressInfo' onclick='labelClick($(this));'> <input type='hidden' id='addressId' value='"+
							   obj[i].id+"'/> <input type='hidden' class='isDefault' value='"+obj[i].isDefault+"'/>  <input type='radio' class='addressRadio' name='address'/> <span class='user-address'>	<span>"+
							   obj[i].contactName+"</span>	<em>"+
							   obj[i].contactPhone+"</em> <span>"+
							   obj[i].contactAddress+"</span></span>  <em class='default' style='color: #b6b6b4;'>默认地址</em>  <a href='javascript:void(0);' class='set-default' onclick='setDefault($(this));'>设为默认地址</a> <span class='tips' style='display: none;'>	<i class='success success-icon'><img alt='' width='14px;' height='14px;' src='waimaiSys/static/files/chenggong.png'></i>	<span class='success success-tip'>设置成功！</span></span> 	 </label> <a class='modify' href='javascript:void(0);' style='display: none;' onclick='deleteAddress('"+
							   obj[i].id+"',$(this));'>删除本地址</a></li>");
				   }
				   $(".checkout-address-list li label").each(function(i,dom){
						var isDefault=$(dom).children(".isDefault").val();
						if(isDefault==1){
							$(dom).children(".addressRadio").prop("checked",true);
							$(dom).children(".default").css("display","inline");
							$(dom).children(".set-default").css("display","none");
							$(dom).parent().css({"background":"#fff0e8","border":"1px solid #ff4400"});
							$(dom).next().css("display","inline");
						}
						else{
							$(dom).children(".default").css("display","none");
							$(dom).children(".set-default").css("display","inline");
						}
					});
			   }
		});
	}
}

//设置默认地址
function setDefault(e){
	var addressId=$(e).parent().find("#addressId").val();
	var userId=$("#userId").val();
	$.ajax({
		   type: "POST",
		   url: "/waimaiSys/car/setDefaultAddress",
		   data: {"addressId":addressId,"userId":userId},
		   success: function(obj){
			   $(".checkout-address-list li").remove();
			   for ( var i = 0; i < obj.length; i++) {
				   $(".checkout-address-list").append("<li>  <label class='addressInfo' onclick='labelClick($(this));'> <input type='hidden' id='addressId' value='"+
						   obj[i].id+"'/> <input type='hidden' class='isDefault' value='"+obj[i].isDefault+"'/>  <input type='radio' class='addressRadio' name='address'/> <span class='user-address'>	<span>"+
						   obj[i].contactName+"</span>	<em>"+
						   obj[i].contactPhone+"</em> <span>"+
						   obj[i].contactAddress+"</span></span>  <em class='default' style='color: #b6b6b4;'>默认地址</em>  <a href='javascript:void(0);' class='set-default' onclick='setDefault($(this));'>设为默认地址</a> <span class='tips' style='display: none;'>	<i class='success success-icon'><img alt='' width='14px;' height='14px;' src='waimaiSys/static/files/chenggong.png'></i>	<span class='success success-tip'>设置成功！</span></span> 	 </label> <a class='modify' href='javascript:void(0);' style='display: none;' onclick='updateAddress('"+
						   obj[i].id+"');'>修改本地址</a></li>");
			   }
			   $(".checkout-address-list li label").each(function(i,dom){
					var isDefault=$(dom).children(".isDefault").val();
					if(isDefault==1){
						$(dom).children(".addressRadio").prop("checked",true);
						$(dom).children(".default").css("display","inline");
						$(dom).children(".set-default").css("display","none");
						$(dom).parent().css({"background":"#fff0e8","border":"1px solid #ff4400"});
						$(dom).next().css("display","inline");
					}
					else{
						$(dom).children(".default").css("display","none");
						$(dom).children(".set-default").css("display","inline");
					}
				});
		   }
	});
}


//选中地址
function labelClick(e){
	$(".modify").css("display","none");
	$(".checkout-address-list li").css({"background":"white","border":"1px solid white"});
	$(e).next().css("display","inline");
	$(e).parent().css({"background":"#fff0e8","border":"1px solid #f79b3d"});
}


//确认下单
function sureOrders(){
	var userAddressId=$(".checkout-address-list li label").find("input[name='userAddress']:checked").val();
	var remarks=$(".checkout-select .checkout-info .checkout-input").val();
	if(remarks==null || remarks==""){
		remarks="无";
	}
	if(userAddressId!=null && userAddressId!=undefined){
		location.href="/waimaiSys/car/sureOrders/"+userAddressId+"/"+remarks;
	}else{
		alert("请添加或选择一个地址！");
	}
}

//删除地址
function deleteAddress(id,dom){
	$.ajax({
		   type: "POST",
		   url: "/waimaiSys/car/deleteAddress",
		   data: {"id":id},
		   success: function(obj){
			   $(dom).parent().remove();
		   }
	});
}

//后退
function backToStore(){
	history.back();
}




