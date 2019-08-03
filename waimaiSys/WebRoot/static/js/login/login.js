var yanzhengma="";
var flag = false;
$(function (){
	function sendBtn(){
		var inp=$.trim($("#tel").val());
		var code=$.trim($("#veri-code").val());
		var pw=$.trim($("#passport").val());
		var pws=$.trim($("#passport2").val());
		if(checkPhone(inp)){
			if(checkPhoneCode(code)){
				if(checkPassword(pw)){
					if(checkPws(pws)){
							return true;
					}
				}
			}
		}
		return false;
	}
	
	
	$(".lang-btn").click(function(){
		if(sendBtn()){
			var inp=$.trim($("#tel").val());
			var code=$.trim($("#veri-code").val());
			var pw=$.trim($("#passport").val());
			var pws=$.trim($("#passport2").val());
			var atype=$("#atype").val();
			$.ajax({
	            url: '../register/'+atype,
	            type: 'post',
	            data: {"userPhone":inp,"userPassWord":pw},
	            success:function(data){
	                if (data=="0") {
	                	alert("系统异常！");
	                } else{
	                	if(atype==1){
		                	location.href="../gologin/"+atype;
	                	}else{
	                		location.href="../storeRegist1.jsp";
	                	}
	                }
	            }
	        });
		}
	});
	var is=false;
	function checkPhone(phone){
		var atype=$("#atype").val();
		var a=/^1[34578]\d{9}$/;
		if (phone == '') {
			$('.tel-err').removeClass('hide').find("em").text('请输入手机号');
			is= false;
		}else if(!a.test(phone)){
			$(".tel-err").removeClass('hide').find("em").text('手机号格式错误');
			is= false;
		}else{
			$.ajax({
	            url: '../checkPhone/'+atype,
	            type: 'post',
	            data: {"phone":phone},
	            async: true,
	            success:function(data){
	                if (data=="1") {
	        			$('.tel-err').removeClass('hide').find("em").text('手机号已被注册');
	        			is= false;
	                } else{
	                	$('.tel-err').addClass('hide');
	                	is= true;
	                }
	            }
	        });
		}
		return is;
	}
	
	
	//验证码验证
	function checkPhoneCode(pCode){
		if (pCode == '') {
			$('.error').removeClass('hide').find("em").text('请输入验证码');
			return false;
		}
		if(pCode.length!=6){
			$('.error').removeClass('hide').find("em").text('请输入正确格式验证码');
			return false;
		}else if(yanzhengma==""){
			$('.error').removeClass('hide').find("em").text('验证码获取失败');
			return false;
		}else if(yanzhengma!=pCode){
			$('.error').removeClass('hide').find("em").text('验证码错误');
			return false;
		}else{
			$('.error').addClass('hide');
			return true;
		}
	}
	
	/**\
	 * 密码验证
	 */
	function checkPassword(pw){
		var a=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
		if (pw == '') {
			$('.pwd-err').removeClass('hide').find("em").text('请输入密码');
			return false;
		}
		if(!a.test(pw)){
			$('.pwd-err').removeClass('hide').find("em").text('请输入正确格式的密码');
			return false;
		}else {
			$('.pwd-err').addClass('hide');
			return true;
		}
	}
	/**
	 * 确认密码验证
	 */
	function checkPws(pws){
		var a=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
		if(checkPassword($("#passport").val())){
			if (pws == '') {
				$('.confirmpwd-err').removeClass('hide').find("em").text('请输入验证密码');
				return false;
			}
			if(!a.test(pws)){
				$('.confirmpwd-err').removeClass('hide').find("em").text('请输入正确格式密码');
				return false;
			}else {
				$('.confirmpwd-err').addClass('hide');
				return true;
			}
		}else{
			return false;
		}
	}
	

	//获取验证码事件
		$(".form-data").delegate(".send","click",function () {
			var phone = $.trim($('#tel').val());
			if (checkPhone(phone)) {
				alert(phone);
					$.ajax({
			            url: '../Obtain',
			            type: 'post',
			            data: {"phoneNumber":phone},
			            success:function(data){
			                if (data=="false") {
			                     alert("系统异常!");
			                } else if(data.length==6){
			                	yanzhengma=data;
			                }
			            }
			        });
		       	var oTime = $(".form-data .time"),
				oSend = $(".form-data .send"),
				num = parseInt(oTime.text()),
				oEm = $(".form-data .time em");
			    $(this).hide();
			    oTime.removeClass("hide");
			    var timer = setInterval(function () {
			   	var num2 = num-=1;
		            oEm.text(num2);
		            if(num2==0){
		                clearInterval(timer);
		                oSend.text("重新发送验证码");
					    oSend.show();
		                oEm.text("120");
		                oTime.addClass("hide");
		            }
		        },1000);
			}
	    });
});