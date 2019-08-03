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
                                <input name="storePhone" value="${store.storePhone}" type="text"/>
                                <input name="storePassword" value="${store.storePassword}" type="text"/>
                                <input name="id" value="${store.id}" type="text"/>
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
                                <input size="60" name="file" type="file" class="fileUpload"/>
                                <!-- <input size="60" type="text" id="storeImg" name="storeImg" value=""/> -->
                                <div class="image-holder"></div>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>起送费</span>
                            </td>
                            <td>
                                <input size="60" type="text" name="startMoney" id="startMoney" placeholder="请输入起送费"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>配送费</span>
                            </td>
                            <td>
                                <input size="60" name="distributionMoney" id="distributionMoney" type="text" placeholder="请输入配送费"/>
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
								<input id="address" name="storeAddress" type="text"/> 
								<input id="lnglat" name="coordinate" type="text">
                            </td>
                        </tr>
                        <tr class="buttonTr">
                            <td></td>
                            <td>
                                <span style="width: 200px;padding-right: 200px;"></span>
                                <span><button style="background: #08C1AE;" onclick="formSubmit();">下一步</button></span>
                            </td>

                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${cp}static/js/store/filesUpload.js"></script>
    <script type="text/javascript">
	//提交表单之前判断是否为空
	function checkNotNull(){
		var storeName=$("#storeName").val();
		/* var storeImg=$("#storeImg").val(); */ 
		var startMoney=$("#startMoney").val();
		var distributionMoney=$("#distributionMoney").val();
		var address=$("#address").val();
		var lnglat=$("#lnglat").val();
		if(storeName!=null && storeName!="" && startMoney!=null && startMoney!="" &&distributionMoney!=null && distributionMoney!="" &&address!=null && address!="" &&lnglat!=null && lnglat!="" ){
			return true;
		}else{
			//ShowDiv_1('MyDiv1','fade1','除了商品描述以外的，其他均为必填项<br/>请填写完整的商品信息');
			return false;
		}
	}
	
	function formSubmit(){
		if(checkNotNull()==true){
			$("#storeForm").submit();
		}else{
			alert("请填写完整的信息！");
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