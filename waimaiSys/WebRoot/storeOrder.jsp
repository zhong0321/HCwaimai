<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title> 
    <link rel="stylesheet" href="/waimaiSys/static/css/store/storeOrder.css">
	<script type="text/javascript" src="/waimaiSys/static/js/lib/jquery.js"></script>
	<script type="text/javascript" src="/waimaiSys/static/js/store/storeOrder.js"></script>
</head>
<body>
    <header>
        <div class="storeName">${store.storeName} </div>
        <div class="storeInfo">sidufisjf</div>
    </header>
    <div class="bottom">
        <%@include file="storeList.jsp" %>
        <div class="right">
			<div class="order_nav">
                <ul>
                    <li style="border-bottom: #464759 3px solid;"><a href="../showStoreOrder/99">全部订单</a></li>
                    <li><a href="../showStoreOrder/3" onclick="navStyle($(this))">待接单</a></li>
                    <li><a href="../showStoreOrder/4" onclick="navStyle($(this))">未送出</a></li>
                    <li><a href="../showStoreOrder/5" onclick="navStyle($(this))">未送达</a></li>
                    <li><a href="../showStoreOrder/7" onclick="navStyle($(this))">已完成</a></li>
                    <li><a href="../showStoreOrder/9" onclick="navStyle($(this))">已退款</a></li>
                </ul>
            </div>
            <div class="order_content">
                    <ul>
                    <c:forEach items="${order}" var="order">
                        <li>
                            <div class="orderTitle">
                                <span>订单号：${order.orderNumber}</span>
                                <span>￥${order.totalMoney}</span>
                                <c:if test="${order.orderState==3}"><span>未接单</span></c:if>
                                <c:if test="${order.orderState==4}"><span>未送出</span></c:if>
                                <c:if test="${order.orderState==5}"><span>未送达</span></c:if>
                                <c:if test="${order.orderState==7}"><span>已完成</span></c:if>
                                <c:if test="${order.orderState==9}"><span>已退款</span></c:if>
                                <c:if test="${order.orderState==3}"><a href="../sureOrder/${order.id}">确认接单</a></c:if>
                                <span>下单时间:${order.orderTime}</span>
                                <a href="#" onclick="showOrderDetails('${order.id}',$(this));" id="xiangqing">详情</a>
                                <a href="#" onclick="closeOrderDetails($(this));" id="shouqi" style="display: none;" >收起</a>
                            </div>
                            <div class="hiddenContent" style="display: none;" >
                                <div class="orderDetail">
                                	<ul>
                                		<li>
                                			<span>红烧狮子头</span>
	                                        <span>1</span>
	                                        <span>￥21</span>
                                		</li>
                                	</ul>
                                    <!-- <div class="caipinInfo">
                                        
                                    </div>
                                    <div class="caipinInfo">
                                        <span>红烧狮子头</span>
                                        <span>1</span>
                                        <span>￥21</span>
                                    </div> -->
                                    <div class="peisongInfo">
                                        <span>配送费</span>
                                        <span>￥${order.distributionMoney}</span>
                                    </div>
                                    <div class="totalCost">
                                        <span>总价</span>
                                        <span>￥${order.totalMoney}</span>
                                    </div>
                                </div>
                                <div class="qishouInfo" <c:if test="${order.dmName==null}">style="display: none;"</c:if> >
                                    <span>配送员</span><span>${order.dmName}</span>
                                </div>
                                <div class="addressInfo">
                                    <span>收货人</span>
                                    <span>${order.orderAddress}</span>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
            </div>
            <div class="orderPages">

            </div>
		</div>
    </div>
</body>
</html>