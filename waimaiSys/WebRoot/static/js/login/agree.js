$(function(){
   	$(".icon-ok-sign").click(function(){
	    verify = $(this).hasClass('boxcol') ? 0 : 1;
	    $(this).toggleClass('boxcol');
	    ob = $('input[name=agree]');
	    ob.val(ob.val()==0?1:0);
	    ob.val(ob.val() !== verify ? verify : ob.val());
	    ob.val() == 0 ? $('#errormsg').removeClass('hide').addClass('show') : $('#errormsg').removeClass('show').addClass('hide');
    });
   	//输入框输入时模拟placeholder效果
   	var oInput = $(".form-data input");
   	oInput.focus(function () {
		$(this).siblings("label").hide();
    });
   	oInput.blur(function () {
		if($(this).val()==""){
			$(this).siblings("label").show();
		}
	});
   	// 输入框内容变化按钮颜色发生变化
   	oInput.keyup(function () {
   		//手机号正则
   		var phone=/^1[3456789]\d{9}$/;
   		//密码正则
   		var pw=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
   		//判断当前文本框的ID
   		switch ($(this).attr("id")) {
		case "num":
			var phoneval=$(this).val();
			if(phoneval==""||phoneval==null){
				$(".log-btn").addClass("off");
				$('.num-err').removeClass('hide');
				$('.pherre').text('手机号不能为空');
				$(".log-btn").addClass("off");
				y=false;
			}else if(!phone.test(phoneval)){
				$(".log-btn").addClass("off");
				$('.num-err').removeClass('hide');
				$(".log-btn").addClass("off");
				$('.pherre').text('手机号不合法，请输入正确！');
			}
			break;
		case "pass":
			var pws=$(this).val();
			if($(this).val()==""){
				s=false;
				$(".log-btn").addClass("off");
				$('.pass-err').removeClass('hide');
				$('.pwerre').text('密码不能为空！');
				$(".log-btn").addClass("off");
			}else if(!pw.test(pws)){
				s=false;
				$(".log-btn").addClass("off");
				$('.pass-err').removeClass('hide');
				$('.pwerre').find("em").text('密码不合法，请输入正确！');
				$(".log-btn").addClass("off");
			}else{
				s=true;
			}
			break;
		case "num2":
			var phones=$(this).val();
			if(phones==""){
				p=false;
				$(".log-btn").addClass("off");
				$('.num2-err').removeClass('hide');
				$('.num2-err em').text('手机号不能为空！');
				$(".log-btn").addClass("off");
			}else if(!phone.test(phones)){
				p=false;
				$(".log-btn").addClass("off");
				$('.num2-err').removeClass('hide');
				$('.num2-err').find("em").text('手机号格式错误！');
				$(".log-btn").addClass("off");
			}else{
				p=true;
			}
			break;
		case "veri-code":
			var code=$(this).val();
			if(code==""){
				p=false;
				$(".log-btn").addClass("off");
				$('.error').removeClass('hide');
				$('.error').find("em").text('验证码不能为空！');
				$(".log-btn").addClass("off");
			}else if(!(code.length==6)){
				p=false;
				$(".log-btn").addClass("off");
				$('.error').removeClass('hide');
				$('.error').text('请输入正确的验证码！');
				$(".log-btn").addClass("off");
			}else{
				p=true;
			}
			break;
		}
   	});
   });
   