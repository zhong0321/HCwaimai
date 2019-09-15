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
	<link rel="stylesheet" href="${cp}static/css/dm/dmOrder.css"/>
    <title>豪吃外卖</title> 
    <script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
    <script type="text/javascript" src="${cp}static/js/dm/dmOrder.js"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Riding,AMap.Geocoder"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <audio id="notice" loop="loop">
	    <source src="${cp}static/mp3/newOrder.mp3" type="audio/mpeg" />
	</audio>
	<script type="text/javascript">
		<%-- /*webSocket-------开始*/
		var websocket = null;
		if('WebSocket' in window) {
		    websocket = new WebSocket('ws://<%=bath%>/websocket');
		}else {
		    alert('该浏览器不支持websocket!');
		}
		
		websocket.onopen = function (event) {
		    console.log('建立连接');
		}
		
		websocket.onclose = function (event) {
		    console.log('连接关闭');
		}
		
		websocket.onmessage = function (event) {//event为订单id
			$.ajax({
				   type: "POST",
				   url: "dmOrder/findOrderDM",
				   data: {"id":event},
				   success: function(obj){
					   	if(obj!=null){
					   		document.getElementById('notice').play();
		 					alert("您有新任务了，快来抢单吧");
		 					location.reload();
					   	}
				   }
			});
		    /* console.log('收到消息:' + event.data);
		    document.getElementById('notice').play();
		 	alert("您有新任务了，快开抢单吧");
		    location.reload(); */
		    	/* $(function(){
		       		ShowDiv_1('MyDiv1','fade1','您有新订单了！');
		       		$("#queding").click(function(){
		       			CloseDiv_1('MyDiv1','fade1');
		       			location.reload();
		       		});
		       		
		    	}); */
		    
		}
		websocket.onerror = function () {
		    alert('websocket通信发生错误！');
		}
		
		window.onbeforeunload = function () {
		    websocket.close();
		}
		/*webSocket-------结束*/ --%>
		
		
		
		
		
		
		var map = new AMap.Map("container", {
		    resizeEnable: true,
		    center: [116.397428, 39.90923],//地图中心点
		    zoom: 13 //地图显示的缩放级别
		});
		var distance;
		var time;
		//骑行导航
		var riding = new AMap.Riding({
		    map: map,
		    panel: "panel" 
		}); 
		
		
		var dmPoint;		
		$(function(){
			var dmAddress=$("#dmAddress").val();//外卖员常用地址
			AMap.plugin('AMap.Geocoder', function() {
			  var geocoder = new AMap.Geocoder({
			    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
			    city: "010",
			  });
			  
			  geocoder.getLocation(dmAddress, function(status, result) {
		         if (status === 'complete'&&result.geocodes.length) {
		             dmPoint = result.geocodes[0].location;
		             adg();
		         }else{
		             log.error('根据地址查询位置失败');
		         }
		       });
			});
			function adg(){
				$(".storePoint").each(function(index,dom){
					var userAddressInfo=($(dom).next().next().val()).split(" ");//收货信息
					var userAddress=userAddressInfo[4];//收货地址
					$(dom).next().next().next().html(userAddress);//写入用户地址
					var userPoint;
					var uPoint;
					AMap.plugin('AMap.Geocoder', function() {
					  var geocoder = new AMap.Geocoder({
					    city: "010",// city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
					  });
					  geocoder.getLocation(userAddress, function(status, result) {
			            if (status === 'complete'&&result.geocodes.length) {
			                userPoint = result.geocodes[0].location;
			               	var dPoint=dmPoint.toString().split(",");//外卖员坐标数组
							var sPoint=($(dom).val()).split(",");//商家坐标数组
							var uPoint=userPoint.toString().split(",");//用户坐标数组
							
							//外卖员到商家
							riding.search([dPoint[0],dPoint[1]],[sPoint[0],sPoint[1]], function(status, result) {// result即是对应的骑行路线数据信息
							   	distance=result.routes[0].distance;//获取骑行路线的距离
							   	var dis=Math.round((distance/1000) * 10)/10;
							   	$(dom).parent().parent().prev().find(".rightContext span").html(dis+"km"); 
								if(distance>5000){
									$(dom).parents("li").css("display", "none");
								}
							});
							
							//商家到用户
							riding.search([sPoint[0],sPoint[1]],[uPoint[0],uPoint[1]], function(status, result) {// result即是对应的骑行路线数据信息
							   	distance=result.routes[0].distance;//获取骑行路线的距离
							   	var dis=Math.round((distance/1000) * 10)/10;
							   	$(dom).parent().next().find("span").html(dis+"km"); 
							});
			            }else{
			                log.error('根据地址查询位置失败');
			            }
			            
			          });
			          
					});
				});
			}
		});
		
		//抢单按钮单击事件
		function sureQiangDan(dom,id){
			$(dom).parents("li").remove();
			$.ajax({
				   type: "POST",
				   url: "../sureQiangDan",
				   data: {"id":id},
				   success: function(obj){
					   	if(obj==1){
					   		alert("您真棒，这单是您的了！");
					   		
					   	}else{
					   		alert("哎呀，手慢了，订单被别人抢走了");
					   	}
				   }
			});
		}
		
		//确认已取餐
		function sureGetFood(dom,id){
			$.ajax({
				   type: "POST",
				   url: "../sureGetFood",
				   data: {"id":id,"orderState":4,"disMoney":null},
				   success: function(obj){
					   	location.href="../qiangDan/4";
				   }
			});
		}
		
		//确认已送达
		function sureEnding(dom,id,disMoney){
			$(dom).parents("li").remove();
			$.ajax({
				   type: "POST",
				   url: "../sureGetFood",
				   data: {"id":id,"orderState":5,"disMoney":disMoney},
				   success: function(obj){
					   	alert("恭喜您，订单完成啦！");
					   	/* $(".noOrders").css("display", "block"); */
				   }
			});
		}
		
		//刷新订单
		function onloadOrder(){
			location.reload();
		}
	</script>
	<style type="text/css">
		.now{
			border-bottom: 0.1rem white solid;
		}
		#container{
			width: 100%;
			height: 50%;
		}
		 #panel {
            position: absolute;
            /* background-color: white; */
            max-height: 90%;
            overflow-y: auto;
            width: 360px;
        }
        #panel .amap-call {
            background-color: #009cf9;
            border-top-left-radius: 4px;
   	        border-top-right-radius: 4px;
        }
        #panel .amap-lib-driving {
	        border-bottom-left-radius: 4px;
   	        border-bottom-right-radius: 4px;
            overflow: hidden;
        }
	</style>
