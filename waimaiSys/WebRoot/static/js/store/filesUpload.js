	//提交表单之前判断是否为空
	function checkNotNull(){
		var storeName=$("#storeName").val();
		/* var storeImg=$("#storeImg").val(); */ 
		var startMoney=$("#startMoney").val();
		var distributionMoney=$("#distributionMoney").val();
		var address=$("#address").val();
		var lnglat=$("#lnglat").val();
		if(storeName!=null && storeName!="" && startMoney!=null && startMoney!="" &&distributionMoney!=null && distributionMoney!="" &&address!=null && address!="" &&lnglat!=null && lnglat!="" ){
			return true;
		}else{
			//ShowDiv_1('MyDiv1','fade1','除了商品描述以外的，其他均为必填项<br/>请填写完整的商品信息');
			return false;
		}
	}

	function storename(name){
		var a=$(name).val();
		if(a.trim().length==0){
			$(name).css({"border":"1px red solid"});
			return false;
		}else if(VerificationName(name)){
			$(name).css({"border":"1px black solid"});
			return true;
		}else{
    		$(name).css({"border":"1px red solid"});
    		$(name).val("");
    		$(name).attr("placeholder","该名称已被注册");
    		return false;
		}
	}
	
	function VerificationName(name){
		var b=false;
		$.ajax({
            url: 'findStoreName',
            type: 'post',
            cache :false,
            async : false,
            data: "StoreName="+$(name).val()+"&storePhone="+$("#storephone").val(),
            success:function(data){
            	if(data==0){
            		b= true;
            	}else{
            		b=false;
            	}
            }
        });
		return b;
	}
	
	function logo(logo){
		var aa=$(logo).val();
		if(aa==""||aa==null){
			$(logo).css({"border":"1px red solid"});
			return false;
		}
		$(logo).css({"border":"1px black solid"});
		return true;
	}
	
	function startMoney(a){
		var b=$(a).val();
		if(b.trim().length>0){
			$(a).css({"border":"1px black solid"});
			return true;
		}else{
			$(a).css({"border":"1px red solid"});
			return false;
		}
	}
	
	
	function distributionMoney(a){
		var b=$(a).val();
		if(b.trim().length>0){
			$(a).css({"border":"1px black solid"});
			return true;
		}else{
			$(a).css({"border":"1px red solid"});
			return false;
		}
	}
	
	$(function(){
		$("#storeName").blur(function (){
			storename(this);
			}
		);
		$("#startMoney").blur(function(){
			startMoney(this);
		});
		$("#distributionMoney").blur(function(){
			distributionMoney(this);
		});
		$("#tipinput").blur(function(){
			tipinput(this);
		});
	});
	function formSubmit(){
		if(storename($("#storeName"))){
			if(logo($(".fileUpload"))){
				if(startMoney($("#startMoney"))){
					if(distributionMoney($("#distributionMoney"))){
						if(select($(".add"))){
							if(tipinput($("#tipinput"))){
								$("#storeForm").submit();
								return true;
							}
						}
					}
				}
			}
		}
			return false;
		
	}
    
	function select(a){
		var b=$(a).val();
		if(b==""){
			$(a).css({"border":"1px red solid"});
			return false;
		}else{
			$(a).css({"border":"1px black solid"});
			return true;
		}
	}
	
	function tipinput(a){
		if($(a).val().trim().length>0){
			if($("#lnglat").val()==""){
				$(a).val("");
				$(a).attr("placeholder","请选择正确地址");
				$(a).css({"border":"1px red solid"});
				return false;
			}else{
				$(a).css({"border":"1px black solid"});
				return true;
			}
			
		}else{
			$(a).css({"border":"1px red solid"});
			return false;
		}
	}
	
    //地图加载
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    
    var getCity=$("#city").val();
    $(function(){
    	//下拉框改變事件
    	$(".add").change(function(){
    		var tipinput=$("#tipinput").val(" ");
    		getCity=$("#city").val();
    		var autoOptions = {
		    	city: getCity,
		        input: "tipinput"
		    };
		    var auto = new AMap.Autocomplete(autoOptions);
		    var placeSearch = new AMap.PlaceSearch({
		    	city: "北京",
		    	citylimit: true,
		        map: map
		    }); 
		    AMap.event.addListener(auto, 'select', function(e){
		    	document.getElementById('lnglat').value =e.poi.location;
		    	getAddress();
		  	});
		    select(this);
    	});
    	
    });
    
    //输入提示
    var autoOptions = {
    	city: "北京",
        input: "tipinput"
    };
    var auto = new AMap.Autocomplete(autoOptions);
    var placeSearch = new AMap.PlaceSearch({
    	city: "北京",
    	citylimit: true,//
        map: map
    }); 
    //获取选中地址的信息，经纬度
    AMap.event.addListener(auto, 'select', function(e){
    	document.getElementById('lnglat').value =e.poi.location;
    	getAddress();
  	});
    
    //逆地理编码
    function getAddress(){
    AMap.plugin('AMap.Geocoder', function() {
	  var geocoder = new AMap.Geocoder({
	    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
	    city: getCity 
	  });
	 
	  var lnglat=$("#lnglat").val();
	
	  geocoder.getAddress(lnglat, function(status, result) {
	    if (status === 'complete' && result.info === 'OK') {
	        // result为对应的地理位置详细信息
	        var address = result.regeocode.formattedAddress;
            document.getElementById('address').value = address;
	    }
	  });
	});
   }
    
    




$(document).ready(function() {
     $(".fileUpload").on('change', function () {
    	 //清空预览图片
    	 var image_holder = $(".image-holder");
         image_holder.empty();
         //判断格式是否正确
    	 var name=$(".fileUpload").val();  
	     var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();  
	     if(fileName!="jpg"&& fileName !="jpeg" && fileName !="pdf" && fileName !="png" && fileName !="dwg" && fileName !="gif"){  
	       //alert(fileName); 
	     alert("格式错误");
	     $(".fileUpload").val("");  
	         return;
	     }else{
	    	 //预览图片
	    	 if (typeof (FileReader) != "undefined") {
	             var image_holder = $(".image-holder");
	             image_holder.empty();
	             var reader = new FileReader();
	             reader.onload = function (e) {
	                /* $("<img />", {
	                     "src": e.target.result,
	                     "class": "thumb-image"
	                 }).appendTo(image_holder);
*/
	            	 $("#logo").attr("src",e.target.result);
	             }
	             image_holder.show();
	             reader.readAsDataURL($(this)[0].files[0]);
	         } else {
	             alert("This browser does not support FileReader.");
	         }
	     }
    });
});