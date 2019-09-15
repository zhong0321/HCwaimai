<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String bath = request.getServerName() + ":" + request.getServerPort()+ path;
%>
<c:set var="cp" value="<%=basePath%>" /><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>豪吃快送</title>
    <script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
    <style type="text/css">
	    html,body {
	      width: 100%;
	      height: 100%;
	      overflow: none;
	    }
	    #container{
		    width: 100%;
		    height: 30%;
	    }
        #panel {
            background-color: white;
            max-height: 90%;
            width: 100%;
            padding-bottom: 2px;
        }
        #panel .amap-call {
            background-color: #009cf9;
            border-top-left-radius: 4px;
   	        border-top-right-radius: 4px;
   	        display: none;
        }
        #panel .amap-lib-driving {
	        border-bottom-left-radius: 4px;
   	        border-bottom-right-radius: 4px;
        }
         *{
            margin: 0px;
            padding: 0px;
        }
        li{
            list-style-type: none;
        }
        body{
            background: #f3f0f7;
        }
        header{
            background: #029ff9;
            padding: 0.6rem 0rem;
        }
        header div{
            display: flex;
            justify-content: space-between;
            height: 2em;
            line-height: 2em;
            font-size: 1.4rem;
            color: white;
        }
        header div span:FIRST-CHILD{
        	padding-top: 5px;
        }
        .content{
        	
        	overflow: auto;
        	font-size: 1.2rem;
        	height: 64%;
        }
        .orderDetailsDiv{
        	background: white;
        }
        .orderDetail ul li{
			display: flex;
		    justify-content: space-between;
		    padding: 2px 15px;
		    border: none;
		    height: 35px;
		    line-height: 35px;
		}
		.orderDetail div{
		    padding: 0px 15px;
		    display: flex;
		    justify-content: space-between;
		    height: 40px;
		    line-height: 40px;
		}
		.orderDetail{
		    padding: 5px 0px;
		    background: #FFFBF0;
		}
		.orderTitle{
			
		    height: 40px;
		    line-height: 40px;
		    background: gray;
		    padding: 0rem 2rem;
		    color: white;
		}
    </style>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Riding,AMap.Geocoder"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>
	<header>
        <div class="dmTitle">
            <span><img onclick="backLoad();" src="${cp}static/files/back357841524684.png" alt="" width="20px" height="20px"/></span>
                <span>
                   	 骑行路线
                </span>
            <span></span>
        </div>
    </header>
    <div id="container"></div>
    
    <input id="sta" type="hidden" value="${sta}"/>
    <input id="commonlyAddress" type="hidden" value="${deliveryMan.commonlyAddress}"/>
    <input id="coordinate" type="hidden" value="${order.coordinate}"/>
    <input id="orderAddress" type="hidden" value="${order.orderAddress}"/>
    
    <div class="content">
    	<div class="orderDetailsDiv">
    		<div class="orderTitle">
    			<span>订单详情</span>
    		</div>
	    	<div class="orderDetail">
	    		<ul>
	    			<c:forEach items="${orderDetailList}" var="orderDetail">
	    				<li>
				            <span>${orderDetail.foodName}</span>
				            <span>${orderDetail.count}</span>
				            <span>￥${orderDetail.cost}</span>
	                	</li>
	    			</c:forEach>
                </ul>
	            <div class="totalCost">
	                <span>总价</span>
	                <span>￥${order.totalMoney}</span>
	            </div>
	            <div class="totalCost">
	                <span>订单号：${order.orderNumber}</span>
	            </div>
	        </div>
	    </div>
	    <div id="panel"></div>
    </div>
	<script type="text/javascript">
	    var map = new AMap.Map("container", {
		    resizeEnable: true,
		    center: [116.397428, 39.90923],//地图中心点
		    zoom: 13 //地图显示的缩放级别
		});
		//骑行导航
		var riding = new AMap.Riding({
		    map: map,
		    panel: "panel" 
		}); 
	    
	    var sta=$("#sta").val();
	    var commonlyAddress=$("#commonlyAddress").val();//外卖员地址
	    var coordinate=$("#coordinate").val();//商家坐标
	    var orderAddress=$("#orderAddress").val();//订单收货信息
	    if(sta==1){//取餐
	    	AMap.plugin('AMap.Geocoder', function() {
			  var geocoder = new AMap.Geocoder({
			    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
			    city: "010",
			  });
			  
			  geocoder.getLocation(commonlyAddress, function(status, result) {
		         if (status === 'complete'&&result.geocodes.length) {
		             dmPoint = result.geocodes[0].location;//外卖员坐标
		             var dPoint=dmPoint.toString().split(",");//外卖员坐标数组
					 var sPoint=coordinate.split(",");//商家坐标数组
		             //取餐
					 riding.search([dPoint[0],dPoint[1]],[sPoint[0],sPoint[1]], function(status, result) {// result即是对应的骑行路线数据信息
					    if (status === 'complete') {
				            log.success('绘制驾车路线完成');
				        } else {
				            log.error('获取驾车数据失败：' + result);
				        }
					 });
		         }else{
		             log.error('根据地址查询位置失败');
		         }
		       });
			});
	    }else{
	    	var userAddressInfo=orderAddress.split(" ");//收货信息
			var userAddress=userAddressInfo[4];//收货地址
	    	AMap.plugin('AMap.Geocoder', function() {
			  var geocoder = new AMap.Geocoder({
			    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
			    city: "010",
			  });
			  
			  geocoder.getLocation(userAddress, function(status, result) {
		         if (status === 'complete'&&result.geocodes.length) {
		             userPoint = result.geocodes[0].location;//用户坐标
		             var uPoint=userPoint.toString().split(",");//用户坐标数组
					 var sPoint=coordinate.split(",");//商家坐标数组
		             //送餐
					 riding.search([sPoint[0],sPoint[1]],[uPoint[0],uPoint[1]], function(status, result) {// result即是对应的骑行路线数据信息
					    if (status === 'complete') {
				            log.success('绘制驾车路线完成');
				        } else {
				            log.error('获取驾车数据失败：' + result);
				        }
					 });
		         }else{
		             log.error('根据地址查询位置失败');
		         }
		       });
			});
	    }
	    
	    //回退页面
	    function backLoad(){
	    	history.back();
	    }
	</script>
</body>
</html>