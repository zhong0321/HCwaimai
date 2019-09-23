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
    <title>豪吃</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
	<link rel="stylesheet" href="../static/css/login/base.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/iconfont.css" type="text/css"></link>
	<link rel="stylesheet" href="../static/css/login/reg.css" type="text/css"></link>
	<script type="text/javascript" src="../static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		document().getElementById("num").value="";
		Document().getElementById("pass").value="";
		Document().getElementById("num2").value="";
		Document().getElementById("veri-code").value="";
	</script>
</head>
<body>
<div class="wrap">
    <div class="wpn">
        <div class="form-data pos">
            <span style='width:150px;display: block; font-size: 20px;margin: 20px auto'>${title}</span>
           <c:if test="${code!=3}">
	           <div class="change-login">
	               <p class="account_number on">账号登录</p><p class="message">短信登录</p>
	            </div>
            </c:if>
            <!-- 账号密码登陆 -->
            <div class="form1">
                <p class="p-input pos">
                    <label for="num">
                        <c:if test="${code!=3}">手机号</c:if><c:if test="${code==3}">账号</c:if>
                    </label>
                    <input type="text" id="num">
                    <span class="tel-warn num-err hide"><em class="pherre">账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="pass">请输入密码</label>
                    <input type="hidden" name="code" id="logintype" value="${code}" />
                    <input type="password" id="pass" autocomplete="new-password">
                    <span class="tel-warn pass-err hide"><em class="pwerre">账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos code hide">
                    <label for="veri">请输入验证码</label>
                    <input type="text" id="veri">
                    <span class="tel-warn img-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                </p>
            </div>
            
            <!-- 验证码登陆 -->
            <div class="form2 hide">
                <p class="p-input pos">
                    <label for="num2">手机号</label>
                    <input type="number" id="num2">
                    <span class="tel-warn num2-err hide"><em>账号或密码错误</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="veri-code">输入验证码</label>
                    <input type="number" id="veri-code">
                    <a href="javascript:;" class="send">发送验证码</a>
                    <span class="time hide"><em>120</em>s</span>
                    <span class="tel-warn error hide">验证码错误</span>
                </p>
            </div> 
            <c:if test="${code!=3}">
                <div class="r-forget cl">
                    <a class="z" href="../goreg/${code}"><c:if test="${code!=2}">账号注册</c:if><c:if test="${code==2}">商家入驻</c:if></a>
                    <a href="../gogetpass/${code}" class="y">忘记密码</a>
                </div>
             </c:if>
            <button class="lang-btn off log-btn">登录</button>
            <p class="right">Powered by © 2019</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="../static/js/login/login2.js"></script>
<script type="text/javascript" src="../static/js/login/agree.js"></script>
</body>
</html>