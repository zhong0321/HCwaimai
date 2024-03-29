$(function(){
	var tab = 'account_number';
	// 选项卡切换
	$(".account_number").click(function () {
		$('.tel-warn').addClass('hide');
		tab = $(this).attr('class').split(' ')[0];
		checkBtn();
        $(this).addClass("on");
        $(".message").removeClass("on");
        $(".form2").addClass("hide");
        $(".form1").removeClass("hide");
    });
	// 选项卡切换
	$(".message").click(function () {
		$('.tel-warn').addClass('hide');
		tab = $(this).attr('class').split(' ')[0];
		checkBtn();
		$(this).addClass("on");
        $(".account_number").removeClass("on");
		$(".form2").removeClass("hide");
		$(".form1").addClass("hide");
		
    });

	$('#num').keyup(function(event) {
		$('.tel-warn').addClass('hide');
		checkBtn();
	});

	$('#pass').keyup(function(event) {
		$('.tel-warn').addClass('hide');
		checkBtn();
	});

	$('#veri').keyup(function(event) {
		$('.tel-warn').addClass('hide');
		checkBtn();
	});

	$('#num2').keyup(function(event) {
		$('.tel-warn').addClass('hide');
		checkBtn();
	});

	$('#veri-code').keyup(function(event) {
		$('.tel-warn').addClass('hide');
		checkBtn();
	});

	// 按钮是否可点击
	function checkBtn()
	{
		$(".log-btn").off('click');
		if (tab == 'account_number') {
			var inp = $.trim($('#num').val());
			var pass = $.trim($('#pass').val());
			if (inp != '' && pass != '') {
				if (!$('.code').hasClass('hide')) {
					code = $.trim($('#veri').val());
					if (code == '') {
						$(".log-btn").addClass("off");
					} else {
						$(".log-btn").removeClass("off");
						sendBtn();
					}
				} else {
					$(".log-btn").removeClass("off");
						sendBtn();
				}
			} else {
				$(".log-btn").addClass("off");
			}
		} else {
			var phone = $.trim($('#num2').val());
			var code2 = $.trim($('#veri-code').val());
			if (phone != '' && code2 != '') {
				$(".log-btn").removeClass("off");
				sendBtn();
			} else {
				$(".log-btn").addClass("off");
			}
		}
	}

	function checkAccount(username){
		if (username == '') {
			$('.num-err').removeClass('hide').find("em").text('请输入账户');
			return false;
		} else {
			$('.num-err').addClass('hide');
			return true;
		}
	}

	function checkPass(pass){
		if (pass == '') {
			$('.pass-err').removeClass('hide').text('请输入密码');
			return false;
		} else {
			$('.pass-err').addClass('hide');
			return true;
		}
	}

	function checkCode(code){
		if (code == '') {
			return false;
		} else {
			return true;
		}
	}

	function checkPhone(phone){
		if (phone == '') {
			$('.num2-err').removeClass('hide').find("em").text('请输入手机号');
			return false;
		}
		var param = /^1[34578]\d{9}$/;
		if (!param.test(phone)) {
			$('.num2-err').removeClass('hide');
			$('.num2-err').text('手机号不合法，请重新输入');
			return false;
		}
		return true;
	}

	function checkPhoneCode(pCode){
		if (pCode == '') {
			$('.error').removeClass('hide').text('请输入验证码');
			return false;
		} else {
			$('.error').addClass('hide');
			return true;
		}
	}
	// 登录点击事件
	function sendBtn(){
		if (tab == 'account_number'){
			//账号密码的登陆
			$(".log-btn").click(function(){
				var inp = $.trim($('#num').val());
				var pass = $.trim($('#pass').val());
				var logintype=$("#logintype").val();
				if (checkAccount(inp) && checkPass(pass)){
					//var ldata = {userPhone:inp,userPassword:pass};
						$.ajax({
							url: '../login',
							type: 'post',
							async: true,
							data: {"userPhone":inp,"userPassword":pass,"loginType":logintype},
							success:function(data){
								if (data == '1') {
									if(logintype==1){
										location.href="../getAddress.jsp";
									}else if(logintype==2){
										location.href="../findstorePhone?phone="+inp;
									}else{
										location.href="../admins";
									}
								}else if(data == '9'){//订餐地址已存入session，直接进入点餐页面
									if(logintype==1){
										location.href="../index/find";
									}
								}else if(data== '0') {
									if(logintype==1){
										$(".log-btn").off('click').addClass("off");
										$('.pass-err').removeClass('hide').find('em').text("账号或密码错误！");
										$('.pass-err').find('i').attr('class', 'icon-warn').css("color","#d9585b");
									}else{
										$(".log-btn").off('click').addClass("off");
										$('.pass-err').removeClass('hide').find('em').text("账号不存在或密码错误！");
										$('.pass-err').find('i').attr('class', 'icon-warn').css("color","#d9585b");
									}
									return false;
								}
							}
						});


				} else {
					return false;
				}
			});
		} else {
			//验证码登录
			$(".log-btn").click(function(){
				var phone = $.trim($('#num2').val());
				var pcode = $.trim($('#veri-code').val());
				var logintype=$("#logintype").val();
				if (checkPhone(phone) && checkPass(pcode)) {
					$.ajax({
			            url: '../checkPhone/'+logintype,
			            type: 'post',
			            async: false,
			            data: {phone:phone,logintype:logintype},
			            success:function(data){
			                if (data== '0') {
			                    $('.num2-err').removeClass('hide').text("手机号未注册,先去注册吧！");
			                    status = false;
			                } else {
			                    $('.num2-err').addClass('hide');
			                    location.href="../getAddress.jsp";
								status = true;
			                }
			            }
			        });
					return status;
				} else {
					$(".log-btn").off('click').addClass("off");
					return false;
				}
			});
		}
	}

	// 登录的回车事件
	$(window).keydown(function(event) {
    	if (event.keyCode == 13) {
    		$('.log-btn').trigger('click');
    	}
    });
//获取验证码事件
	$(".form-data").delegate(".send","click",function () {
		var phone = $.trim($('#num2').val());
		if (checkPhone(phone)) {
				$.ajax({
		            url: '../Obtain',
		            type: 'post',
		            dataType: 'json',
		            async: false,
		            data: {"phoneNumber":phone},
		            success:function(data){
		                if (data) {
		                    
		                } else {
		                    
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