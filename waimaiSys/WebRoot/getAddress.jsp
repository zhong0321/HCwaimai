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
<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css" />
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.data.min.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.data.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.js"></script>
<script type="text/javascript" src="static/js/dist/distpicker.min.js"></script>
</head>
<body>

	<div id="myPageTop">
		<form id="searchForm" action="index/find" method="post">
			<table>
				<tr>
					<td>
						<span data-toggle="distpicker"> 
						<select class="add" id="province" name="province" data-province=""></select> 
						<select class="add" id="city" name="city" data-city=""></select> 
						<!-- <select id="district" name="district" data-district=""></select>  -->
						</span> 
						<input id="tipinput" name="tipinput" placeholder="输入地址搜索美食" /> 
						<input id="address" name="address" type="hidden"/> 
						<input id="lnglat" name="lnglat" type="hidden"> 
						<input type="button" value="搜索" onclick="search();" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- <div id="container" style="width:60%;height: 60%;"></div> -->
	<script type="text/javascript">
	
    function search(){
 		var tipinput=$("#tipinput").val();
 		if(tipinput!=null&&tipinput!=""){
 			$("#searchForm").submit();
 		}
 	}

    //地图加载
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    
    var getCity=$("#city").val();
    $(function(){
    	//下拉框改變事件
    	$(".add").change(function(){
    		var tipinput=$("#tipinput").val(" ");
    		getCity=$("#city").val();
    		var autoOptions = {
		    	city: getCity,
		        input: "tipinput"
		    };
		    var auto = new AMap.Autocomplete(autoOptions);
		    var placeSearch = new AMap.PlaceSearch({
		    	city: "北京",
		    	citylimit: true,
		        map: map
		    }); 
		    AMap.event.addListener(auto, 'select', function(e){
		    	document.getElementById('lnglat').value =e.poi.location;
		    	getAddress();
		  	}); 
    	});
    });
    
    //输入提示
    var autoOptions = {
    	city: "北京",
        input: "tipinput"
    };
    var auto = new AMap.Autocomplete(autoOptions);
    var placeSearch = new AMap.PlaceSearch({
    	city: "北京",
    	citylimit: true,//
        map: map
    }); 
    //获取选中地址的信息，经纬度
    AMap.event.addListener(auto, 'select', function(e){
    	document.getElementById('lnglat').value =e.poi.location;
    	getAddress();
  	});
    
    //逆地理编码
    function getAddress(){
    AMap.plugin('AMap.Geocoder', function() {
	  var geocoder = new AMap.Geocoder({
	    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
	    city: getCity 
	  });
	 
	  var lnglat=$("#lnglat").val();
	
	  geocoder.getAddress(lnglat, function(status, result) {
	    if (status === 'complete' && result.info === 'OK') {
	        // result为对应的地理位置详细信息
	        var address = result.regeocode.formattedAddress;
            document.getElementById('address').value = address;
	    }
	  });
	});
   }
    
    
</script>
</body>
</html>