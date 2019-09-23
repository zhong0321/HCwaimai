<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>豪吃外卖</title> 
    <script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
    <style>
         body{
            background: #f2f1f6;
            background: url("static/files/waimaiBackground_500950652.jpg") no-repeat;
            background-size: 100% auto;
			overflow: hidden;
        }
        .login{
            background: white;
            width: 90%; 
            border-radius: 20px 20px;
            padding: 1.2rem;
            margin: 2rem auto;
            font-size: 1rem;
            height: 600px;
        }
        input{
            border: 0;
            outline: none;
            background-color: rgba(0, 0, 0, 0);
			width: 60%;
        }
        .title{
            font-size: 1.2rem;
            height: 3rem;
            line-height: 3rem;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
        }
        .phone,.password{
            border-bottom: solid 0.1rem #f2f1f6;
            height: 3rem;
            line-height: 3rem;
        }
        .loginBtn{
            color: white;
            font-size: 1.1rem;
            border: none;
            background: #029ff9;
            width: 20rem;
            height: 3rem;
            border-radius: 80px 80px;
            margin: 2rem 0rem 0rem 0.2rem;
        }
        .title a{
            color: gray;
            font-size: 0.8rem;
            text-decoration-line: none;
        }
        .registBtn{
            color: black;
            border: solid 2px #CCCCCC;
            background: white;
            width: 20rem;
            height: 3rem;
            font-size: 1.1rem;
            border-radius: 80px 80px;
            margin: 1rem 1.1rem;
            position: absolute;
            bottom: 0.1rem;
        }
        .password .checkNumBtn{
            border: none;
            color: #464759;
            background: white;
        }
    </style>
</head>
<body>
    	
    	<div class="login div11">
	        <div class="title">
	            <span>密码登录</span>
	            <a href="javascript:void(0);" onclick="changePhoneLogin();">手机验证登录</a>
	        </div>
	        <div class="phone">
	        	<img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
	             <input type="text" placeholder="手机号" id="dmPhone" autocomplete="new-password"/>
	        </div>
	        <div class="password">
	        	<img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
	           <input type="password" placeholder="密码" id="dmPassword" autocomplete="new-password"/>
	        </div>
	       	<button class="loginBtn" type="button" onclick="passLogin();">登录</button>
	    </div>
	    
	    
	    <div class="login div22" style="display: none;">
	        <div class="title">
	            <span>手机验证登录</span>
	            <a href="javascript:void(0);" onclick="changePassLogin();">密码登录</a>
	        </div>
	        <div class="phone">
	        	<img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
	             <input type="text" placeholder="手机号" id="dmPhone2" autocomplete="new-password"/>
	        </div>
	        <div class="password">
	        	<img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
	           <input id="yanzhengma" name="yanzhengma" type="text" placeholder="验证码" autocomplete="new-password"/>
	           <button style="margin-left: 20px;" type="button" class="checkNumBtn" onclick="sendYanZhengMa();">获取验证码</button>
            	<input type="hidden" id="maTrue" autocomplete="new-password" />
	        </div>
	    	<button class="loginBtn" type="button" onclick="phoneLogin();">登录</button>
	    </div>
    <button class="registBtn" onclick="location.href='dmRegist.jsp'">注册</button>
    <%@include file="tyAlert.jsp" %>
</body>
<script type="text/javascript">
	function changePhoneLogin(){
		/* $(".div11").css("display","none");
		$(".div22").css("display","block"); */
		 $(".div11").hide();
		 $(".div22").show();
	}
	
	function changePassLogin(){
		/* $(".div22").css("display","none");
		$(".div11").css("display","block"); */
		$(".div22").hide();
		$(".div11").show();
	}
	
	//发送验证码
	 function sendYanZhengMa(){
	 	var dmPhone=$("#dmPhone2").val();
	 	var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
	 	if(!reg.test(dmPhone)){
	 			ShowDiv('MyDiv1','fade1','手机号格式有误！');
	 	}else{
		 	var random = Math.floor(Math.random()*100000)+100000;
		 	$("#maTrue").val("123456");
		 	$.ajax({
			   type: "POST",
			   url: "/waimaiSys/dmLogin/checkPhone",
			   data: {"dmPhone":dmPhone},
			   async:false,
			   success: function(obj){
			   		if(obj==1){
			   			$.ajax({
							type: "POST",
							url: "/waimaiSys/Obtain",
							data: {"random":random,"phoneNumber":dmPhone},
							async:false,
							success: function(obj){
							}
						});
			   		}else{
			   			ShowDiv('MyDiv1','fade1','账号不存在！请先注册!');
			   		}
			   }
			});
	 	}
	 	
	 	
	 }
	 
	 //账号密码登录
	 function passLogin(){
	 	var dmPhone=$("#dmPhone").val();
	 	var dmPassword=$("#dmPassword").val();
	 	var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
	 	if(dmPhone==null || dmPhone=="" ||dmPassword==null || dmPassword=="" ){
	 		ShowDiv('MyDiv1','fade1','请完整填写信息！');
	 	}else{
	 		if(!reg.test(dmPhone)){
	 			ShowDiv('MyDiv1','fade1','手机号格式有误！');
	 		}else{
	 			$.ajax({
				   type: "POST",
				   url: "/waimaiSys/dmLogin/loginByPassword",
				   data: {"dmPhone":dmPhone,"dmPassword":dmPassword},
				   async:false,
				   success: function(obj){
				   		if(obj==1){
				   			location.href="/waimaiSys/dmOrder/qiangDan/2";
				   		}else{
				   			ShowDiv('MyDiv1','fade1','账号或密码错误！');
				   		}
				   }
				});
	 		}
	 	}
	 }
	 
	 //手机号登录
	 function phoneLogin(){
	 	var dmPhone=$("#dmPhone2").val();
	 	var yanzhengma=$("#yanzhengma").val();
	 	var maTrue=$("#maTrue").val();
	 	var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
	 	if(dmPhone==null || dmPhone=="" ||yanzhengma==null || yanzhengma=="" ){
	 		ShowDiv('MyDiv1','fade1','请完整填写信息！');
	 	}else{
	 		if(!reg.test(dmPhone)){
	 			ShowDiv('MyDiv1','fade1','手机号格式有误！');
	 		}else{
	 			if(maTrue!=yanzhengma){
	 				ShowDiv('MyDiv1','fade1','验证码错误！');
	 			}else{
	 				location.href="/waimaiSys/dmOrder/qiangDan/2";
	 			}
	 		}
	 	}
	 }
	 
	  //通用单选弹框
		function ShowDiv(show_div,bg_div,str){
			document.getElementById(show_div).style.display='block';
			document.getElementById(bg_div).style.display='block' ;
			document.getElementById("fm1").innerHTML = str;
			var bgdiv = document.getElementById(bg_div);
			bgdiv.style.width = document.body.scrollWidth;
			$("#"+bg_div).height($(document).height());
		};
</script>
</html>