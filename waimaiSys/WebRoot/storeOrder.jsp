<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title> 
    <link rel="stylesheet" href="/waimaiSys/static/css/store/storeOrder.css">
	<script type="text/javascript" src="/waimaiSys/static/js/lib/jquery.js"></script>
	<script type="text/javascript" src="/waimaiSys/static/js/store/storeOrder.js"></script>
	<style type="text/css">
		.now{
		border-bottom:#464759 3px solid;
		}
	</style>
</head>
<body>
    <header>
        <div class="storeName">${store.storeName} </div>
    </header>
    <div class="bottom">
        <%@include file="storeList.jsp" %>
        <div class="right"> 
			<div class="order_nav">
                <ul>
                
                    <li <c:if test="${empty now}">class="now"</c:if> ><a href="../showStoreOrder/99">全部订单</a></li>
                    <li <c:if test="${now==1}">class="now"</c:if>  ><a href="../showStoreOrder/3" >新订单</a></li>
                    <li <c:if test="${now==5}">class="now"</c:if> ><a href="../showStoreOrder/5" >已完成</a></li>
                    <li <c:if test="${now==13}">class="now"</c:if> ><a href="../showStoreOrder/13" >已退款</a></li>
                </ul>
            </div>
            <div class="order_content">
				<ul>
                    <c:forEach items="${order}" var="order">
                        <li <c:if test="${order.orderState==0}">style="display: none;"</c:if> >
                            <div class="orderTitle">

                                <span style="width: 30%;">订单号：${order.orderNumber}</span>
                                <span style="width: 5%;">￥${order.totalMoney}</span>
                                <span>下单时间:<fmt:formatDate value="${order.orderTime}" type="BOTH" /></span>
                                <span style="width: 300px; display: flex; justify-content: space-between;">

	                                <c:if test="${order.orderState==1}"><span>未接单</span></c:if> 
	                                <c:if test="${order.orderState==2}"><span>等待外卖员接单</span></c:if>
	                                <c:if test="${order.orderState==3}"><span>等待外卖员上门取餐</span></c:if>
	                                <c:if test="${order.orderState==4}"><span>已送出</span></c:if>
	                                <c:if test="${order.orderState==5}"><span>已完成</span></c:if>
	                                <c:if test="${order.orderState==13}"><span>已退款</span></c:if>
	                                <c:if test="${order.orderState==1}">
	                                	<a href="../sureOrder/${order.id}">确认接单</a>
	                                	<a href="javascript:void(0)" onclick="refuseOrder('${order.id}','${order.storeId}');">拒单</a>
	                                </c:if>
                                </span>


                                <a href="#" onclick="showOrderDetails('${order.id}',$(this));" id="xiangqing">详情</a>
                                <a href="#" onclick="closeOrderDetails($(this));" id="shouqi" style="display: none;" >收起</a>
                            </div>
                            
                            <div class="hiddenContent" style="display: none;" >
                                <div class="orderDetail">
                                	<ul>
                                		<li>
                                			
                                		</li>
                                	</ul>
                                    <div class="peisongInfo">
                                        <span>配送费</span>
                                        <span>￥${order.disMoney}</span>
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
		</div>
    </div>
</body>
</html>