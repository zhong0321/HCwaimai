<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="cp" value="<%=basePath%>" />
<!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>豪吃外卖</title>
	<link rel="stylesheet" href="${cp}static/css/page/customer/order/list.css">
	<link rel="stylesheet" href="${cp}static/css/module/order/order_n.css">
	<link rel="stylesheet" href="${cp}static/css/module/order/vendor.css">
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<script type="text/javascript">
		function userOrderDetail(id){
			location.href="order/showOrderDetails/"+id;
		}
		
		//保存评价
		function saveComment(id,dom){
			var commentlv=$(dom).parent().prev().find(".commentlv").val();
			var description=$(dom).parent().prev().find("#description").val();
			$.ajax({
				   type: "POST",
				   url: "/waimaiSys/order/addComment",
				   data: {"id":id,"commentlv":commentlv,"description":description},
				   success: function(obj){
					   if(obj==1){
					   		alert("评价成功");
					   }else{
					   		alert("订单完成超过一周，评价已关闭，下次请记得早点评价哦～");
					   }
					   $("#addCommentDiv").css({"display":"none"});
					   location.reload();
				   }
			});
			
		}
		
		//点击去评价
		function qupingjia(){
			$("#addCommentDiv").css({"display":"block"});
		}
		
		//关闭
		function closeDiv(){
			$("#addCommentDiv").css({"display":"none"});
		}
	</script>
