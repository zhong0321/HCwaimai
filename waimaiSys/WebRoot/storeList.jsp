<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>豪吃外卖</title> 
    <link rel="stylesheet" href="${cp}static/css/store/store.css">
    <script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
    
    <audio id="notice" loop="loop">
	    <source src="${cp}static/mp3/newOrder.mp3" type="audio/mpeg" />
	</audio>
    <script type="text/javascript">
    var storeId=${store.id};
    
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

    websocket.onmessage = function (event) {//event为storeId
        if(storeId==event){
	        document.getElementById('notice').play();
     		alert("您有新订单了！");
     		location.reload();
        
        }
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
        
    </script>
</head>
<body>
    <!-- <header>
        <div class="storeName">一只羊</div>
        <div class="storeInfo">sidufisjf</div>
    </header> -->
    <!-- <div class="bottom"> -->
        <div class="left">
            <dl class="listAll">
                <dt class="listTitle">
                    <img src="images/shezhi4646846545.png" alt="" width="20px;" height="20px;"/>
                    <span>店铺设置</span>
                </dt>
                <dd class="listContext">
                    <a href="">消息中心</a>
                </dd>
                <dd class="listContext">
                    <a href="">账号设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">系统设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">门店管理</a>
                </dd>
            </dl>
            <dl class="listAll">
                <dt class="listTitle">
                    <img src="images/shezhi4646846545.png" alt="" width="20px;" height="20px;"/>
                    <span>商品管理</span>
                </dt>
                <dd class="listContext">
                    <a href="">消息中心</a>
                </dd>
                <dd class="listContext">
                    <a href="">账号设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">系统设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">门店管理</a>
                </dd>
            </dl>
            <dl class="listAll">
                <dt class="listTitle">
                    <img src="images/shezhi4646846545.png" alt="" width="20px;" height="20px;"/>
                    <span>订单管理</span>
                </dt>
                <dd class="listContext">
                    <a href="">消息中心</a>
                </dd>
                <dd class="listContext">
                    <a href="">账号设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">系统设置</a>
                </dd>
                <dd class="listContext">
                    <a href="">门店管理</a>
                </dd>
            </dl>
        </div>
    <!-- </div> -->
</body>
</html>