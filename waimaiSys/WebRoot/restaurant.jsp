<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="cp" value="<%=basePath%>" />
<!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>豪吃外卖</title>
	<link rel="stylesheet" href="${cp}static/css/page/restaurant.css">
	<link rel="stylesheet" href="${cp}static/css/module/shopping/cart.css">
	<script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<style type="text/css">
		.order-list .total{
		
		}
		.order-list .delivery-cost{
		
		}
		.order-list .ul{
			position: relative;
			top:-203px;
		}
	</style>
</head>
<body>
	
	<div class="wrapper">
		<c:import url="header.jsp"></c:import>
	</div>

	<div class="page-wrap">
		<div class="inner-wrap">

			<div class="rest-info">

				<div class="right-bar fr clearfix ct-lightgrey">
					<input type="hidden" value="${store.id}" id="storeId"/>
					<div class="fl average-speed">
						<div class="desc">平均送餐时间</div>
						<div class="nu">
							<strong class="mtsi-num">35</strong>分钟
						</div>
					</div>
					<div class="fl ack-ti">
						<div class="desc">起送</div>
						<div class="nu">
							<strong class="mtsi-num">${store.startMoney}</strong>元
						</div>
					</div>
					<div class="fl in-ti">
						<div class="desc">配送费</div>
						<div class="nu">
							<strong class="mtsi-num">${store.distributionMoney}</strong>元
						</div>
					</div>
				</div>
				<div class="details">
					<div class="up-wrap clearfix">
						<div class="avatar fl">
							<img class="scroll-loading" src="${cp}static/images/${store.storeImg}" data-max-width="106" data-max-height="80" style="width: 106px; height: 79.5px;">
						</div>
						<div class="list">
							<div class="na">
								<a href=""> <span>${store.storeName}</span><i class="icon i-triangle-dn"></i> </a>
							</div>
							<div class="stars clearfix" style="margin-top:14px;">
								<!-- <span class="star-ranking fl">
			                    <span class="star-score" style="width: 66px"></span>
					            </span>
					            <span class="fl mark ct-middlegrey">4.5</span> -->
								${store.storeAddress} <br>
							</div>
						</div>
					</div>
				</div>
				<div class="save-up-wrapper">
					<a href="javascript:;" class="save-up j-save-up " data-poiid="144737917011987255">
						<p class="ct-black">收藏本店</p> <i class="icon i-heart-22"></i> 
					</a>
					<p class="cc-lightred-new j-save-up-people"></p>
				</div>
			</div>


			<div class="food-list fl">
				<div class="cate-tab-area">
					<div class="tab-link">
					    <div class="tab-link-inner clearfix">
					      <a href="${cp}restaurant/findAll/${store.id }" class="tab-item active">菜单</a>
					      <a href="${cp}findStor/${store.id }" class="tab-item ">评价</a>
					        <%-- <a href="../../findanqian/${store.id }" class="tab-item  ">食品安全档案</a> --%>
					    </div>
					</div>

					<!-- 菜品分类 -->
					<div class="ori-foodtype-nav clearfix">
						<ul class="clearfix">
							<c:forEach items="${storeFoodTypes}" var="storeFoodTypes">
								<li class="active">
									<a href="javascript:;" class="type" data-anchor="0" title="${storeFoodTypes.foodType}"> 
										<span class="name">${storeFoodTypes.foodType}</span> 
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>

				</div>

				<div class="food-nav">
					<c:forEach items="${storeFoodTypes}" var="storeFoodTypes">

						<div class="title-blank hidden" style="display: none;">
							<span class="tag-na">${storeFoodTypes.foodType}</span>
						</div>

						<div class="category">
							<h3 class="title title-0" title="${storeFoodTypes.foodType}">
								<span class="tag-na">${storeFoodTypes.foodType}</span>
							</h3>
							<div class="pic-food-cont clearfix">
								<c:forEach items="${food}" var="food">
									<div class="j-pic-food pic-food" id="1336169296"  <c:if test="${food.foodTypeId!=storeFoodTypes.foodTypeId}">style="display: none;"</c:if> >
										<div class="avatar" id="gao${food.id}" name="gao${food.id}">
											<img src="${cp}static/images/${food.foodImage}" class="food-shape scroll-loading">
											<div class="description"></div>
										</div>
										<div class="np clearfix">
											<span class="name fl" title="${food.foodName}">${food.foodName}</span>
										</div>
										<div class="sale-info clearfix">
											<div class="sold-count ct-lightgrey"></div>
										</div>

										<div class="labels clearfix">
											<a onclick="addFood($(this),'${food.id}','${food.foodName}','${food.storeId}','${food.price}');" class="add fr icon i-addcart j-addcart" <c:if test="${empty user}">style="display: none;"</c:if> >
												<img src="${cp}static/files/tianjiafood.png" style="height: 24px;width: 24px;" /> 
											</a> 
											<a href="javascript:if(confirm('您还未登录，请先登录！'))location='${cp}gologin/1'" class="add fr icon i-addcart j-addcart" <c:if test="${!empty user}">style="display: none;"</c:if> ><img src="${cp}static/files/tianjiahui86415.png" style="height: 24px;width: 24px;" /> </a>
											<span id="food1336169296-cart-num" class="pic-food-cart-num fr" style="display:none;">0</span>
											<div class="price fl">
												<div class="only">¥${food.price}</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="widgets fr"></div>
			<div class="clear"></div>
			<input type="hidden" data-poi-id="144737917011987255" data-pv-flag="1">
		</div>
	</div>
	<script type="text/javascript">
		//通用
		function aaa(totalPrice,totalCount){
			var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
			var fr=$("#shoppingCartForm .footer .fr");
		   	if(parseFloat(totalPrice)>=parseFloat(distributionMoney)){//购买达到配送费
				$(fr).find(".ready-pay").css("display","none");
				$(fr).find(".go-pay").css("display","inline-block");
			}else{
				$(fr).find(".ready-pay").css("display","inline-block");
				$(fr).find(".go-pay").css("display","none");
				var money=distributionMoney-totalPrice;//差多少派送
				$(fr).find(".ready-pay .margintominprice").text(money);
			}
			var peisong=$(".order-list .other-charge .delivery-cost .shippingfee span").html();
			totalPrice=totalPrice+parseFloat(peisong);
			$(".order-list .total .totalnumber").text(totalCount);
			$(".order-list .total .bill").text(totalPrice);
		}
		//点击添加按钮
			function addFood(f,foodId,foodName,storeId,price){
				$(".order-list .title").css("display","block");
				$(".order-list #peisongSpan").css("display","block");
			 	var totalCount=0;
				var totalPrice=0;
			 	$(".order-list ul li").remove();
			 	var count=$("#foodCount").val();
			 	$.ajax({
				   type: "POST",
				   url: "/waimaiSys/restaurant/carAdd",
				   data: {"foodId":foodId,"foodName":foodName,"storeId":storeId,"price":price,"count":count},
				   success: function(obj){
				  		//var obj = eval(msg);
					   for(var i=0,l=obj.length;i<l;i++){
					   		var storeId=$(".rest-info .right-bar #storeId").val();
					   		
					   		if(obj[i].storeId==storeId){
								$(".order-list ul").append("<li class='clearfix'><div class='fl na clearfix' title='"+obj[i].foodName+"'><div class=''>"+obj[i].foodName+"</div></div><div class='fl modify clearfix'><a onclick='minus($(this))' class='fl minus'>-</a><input id='foodCount' type='text' class='fl txt-count' value='"+obj[i].count+"' maxlength='2' onchange='txtCount($(this))'><a onclick='plus($(this))' class='fl plus'>+</a><div><input type='hidden' value='"+obj[i].storeId+"'><input type='hidden' class='txt-foodId' value='"+obj[i].foodId+"'></div></div><div class='fr pri '><span>¥"+obj[i].price+"</span></div></li>");
								totalCount=totalCount+obj[i].count;
								totalPrice=totalPrice+(obj[i].count*obj[i].price); 
							}
						}
						var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
						var fr=$("#shoppingCartForm .footer .fr");
					   	if(parseFloat(totalPrice)>=parseFloat(distributionMoney)){//购买达到配送费
							$(fr).find(".ready-pay").css("display","none");
							$(fr).find(".go-pay").css("display","inline-block");
						}else{
							$(fr).find(".ready-pay").css("display","inline-block");
							$(fr).find(".go-pay").css("display","none");
							var money=distributionMoney-totalPrice;//差多少派送
							$(fr).find(".ready-pay .margintominprice").text(money);
						}
						var peisong=$(".order-list .other-charge .delivery-cost .shippingfee span").html();
						totalPrice=totalPrice+parseFloat(peisong);
						$(".order-list .total .totalnumber").text(totalCount);
						$(".order-list .total .bill").text(totalPrice);
				   }
				});
				$(".order-list").css({"display": "block","top":"-403px","height":"403px"});
				$(".order-list ul").css({"display": "block","top":"-243px","height":"243px"});
				$(".total").css("display","block");
					
			}
			
			
			
			//清空购物车
			function deleteCar(storeId){
				$.ajax({
				   type: "POST",
				   url: "/waimaiSys/restaurant/carDelete",
				   data: {"storeId":storeId},
				   success: function(msg){
				   		if(msg=="1"){
				   			$(".order-list ul li").remove();
				   			$(".order-list").css("display","none");
				   			var fr=$("#shoppingCartForm .footer .fr");
				   			$(fr).find(".ready-pay").css("display","inline-block");
							$(fr).find(".go-pay").css("display","none");
							var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
							var money=distributionMoney-0;//差多少派送
							$(fr).find(".ready-pay .margintominprice").text(money);
				   		}
				   }
				});
			}
			
			//菜品数量文本框值改变
			function txtCount(c){
				var totalCount=0;
				var totalPrice=0;
				$(".order-list ul li").remove();
				var count=$(c).val();
				var foodId=$(c).siblings("div").children(".txt-foodId").val();
				if(count<=0 || isNaN(count)==true || count==null){
					$(".order-list ul li .txt-count").val(1);
					count=1;
				}
				$.ajax({
				   type: "POST",
				   url: "/waimaiSys/restaurant/countChange",
				   data: {"foodId":foodId,"count":count},
				   success: function(msg){
				  		var obj = eval(msg);
					   for(var i=0,l=obj.length;i<l;i++){
					   		var storeId=$(".rest-info .right-bar #storeId").val();
					   		if(obj[i].storeId==storeId){
								$(".order-list ul").append("<li class='clearfix'><div class='fl na clearfix' title='"+obj[i].foodName+"'><div class=''>"+obj[i].foodName+"</div></div><div class='fl modify clearfix'><a onclick='minus($(this))' class='fl minus'>-</a><input id='foodCount' type='text' class='fl txt-count' value='"+obj[i].count+"' maxlength='2' onchange='txtCount($(this))'><a onclick='plus($(this))' class='fl plus'>+</a><div><input type='hidden' value='"+obj[i].storeId+"'><input type='hidden' class='txt-foodId' value='"+obj[i].foodId+"'></div></div><div class='fr pri '><span>¥"+obj[i].price+"</span></div></li>");
								totalCount=totalCount+obj[i].count;
								totalPrice=totalPrice+(obj[i].count*obj[i].price); 
							}
						}
					   var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
						var fr=$("#shoppingCartForm .footer .fr");
					   	if(parseFloat(totalPrice)>=parseFloat(distributionMoney)){//购买达到配送费
							$(fr).find(".ready-pay").css("display","none");
							$(fr).find(".go-pay").css("display","inline-block");
						}else{
							$(fr).find(".ready-pay").css("display","inline-block");
							$(fr).find(".go-pay").css("display","none");
							var money=distributionMoney-totalPrice;//差多少派送
							$(fr).find(".ready-pay .margintominprice").text(money);
						}
						var peisong=$(".order-list .other-charge .delivery-cost .shippingfee span").html();
						totalPrice=totalPrice+parseFloat(peisong);
						$(".order-list .total .totalnumber").text(totalCount);
						$(".order-list .total .bill").text(totalPrice);
				   }
				});
				
			}
			//减
			function minus(m){
				var totalCount=0;
				var totalPrice=0;
				$(".order-list ul li").remove();
				var count=$(m).next().val();
				count=count-1;
				var foodId=$(m).siblings("div").children(".txt-foodId").val();
				$.ajax({
				   type: "POST",
				   url: "/waimaiSys/restaurant/countChange",
				   data: {"foodId":foodId,"count":count},
				   success: function(msg){
				  		var obj = eval(msg);
					   if(msg!=null && msg!=""){
					   		for(var i=0,l=obj.length;i<l;i++){
					   			var storeId=$(".rest-info .right-bar #storeId").val();
						   		if(obj[i].storeId==storeId){
									$(".order-list ul").append("<li class='clearfix'><div class='fl na clearfix' title='"+obj[i].foodName+"'><div class=''>"+obj[i].foodName+"</div></div><div class='fl modify clearfix'><a onclick='minus($(this))' class='fl minus'>-</a><input id='foodCount' type='text' class='fl txt-count' value='"+obj[i].count+"' maxlength='2' onchange='txtCount($(this))'><a onclick='plus($(this))' class='fl plus'>+</a><div><input type='hidden' value='"+obj[i].storeId+"'><input type='hidden' class='txt-foodId' value='"+obj[i].foodId+"'></div></div><div class='fr pri '><span>¥"+obj[i].price+"</span></div></li>");
									totalCount=totalCount+obj[i].count;
									totalPrice=totalPrice+(obj[i].count*obj[i].price); 
								}
							}
					   		var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
							var fr=$("#shoppingCartForm .footer .fr");
						   	if(parseFloat(totalPrice)>=parseFloat(distributionMoney)){//购买达到配送费
								$(fr).find(".ready-pay").css("display","none");
								$(fr).find(".go-pay").css("display","inline-block");
							}else{
								$(fr).find(".ready-pay").css("display","inline-block");
								$(fr).find(".go-pay").css("display","none");
								var money=distributionMoney-totalPrice;//差多少派送
								$(fr).find(".ready-pay .margintominprice").text(money);
							}
							var peisong=$(".order-list .other-charge .delivery-cost .shippingfee span").html();
							totalPrice=totalPrice+parseFloat(peisong);
							$(".order-list .total .totalnumber").text(totalCount);
							$(".order-list .total .bill").text(totalPrice);
					   }else{
					   		$(".order-list").css("display","none");
					   		var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
					   		var fr=$("#shoppingCartForm .footer .fr");
					   		$(fr).find(".ready-pay").css("display","inline-block");
							$(fr).find(".go-pay").css("display","none");
					   		$(fr).find(".ready-pay .margintominprice").text(distributionMoney);
					   }
				   }
				});
			}
			
			//加
			function plus(p){
				var totalCount=0;
				var totalPrice=0;
				$(".order-list ul li").remove();
				var count=$(p).prev().val();
				count++;
				var foodId=$(p).siblings("div").children(".txt-foodId").val();
				$.ajax({
				   type: "POST",
				   url: "/waimaiSys/restaurant/countChange",
				   data: {"foodId":foodId,"count":count},
				   success: function(msg){
				  		var obj = eval(msg);
					   for(var i=0,l=obj.length;i<l;i++){
					   		var storeId=$(".rest-info .right-bar #storeId").val();
					   		if(obj[i].storeId==storeId){
								$(".order-list ul").append("<li class='clearfix'><div class='fl na clearfix' title='"+obj[i].foodName+"'><div class=''>"+obj[i].foodName+"</div></div><div class='fl modify clearfix'><a onclick='minus($(this))' class='fl minus'>-</a><input id='foodCount' type='text' class='fl txt-count' value='"+obj[i].count+"' maxlength='2' onchange='txtCount($(this))'><a onclick='plus($(this))' class='fl plus'>+</a><div><input type='hidden' value='"+obj[i].storeId+"'><input type='hidden' class='txt-foodId' value='"+obj[i].foodId+"'></div></div><div class='fr pri '><span>¥"+obj[i].price+"</span></div></li>");
								totalCount=totalCount+obj[i].count;
								totalPrice=totalPrice+(obj[i].count*obj[i].price); 
							}
						}
					   var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
						var fr=$("#shoppingCartForm .footer .fr");
					   	if(parseFloat(totalPrice)>=parseFloat(distributionMoney)){//购买达到配送费
							$(fr).find(".ready-pay").css("display","none");
							$(fr).find(".go-pay").css("display","inline-block");
						}else{
							$(fr).find(".ready-pay").css("display","inline-block");
							$(fr).find(".go-pay").css("display","none");
							var money=distributionMoney-totalPrice;//差多少派送
							$(fr).find(".ready-pay .margintominprice").text(money);
						}
						var peisong=$(".order-list .other-charge .delivery-cost .shippingfee span").html();
						totalPrice=totalPrice+parseFloat(peisong);
						$(".order-list .total .totalnumber").text(totalCount);
						$(".order-list .total .bill").text(totalPrice);
				   }
				});
			}
			
			//刷新页面
			$(function(){
				var totalCount=0;
				var totalPrice=0;
				$(".order-list ul li").each(function(i,e){
					var count=$(e).children(".clearfix").children(".txt-count").val();
					var price=$(e).children(".pri").children("span").text();
					totalCount=parseFloat(totalCount)+parseFloat(count);
					totalPrice=parseFloat(totalPrice)+parseFloat(price);
				});
				if(totalCount==0){
					$(".order-list").css("display","none");
					var fr=$("#shoppingCartForm .footer .fr");
				   	$(fr).find(".ready-pay").css("display","inline-block");
					$(fr).find(".go-pay").css("display","none");
					var distributionMoney=$(".right-bar .ack-ti .mtsi-num").text();
					var money=distributionMoney-0;//差多少派送
					$(fr).find(".ready-pay .margintominprice").text(money);
				}else{
					$(".order-list").css("display","block");
					aaa(totalPrice,totalCount);
				}
				
			});
	</script>
	<!-- 购物车 -->
	<div class="shopping-cart clearfix" data-status="1"
		data-poiid="144737917011987255">
		<form method="post" action="${cp}car/showCar/${store.id}" id="shoppingCartForm">
		<%-- <c:if test="${carList!=null}">style="display: block;top:-203px;overflow: auto;"</c:if> --%>
		
			<div class="order-list" style="display: block;top:-403px;height: 403px;" >
					<div class="title" <c:if test="${carList==null}">style="display: none;"</c:if> >
						<span class="fl buy-title">购物车</span> 
						<span class="fr dishes">
							<a onclick="deleteCar(${store.id});" class="clear-cart"><i></i>清空菜品</a>
						</span>
					</div>
				
				<ul  style="display: block;top:-243px;overflow: auto; height: 243px;" >
					<c:forEach items="${carList}" var="car">
					<c:if test="${car.storeId==store.id}">
						<li class="clearfix  food-1499856645_1710299672" data-fid="1499856645" data-fkey="1499856645_1710299672"> 
							 <div class="fl na clearfix" title="${car.foodName}">   
							  	<div class="">${car.foodName}</div>   
							 </div>    
							 <div class="fl modify clearfix">    
							     <a onclick="minus($(this))" class="fl minus">-</a>    
							     <input type="text" class="fl txt-count" value="${car.count}" maxlength="2" onchange="txtCount($(this))">    
							     <a onclick="plus($(this));" class="fl plus">+</a>  
							     
								 <div>
								 	<input type="hidden" class="txt-foodId" value="${car.foodId}">
								 	<input type="hidden" value="${car.storeId}">
							  	 </div>
						  	 </div>  
						  	 <div class="fr pri ">¥<span>${car.price}</span></div>  
						 </li>
					</c:if> 
					</c:forEach>
				</ul>
				<span id="peisongSpan" <c:if test="${carList==null}">style="display: none;"</c:if> >
					<div class="other-charge" style="display: block;">
						<!-- <div class="clearfix packing-cost hidden">
							<span class="fl">包装费</span> <span class="fr boxtotalprice">￥0</span>
						</div> -->
						<div class="clearfix delivery-cost">
							<span class="fl">配送费(不计入起送价)</span> <span class="fr shippingfee">￥<span>${store.distributionMoney}</span></span>
						</div>
					</div>
					<div class="privilege hidden"></div>
					<div class="total">
						共<span class="totalnumber">0</span>份，总计￥<span class="bill">0</span>
					</div>
				</span>
			</div>

			<div class="footer clearfix">
				<div class="logo icon fl"><img alt="" src="${cp}static/files/gouwuchelogo.png" style="height: 35px;width: 35px;"> </div>
				<div class="brief-order fl">
					<span class="count"></span> <span  class="price"></span>
				</div>
				<div class="fr">
					<%-- <a <c:if test="${!empty user}">style="display: none;"</c:if> href="${cp}gologin/1">去登录</a> --%>
					<a <c:if test="${empty user}">style="display: none;"</c:if> class="ready-pay borderradius-2" href="javascript:;">差<span data-left="0" class="margintominprice">0</span>元起送</a> 
					<input class="go-pay borderradius-2" type="submit" value="立即下单">
					<input type="hidden" value="" class="order-data" name="shop_cart">
				</div>
			</div>
		</form>
	</div>
	<c:import url="footer.jsp"></c:import>
</body>
</html>