<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>找回密码</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
	<link rel="stylesheet" href="../static/css/login/base.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/iconfont.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/reg.css" type="text/css"></link>
	<script type="text/javascript" src="../static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../static/js/login/getpw.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#pc_tel").val("");
		});
	</script>
</head>
<body>
<div id="ajax-hook"></div>
<div class="wrap">
    <div class="wpn">
        <div class="form-data find_password">
            <h4>找回密码</h4>
            <span id="a">
            <p class="right_now">已有账号，<a href="../gologin/${code}">马上登录</a></p>
            <p class="p-input pos">
                <label for="pc_tel">手机号</label>
                <input type="text" autocomplete="fd" id="pc_tel">
                <input type="text" style="display: none" id="logintype"value="${code}">
                <span class="tel-warn pc_tel-err hide"><em>手机号格式错误</em><i class="icon-warn"></i></span>
            </p>
            <p class="p-input pos">
                <label for="veri-code">输入验证码</label>
                <input type="number" id="veri-code">
                <a href="javascript:;" class="send">发送验证码</a>
                <span class="time hide"><em>120</em>s</span>
                <span class="tel-warn error hide"><em>验证码错误，请重新输入</em><i class="icon-warn"></i></span>
            </p>
            <button class="lang-btn next">下一步</button>
            </span>
            <span class="pww hide" >

                <p class="p-input pos">
                    <label for="pc_tel">新密码</label>
                    <input type="password" id="pc_pw">
                    <input type="text" style="display: none" id="pwtype"value="${code}">
                    <span class="tel-warn pc_pw-err hide"><em>手机号格式错误</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="pc_tel">确认密码</label>
                    <input type="password" id="pc_pws">
                    <span class="tel-warn pc_pws-err hide"><em>手机号格式错误</em><i class="icon-warn"></i></span>
                </p>
                <button class="lang-btn oks">确认</button>
            </span>
            <p class="right">Powered by © 2019</p>
        </div>
    </div>
</div>

</body>
</html>