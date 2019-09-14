<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
  </head>
  <body>
    <div class="csr-header">
            <div class="header-content">
                <a id="left" href="">
                    <div class="logo-pic"></div>
                    <div class="waimai">
                        <div class="waimai-title">豪吃</div>
                        <div class="waimai-slogan"></div>
                    </div>
                </a>
                <div id="right">
                    <ul id="links">
                        <li data-index="0"><a href="/waimaiSys/index.jsp">首页</a></li>
                        <li data-index="1"><a href="">商家入驻</a></li>
                        <li data-index="4"><a href="" class="active">点外卖</a></li>
                        <li data-index="5"><a href="">后台管理</a></li>
                    </ul>
                </div>
            </div>
        </div>
  </body>
</html>
