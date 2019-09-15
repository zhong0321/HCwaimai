<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>输入提示后查询</title>
<!-- <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css" /> -->
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.data.min.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.data.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.min.js"></script>
<link rel="stylesheet" href="static/css/getAddress/index.css"></link>
</head>
<body>
	<div id="myPageTop"class="myPageTop">
		<h1>地址:</h1>
		<form id="searchForm" action="index/find" method="post">
			<table>
				<tr>
					<td>
						<span data-toggle="distpicker"> 
						<select class="add" id="province" name="province" data-province=""></select> 
						<select class="add" id="city" name="city" data-city=""></select> 
						<!-- <select id="district" name="district" data-district=""></select>  -->
						</span> 
						<input id="tipinput" name="tipinput" autocomplete="off" class="tipinput" placeholder="输入地址搜索美食" /> 
						<input id="address" name="address" type="hidden"/>
						<input id="lnglat" name="lnglat" type="hidden">
						<input type="button" value="搜索" class="button" onclick="search(this);" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script type="text/javascript" src="static/js/getAddress/index.js"></script>

</body>
</html>