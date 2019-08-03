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
    <style type="text/css">
        .storeInfo .shenheInfo{
            margin: 180px 0px 0px 250px;
            display: flex;

        }
        .storeInfo .shenheInfo div{
            margin: 0px 10px;
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
                <div class="shenheInfo">
                    <div>
                        <img src="${cp}static/files/zhengque545612155.png" alt="" width="80px;" height="80px;"/>
                    </div>
                    <div>
                        <p style="font-size: 20px;color: dimgray;">您的入驻申请已提交！请等待审核结果！</p>
                        <p>工作人员会在1~3个工作日内对您的信息进行审核，请耐心等待。</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>