<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title></title>
    <link rel="stylesheet" href="${cp}static/css/store/storeRegist.css"/>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/store/shenhe.js"></script>
    <style type="text/css">
        .storeInfo .shenheInfo{
            margin: 180px 0px 0px 250px;
            display: flex;
        }
        .storeInfo .shenheInfo div{
            margin: 0px 10px;
        }
        .button{
        	display:block;
        	width: 200px;
        	height: 20px;
        	margin: 0 auto;
        	background: red;
        	opacity:0.5;
        }
    </style>
    
</head>
<body>
    <header>
        <div class="logoDiv">dfd</div>
        <div class="username">
            用户名
        </div>
    </header>
    <div class="bottom">
        <div class="content">
            <div class="navDiv">
                <div>店铺信息</div>
                <div style="background: #08C1AE;">资质信息</div>
                <div style="background: #08C1AE;">完成</div>
            </div>
            <div class="storeInfo">
            	<input type="hidden" value="${store.storePhone }" id="phone">
                <div class="shenheInfo">
                    <div>
                        <img src="${cp}static/files/zhengque545612155.png" alt="" width="80px;" height="80px;"/>
                    </div>
                    <div>
                        <p id="tsss" style="font-size: 20px;color: dimgray;"></p>
                        <form action="deleteStoreinfo" method="post">
                        	<input type="hidden" name="storeId" value="${store.id }">
                        	<input type="hidden" name="registState" value="0">
                        	<input type="submit" class="button" style="display: none" value="重新填写信息">
                        </form>
                    	
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>