</head>
<body>
    <header>
        <div class="dmTitle">
            <span>jh</span>
            <span>
                接单中
            </span>
            <span></span>
        </div>
        <div class="dmNav">
            <a id="qiangdan" href="${cp}dmOrder/qiangDan/2" <c:if test="${now==2}">class="now"</c:if> >新任务</a>
            <a id="qvhuo" href="${cp}dmOrder/qiangDan/3" <c:if test="${now==3}">class="now"</c:if> >待取货</a>
            <a id="songhuo" href="${cp}dmOrder/qiangDan/4" <c:if test="${now==4}">class="now"</c:if> >待送达</a>
        </div>
    </header>
    <input type="hidden" id="dmAddress" value="${deliveryMan.commonlyAddress}"/>
    <div class="contents">
    
    <!-- 抢单-------开始 -->
    <c:if test="${now==2}">
    <div class="dmContext_qiangdan">
	    <div class="dmContext_qingdan">
	        <ul>
	        <c:forEach items="${orderList}" var="order">
	            <li>
	                <div class="qiangdan_title">
	                    <div class="lefttitle">
	                        <p class="title_top">￥${order.disMoney}</p>
	                        <p class="title_bottom">本单收入</p>
	                    </div>
	                    <img src="${cp}static/files/shuxian.png" alt="" width="2px" height="55px" style="margin-top: 30px"/>
	                    <div class="righttitle">
	                        <p class="title_top"><%-- ${order.orderTime} --%>12.45</p>
	                        <p class="title_bottom">发单时间</p>
	                    </div>
	                </div>
	                <div class="qiangdan_context">
	                    <div class="context_top" style="border-bottom: solid 1px #CCCCCC">
	                        <div class="leftContext">
	                            <img src="${cp}static/files/qv.png" alt="" width="30px;" height="30px;"/>
	                        </div>
	                        <div class="centerContext">
	                            <p>${order.storeName}</p>
	                            <p class="add2">${order.storeAddress}</p>
	                            
	                        </div>
	                        <div class="rightContext">
	                            <span></span>取货
	                        </div>
	                    </div>
	                    <div class="context_buttom">
	                        <div class="leftContext">
	                            <img src="${cp}static/files/song.png" alt="" width="30px;" height="30px;"/>
	                        </div>
	                        <div class="centerContext">
	                        	<input type="hidden" class="storePoint" value="${order.coordinate}"/>
	                        	<input type="hidden" class="userPoint"/>
	                        	<input type="hidden" class="userAddressInfo" value="${order.orderAddress}"/>
	                            <p></p>
	                        </div>
	                        <div class="rightContext">
	                            <span></span>送货
	                        </div>
	                    </div>
	                    <button onclick="sureQiangDan($(this),'${order.id}');">抢单</button>
	                </div>
	            </li>
	        </c:forEach>
	        </ul>
	        <div class="noOrders" <c:if test="${!empty orderList}">style="display: none;"</c:if> >
			    <img src="${cp}static/files/noOrders5465454.png"/>
			    <p>暂时没有相关订单</p>
			</div>
	    </div>
	    <footer>
	        <button onclick="onloadOrder();">刷新订单</button>
	    </footer>
    </div>
    </c:if>
    <!-- 抢单-------结束 -->
    
    
    <!-- 取餐-------开始 -->
    <c:if test="${now==3}">
    <div class="dmContext_qucan">
        <ul>
        <c:forEach items="${orderList}" var="order">
            <li>
                <div class="qucan_context">
                    <div class="context_top">
                        <div class="leftContext">
                            <img src="${cp}static/files/qv.png" alt="" width="30px;" height="30px;"/>
                        </div>
                        <div class="centerContext">
                             <p>${order.storeName}</p>
	                         <p class="add2">${order.storeAddress}</p>
                        </div>
                        <div class="rightContext">
                        	<a href="${cp}dmOrder/rivingRoute/1/${order.id}">
                        		<img src="${cp}static/files/luxian5451484.png" width="40px;" height="40px;"/>
                        	</a>
                        </div>
                    </div>
                    <button onclick="sureGetFood($(this),'${order.id}','${order.disMoney}');">我已取餐</button>
                </div>
            </li>
        </c:forEach>
        </ul>
        <div class="noOrders" <c:if test="${!empty orderList}">style="display: none;"</c:if> >
		    <img src="${cp}static/files/noOrders5465454.png"/>
		    <p>暂时没有相关订单</p>
		</div>
    </div>
    </c:if>
    <!-- 取餐-------结束 -->
    
    <!-- 送餐-------开始 -->
    <c:if test="${now==4}">
    <div class="dmContext_songcan">
        <ul>
        <c:forEach items="${orderList}" var="order">
            <li>
                <div class="songcan_context">
                    <div class="context_top" style="border-bottom: solid 1px #CCCCCC">
                        <div class="leftContext">
                            <img src="${cp}static/files/qv.png" alt="" width="30px;" height="30px;"/>
                        </div>
                        <div class="centerContext">
                            <p>${order.orderAddress}</p>
                        </div>
                        <div class="rightContext">
                        	<a href="${cp}dmOrder/rivingRoute/2/${order.id}">
                        		<img src="${cp}static/files/luxian5451484.png" alt="" width="40px;" height="40px;"/>
                        	</a>
                        </div>
                    </div>
                    <button onclick="sureEnding($(this),'${order.id}','${order.disMoney}');">确认送达</button>
                </div>
            </li>
        </c:forEach>
        </ul>
        
		<div class="noOrders" <c:if test="${!empty orderList}">style="display: none;"</c:if> >
		    <img src="${cp}static/files/noOrders5465454.png"/>
		    <p>暂时没有相关订单</p>
		</div>
		
		
    </div>
    </c:if>
    
    </div>
    
</body>
	
</html>