</head>
<body>
	<div class="triffle" id="triffle"></div>
	<div class="wrapper">
		<c:import url="header.jsp"></c:import>
		<div class="page-wrap">
			<div class="inner-wrap">
				<div class="orders-cont clearfix">
					<div class="orders-tab fl">
						<span href="javascript:;" class="tab">
							<ul <c:if test="${now!=0}">style="display: none;"</c:if> >
								<li>
									<a href="${cp}order/showOrder" 
									class="borderradius-1 order-today active"><i></i>当前订单</a></li>
							</ul> </span> <span href="javascript:;" class="tab">
							<ul <c:if test="${now!=0}">style="background: #fafafa;"</c:if> >
								<li><a href="${cp}order/historyOrders"
									class="borderradius-1 my-account "><i></i>历史订单</a></li>
								
							</ul> </span>
					</div>

					<div class="orders-list" <c:if test="${now==2}">style="display: none;"</c:if> >

						<div class="order-header" style="display: inline-block; ">
							<span class="oh-content" style="width: 480px;">订单内容</span><span class="oh-phone">商家电话</span><span
								class="oh-money">支付金额</span>
						</div>

						<div data-sid="3" class="order-v" data-orderphone="18084842032"
							data-viewid="3570502901908849" data-status="8" data-shipping="商家"
							data-qid="">
							<div class="brief-intro j-toggle-content ">

								<div class="brief-intro-topconsole fr"></div>

								<a href="" target="_blank" class="avatar fl" data-poi-id="144866890584905982" data-pv-flag="1"> 
									<img class="scroll-loading" src="${cp}static/images/${store.storeImg}" data-max-height="70"> 
								</a>
								<div class="content">
									<div class="rest-name clearfix">
										<a target="_blank" href="" class="ca-deepgrey j-poi-name" data-pv-flag="1"> 
											<span class="poi-name">${store.storeName}</span> 
										</a> 
										<span class="order-total">${store.storePhone}</span> 
										<span class="order-money-num">¥ ${order.totalMoney}</span>
									</div>
									<div class="rest-detail">
										<%-- <span class="order-total">${order.totalMoney}</span> --%> 
										<span class="order-id" style="width: 320px;">订单号：${order.orderNumber}</span>
									</div>
								</div>
							</div>

							<div class="detail-intro clearfix " id="j-shown-order">
								<div class="auto-confirm-box">
									<p class="ct-lightgrey">
										商家没有送餐？您可以致电客服<span class="cc-lightred-new"> 10109777 </span>或<a
											href="https://waimai.meituan.com/help/feedback"
											target="_blank" class="cc-lightred-new"> 投诉商家</a>。<br>（本订单已超过24小时，自动完成。）
									</p>
								</div>
								<div class="fl dishes dishes-higher">
									<div class="dish-title">订单详情</div>
									<div class="list">
										<div class="dish-list">
											<script type="text/template" id="oflist-3570502901908849">
          									{"1704415611": {"name": "狮子头番茄套餐", "score": 0}}
          									</script>
          									<c:forEach items="${orderDetail}" var="od">
												<div class="field clearfix">
													<div class="fl">
														<div class="food-na">${od.foodName}</div>
													</div>
													<span class="food-count">${od.count}</span> <span class="fr food-pri"><i>¥</i>${od.cost}</span>
												</div>
          									</c:forEach>
											<!-- <div class="field clearfix">
												<span class="fl classify">包装费：</span> <span
													class="fr box-cost">¥1.5</span>
											</div> -->
											<div class="field clearfix">
												<span class="fl classify">配送费：</span> <span
													class="fr delivery-cost">¥ ${order.disMoney}</span>
											</div>
										</div>
										<div class="food-total-info">
											实际支付：<i>¥</i><span>${order.totalMoney}</span>
										</div>
									</div>
									<div class="contact">
										<p>地址：${order.orderAddress}</p>
										<!-- <p>姓名：钟雪(女士)</p>
										<p>电话：18084842032</p> -->
										<p>备注：${order.orderRemarks}</p>
									</div>
									<div class="statement">
										<p>商家客服电话：01069258366/4001003109/13521764535</p>
										<p>本餐厅所列商家所有信息、服务均来自合作方，其信息的真实性、准确性、合法性和服务的质量由信息拥有者（商家）负责。</p>
									</div>
								</div>
								<div class="order-content">
									<div class="procedure">
										<div class="pro-order-status">订单状态</div>
										<div class="fl process-bar">
											<c:if test="${order.orderState>=1 && order.orderState<=13}">
												<i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState>=2 && order.orderState<=7}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState>=3 && order.orderState<=7}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState>=4 && order.orderState<=7}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState>=5 && order.orderState<=7}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState==6 && order.orderState==7}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState>=12 && order.orderState<=13}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
											<c:if test="${order.orderState==13}">
												<i class="i-orderarrow"></i> <i class="icon i-orderok"></i> 
											</c:if>
										</div>
										<div class="fl tips">
											<c:if test="${order.orderState>=1 && order.orderState<=13}">
												<div class="step-2">
													<!-- <span class="fr t-2">2019-05-14 12:50</span> -->
													<p class="bold">支付成功，等待商家接单</p>
												</div>
											</c:if>
											<c:if test="${order.orderState>=2 && order.orderState<=7}">
												<div class="step-3 ">
													<!-- <span class="fr t-3">2019-05-14 12:50</span> -->
													<p class="bold">商家接单制作中，等待外卖员抢单</p>
												</div>
											</c:if>
											<c:if test="${order.orderState>=3 && order.orderState<=7}">
												<div class="step-4 ">
													<span class="fr t-delivery"></span>
													<p class="bold">外卖员正在取餐</p>
												</div>
											</c:if>
											<c:if test="${order.orderState>=4 && order.orderState<=7}">
												<div class="step-1 ">
													<!-- <span class="fr t-1">2019-05-14 12:50</span> -->
													<p class="bold">外卖员正在送餐</p>
												</div>
											</c:if>
											<c:if test="${order.orderState>=5 && order.orderState<=7}">
												<div class="step-finish">
													<span class="fr t-finish" <c:if test="${order.orderState!=5}">style="display: none;"</c:if> ><a href="javascript:void(0);" onclick="qupingjia();">去评价</a></span>
													<p class="bold">订单完成</p>
													<%-- <p class="sub"><a href="${cp}">去评价</a></p> --%>
													<!-- <p class="sub">订单完成超过一周，评价已关闭，下次请记得早点评价哦～</p> -->
												</div>
											</c:if>
											<c:if test="${order.orderState==6}">
												<div class="step-1 ">
													<!-- <span class="fr t-1">2019-05-14 12:50</span> -->
													<p class="sub">已评价</p>
												</div>
											</c:if>
											<c:if test="${order.orderState==7}">
												<div class="step-1 ">
													<!-- <span class="fr t-1">2019-05-14 12:50</span> -->
													<p class="sub" >订单完成超过一周，评价已关闭，下次请记得早点评价哦～</p>
												</div>
											</c:if>
											<c:if test="${order.orderState>=12 && order.orderState<=13}">
												<div class="step-1 ">
													<!-- <span class="fr t-1">2019-05-14 12:50</span> -->
													<p class="bold">商家已拒单</p>
												</div>
											</c:if>
											<c:if test="${order.orderState==13}">
												<div class="step-1 ">
													<!-- <span class="fr t-1">2019-05-14 12:50</span> -->
													<p class="bold">退款成功</p>
												</div>
											</c:if>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				
				 
					<div style="overflow: auto; height: 620px" class="orderListHistory" <c:if test="${now==1 || now==0}">style="display: none;"</c:if> >
						<ul>
							<c:forEach items="${orderList}" var="order">
							<li onclick="userOrderDetail('${order.id}');">
	                            <div class="orderTitle">
	                            	<div class="orderTitle_left">
	                            		<span><img src="${cp}static/images/${order.storeImg}" width="70" height="50"></span>
	                            	</div>
	                            	<div class="orderTitle_right">
	                            		<div class="top">
	                            			<a href="${cp}/restaurant/findAll/${order.storeId}" style="font-size: 17px;width: 30%">${order.storeName}  > </a>
	                            			<span style="color: black;width: 30%">总价：￥${order.totalMoney}</span>
	                            			<c:if test="${order.orderState==5}"><span>已完成</span></c:if>
	                            			<c:if test="${order.orderState==6}"><span>已评价</span></c:if>
	                            			<c:if test="${order.orderState==7}"><span>已自动评价</span></c:if>
	                            			<c:if test="${order.orderState==13}"><span>已退款</span></c:if>
	                            			<!-- <a href="">订单详情 </a> -->
	                            		</div>
	                            		<div class="bottom" >
		                            		<span>
		                            			<fmt:formatDate value="${order.orderTime}" type="BOTH" />
		                            		</span>
		                            		<span style="width: 60%">订单号：${order.orderNumber}</span>
		                            		
	                            		</div>
	                            		
	                            	</div>
	                            </div>
	                        </li>
	                        </c:forEach>
						</ul>
					</div>
					
				</div>
				<div id="anti_token"
					data-token="MfyoYCwPbTi3t8oSypDcXzm82YHr07h7h3POp1KfHHkIL3rbR4rugHois+00gVju"></div>
			</div>
		</div>
		
		<!-- 评价 -->
	<span id="addCommentDiv" style="display: none;" >
	<div style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; z-index: 1006;"></div>
    <div class="addressdialog" style="z-index: 1007; left: 460px; top: 150px; position: fixed;width: 50%; height: 50%;background:white;">
    	<div class="addressdialog-close" onclick="closeDiv();"></div>
    	<div class="addressdialog-header">添加评价</div>
    	<div class="addressdialog-content">
    		<div class="addressform" style="padding: 5px 20px;">
	    		<form id="addressForm" method="post" action="">
		    		<div class="addressformfield">
		    			<label>评分</label>
		    			<select name="commentlv" class="commentlv" style="width: 100px;">
		    				<option value="10">10</option>
		    				<option value="9">9</option>
		    				<option value="8">8</option>
		    				<option value="7">7</option>
		    				<option value="6">6</option>
		    				<option value="5">5</option>
		    				<option value="4">4</option>
		    				<option value="3">3</option>
		    				<option value="2">2</option>
		    				<option value="1">1</option>
		    			</select>
		    		</div>
		    		<div class="addressformfield">
		    			<label>评价内容</label>
		    			<textarea rows="5" cols="70" id="description" name="description" style="overflow: auto;resize:none;"></textarea>
		    		</div>
		    		
		    	</form>
		    	<div class="addressform-buttons">
		    		<button onclick="saveComment('${order.id}',$(this));">保存</button>
		    		<button onclick="closeDiv();">取消</button>
		    	</div>
		    </div>
	   </div>
   </div>
   </span>
   
   
		<c:import url="footer.jsp"></c:import>

	</div>
</body>
</html>