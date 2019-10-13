
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
    <title>用户注册</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
	<link rel="stylesheet" href="../static/css/login/base.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/iconfont.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/reg.css" type="text/css"></link>
	<script type="text/javascript" src="../static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../static/js/login/login.js"></script>
</head>

<body>
    <div id="ajax-hook"></div>
    <div class="wrap">
        <div class="wpn">
            <div class="form-data pos">
                <span style="width:100px;display: block; font-size: 20px;margin: 10px auto">${title}</span>
                <form >
                    <p class="p-input pos">
                        <label for="tel">手机号</label>
                        <input type="number" id="tel" autocomplete="off">
                        <span class="tel-warn tel-err hide"><em>请输入正确格式手机号</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos" id="sendcode">
                        <label for="veri-code">输入验证码</label>
                        <input type="number" id="veri-code">
                        <a href="javascript:void (0)" class="send">发送验证码</a>
                        <span class="time hide"><em>120</em>s</span>
                        <span class="error hide"><em>验证码错误</em><i class="icon-warn" style="margin-left: 5px"></i></span>
                    </p>
                    <p class="p-input pos" id="pwd">
                        <label for="passport">输入密码</label>
                        <input type="text" id="atype" value="${code}"style="display: none"/>
                        <input type="password" id="passport" value="">
                        <span class="tel-warn pwd-err hide"><em></em><i class="icon-warn" style="margin-left: 5px"></i></span>
                    </p>
                    <p class="p-input pos" id="confirmpwd">
                        <label for="passport2">确认密码</label>
                        <input type="password" style="position:absolute;top:-998px"/>
                        <input type="password" id="passport2">
                        <span class="tel-warn confirmpwd-err hide"><em></em><i class="icon-warn" style="margin-left: 5px"></i></span>
                    </p>
                </form>
                <!-- <div class="reg_checkboxline pos">
                    <p>点击注册表示已阅读并接受 <a href="#" target="_brack">《XXXX协议说明》</a></p>
                </div> -->
                <button class="lang-btn"><c:if test="${code!=2 }">注册</c:if><c:if test="${code==2 }">下一步</c:if></button>
                	<div class="bottom-info">已有账号，<a href="../gologin/${code}">马上登录</a></div>
                
                <p class="right">Powered by © 2018</p>
            </div>
        </div>
    </div>
 <script type="text/javascript" src="../static/js/login/ragree.js"></script>
</body>
</html>