<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>" /><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="${cp}static/css/store/storeRegist.css"/>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css" />
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="static/js/dist/distpicker.data.min.js"></script>
	<script type="text/javascript" src="static/js/dist/distpicker.data.js"></script>
	<script type="text/javascript" src="static/js/dist/distpicker.js"></script>
	<script type="text/javascript" src="static/js/dist/distpicker.min.js"></script>
    <style type="text/css">
	.thumb-image{
	 float:left;width:100px;
	 position:relative;
	 padding:5px;
	}
	</style>
</head>
<body>
    <header>
        <div class="logoDiv"></div>
        <div class="username">
            	${store.storePhone}
        </div>
    </header>
    <div class="bottom">
        <div class="content">
            <div class="titleDiv">
                <span>首页 &nbsp; > &nbsp;新建店铺 </span>
            </div>
            <div class="navDiv">
                <div>店铺信息</div>
                <div>资质信息</div>
                <div>完成</div>
            </div>
            <div class="storeInfo">
                <p>带 <span class="xing">*</span> 表格为必填项</p>

                <form action="storeRegist/addStore" method="post" id="storeForm" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>店铺名称</span>
                            </td>
                            <td>
                                <input name="storeName" id="storeName" size="60" type="text" placeholder="请输入店铺名称"/>
                                <input name="storePhone" value="${store.storePhone}" id="storephone" type="hidden"/>
                                <input name="storePassword" value="${store.storePassword}" type="hidden"/>
                                <input name="id" value="${store.id}" type="hidden"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>商家类别</span>
                            </td>
                            <td>
                                <select style="width: 136px;" name="storeType">
                                    <c:forEach items="${storeTypes}" var="st">
                                    	<option value="${st.id}">${st.storeType}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>商家logo</span>
                            </td>
                            <td>
                            <img alt="商家Logo" src="static/images/mrlogo.png" width="100px" height="100px" id="logo">
                                <input size="60" name="file" type="file" class="fileUpload"/>
                                <div class="image-holder"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>起送费</span>
                            </td>
                            <td>
                                <input size="60" type="number" name="startMoney" id="startMoney" min="0" max="999" style="width: 200px;" placeholder="请输入起送费"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>配送费</span>
                            </td>
                            <td>
                                <input size="60" name="distributionMoney" id="distributionMoney" min="0" max="20" type="number" style="width: 200px;"  placeholder="请输入配送费"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>商家区域</span>
                            </td>
                            <td>
                                <span data-toggle="distpicker"> 
								<select class="add" id="province" name="province" data-province=""></select> 
								<select class="add" id="city" name="city" data-city=""></select> 
								<!-- <select id="district" name="district" data-district=""></select>  -->
								</span> 
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>详细地址</span>
                            </td>
                            <td>
                                <input size="60" id="tipinput" name="tipinput" placeholder="请输入详细地址" /> 
								<input id="address" name="storeAddress" type="hidden"/> 
								<input id="lnglat" name="coordinate" type="hidden">
                            </td>
                        </tr>
                        <tr class="buttonTr">
                            <td></td>
                            <td>
                                <span style="width: 200px;padding-right: 200px;"></span>
                                <span><button type="button" style="background: #08C1AE;" onclick="formSubmit();">下一步</button></span>
                            </td>

                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${cp}static/js/store/filesUpload.js"></script>
</body>
</html>