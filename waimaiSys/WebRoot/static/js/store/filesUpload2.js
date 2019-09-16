function inputyz(input){
	var a=$(input).val().trim();
	if(a.length>0){
		return true;
	}else{
		$(this).css({"border":"1px red solid"});
		return false;
	}
}



var bac=/^[\u4e00-\u9fa5]{2,10}$/;
var mPattern = /^1[3456789]\d{9}$/;
var cP = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
var pattern = /^([1-9]{1})(\d{14}|\d{18})$/;//银行卡
var bbb=/(^(?:(?![IOZSV])[\dA-Z]){2}\d{6}(?:(?![IOZSV])[\dA-Z]){10}$)|(^\d{15}$)/;
function linkmanName(a){
	var c=$(a).val();
	if(bac.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
}
function linkmanPhone(a){
	var c=$(a).val();
	if(mPattern.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
	
}

function legalRepresentative(a){
	var c=$(a).val();
	if(bac.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
}
function bankCard(a){
	var c=$(a).val();
	if(pattern.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
}

function IDCard(a){
	var c=$(a).val();
	if(cP.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
}

function shopCard(a){
	var c=$(a).val();
	if(bbb.test(c)){
		$(a).css({"border":"1px black solid"});
		return true;
	}else{
		$(a).css({"border":"1px red solid"});
		return false;
	}
}
function logoa(logo){
	var aa=$(logo).val();
	if(aa==""||aa==null){
		$(logo).css({"border":"1px red solid"});
		return false;
	}
	$(logo).css({"border":"1px black solid"});
	return true;
}

function logob(logo){
	var aa=$(logo).val();
	if(aa==""||aa==null){
		$(logo).css({"border":"1px red solid"});
		return false;
	}
	$(logo).css({"border":"1px black solid"});
	return true;
}

function logoc(logo){
	var aa=$(logo).val();
	if(aa==""||aa==null){
		$(logo).css({"border":"1px red solid"});
		return false;
	}
	$(logo).css({"border":"1px black solid"});
	return true;
}
$(function(){
	$("#linkmanName").blur(function(){
		if(inputyz(this)){
			linkmanName(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	
	$("#linkmanPhone").blur(function(){
		if(inputyz(this)){
			linkmanPhone(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	
	
	$("#legalRepresentative").blur(function(){
		if(inputyz(this)){
			legalRepresentative(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	
	$("#IDCard").blur(function(){
		if(inputyz(this)){
			IDCard(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	$("#bankCard").blur(function(){
		if(inputyz(this)){
			bankCard(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	$("#shopCard").blur(function(){
		if(inputyz(this)){
			shopCard(this);
		}else{
			$(this).css({"border":"1px red solid"});
		}
	});
	$("#aa").blur(function(){
		logoa(this);
	});
	$("#ab").blur(function(){
		logob(this);
	});
	$("#ac").blur(function(){
		logoc(this);
	});
	
	$("#button").click(function(){
			if(linkmanName($("#linkmanName"))){
				if(linkmanPhone($("#linkmanPhone"))){
					if(legalRepresentative($("#legalRepresentative"))){
						if(IDCard($("#IDCard"))){
							if(bankCard($("#bankCard"))){
								if(shopCard($("#shopCard"))){
									if(logoa($("#aa"))){
										if(logob($("#ab"))){
											if(logoc($("#ac"))){
												$("#storeAptitudeForm").submit();
											}
										}
									}
								}
							}
						}
					}
				}
			}
	});
});




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