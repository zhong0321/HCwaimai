<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>" /><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    <title></title>
    <link rel="stylesheet" href="${cp}static/css/page/home.css">
  </head>
  <body>
    	<div class="csr-header">
            <div class="header-content">
                <div id="left" style="width: 30%">
                    <div class="waimai">
                        <c:if test="${user!=null }">
			            	<a class="j-login new-login-btn fr" href="" rel="nofollow">退出登录</a>
			            	<a class="new-list-btn fr" href="${cp}order/myOrders">我的订单</a>
			            	<span class="new-list-btn fr"><img width="30" height="20" src="${cp}static/files/yonghu687412.png"><span >${user.userName}</span> </span>
			            </c:if>
			            <c:if test="${user==null }">
				            <a class="j-login new-login-btn fr" href="gologin/1" rel="nofollow">登录</a>
				            <a class="j-register new-register-btn fr" href="goreg/1" rel="nofollow">注册</a>
			            </c:if>
                    </div>
                </div>
                <div id="right">
                    <ul id="links">
                        <!-- <li data-index="0"><a href="/waimaiSys/index.jsp">首页</a></li> -->
                        <li data-index="4"><a href="" class="active">点外卖</a></li>
                        <li data-index="1"><a href="${cp}goreg/2">商家入驻</a></li>
                        <li data-index="5"><a href="${cp}dmRegist.jsp">成为骑手</a></li>
                    </ul>
                </div>
            </div>
        </div>
  </body>
</html>
