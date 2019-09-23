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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>豪吃外卖</title>
<link rel="stylesheet" href="${cp}static/css/module/order/main.css">
<link rel="stylesheet" href="${cp}static/css/module/order/vendor.css">
<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />

<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${cp}static/js/page/order.js"></script>
<style type="text/css">
        #panel {
            position: relative;
            background-color: white;
            max-height: 200px;
            overflow: auto;
            top: 0px;
            right: 0px;
            width: 300px;
            border-bottom: solid 1px silver;
            z-index: 99999;
        }
        .amap_lib_placeSearch_poi,.poi-img,.poi-title .poi-more,.poi-info .poi-tel,.amap_lib_placeSearch_page{
        	display: none;
        }
        .amap_lib_placeSearch_ul{
        	overflow: auto;
        }
        .amap_lib_placeSearch .poibox {
		    padding: 3px 0 3px 0px;
		}
    </style>
</head>
<body style="position: relative;" class="hidesidebar">
	<div class="ng-isolate-scope">
		<header class="carttopbar">
			<c:import url="header.jsp"></c:import>
		</header>
	</div>
	<input type="hidden" value="${carList}" id="hiddenCarList"/>
	<div class="importantnotification container"></div>
	<div class="sidebar ng-hide">
		<div class="sidebar-tabs">
			<div class="toolbar-tabs-middle">
				<a class="toolbar-btn icon-order toolbar-close" href="https://www.ele.me/profile/order">
				</a>
				<div class="toolbar-separator"></div>
				<a class="toolbar-cartbtn icon-cart toolbar-open toolbar-cartbtn-shownum" href="javascript:" >购物车
					<i class="toolbar-cartnum ng-binding ng-scope">3</i>
				</a>
				<div class="toolbar-separator"></div>
				<a class="toolbar-btn icon-notice toolbar-open modal-hide" href="javascript:" >
				</a>
			</div>
		</div>
		<div class="sidebar-content">
		</div>
	</div>
	<div class="ng-scope">
		
		<div class="container clearfix ng-scope">
			<div class="checkout-cart ng-scope ng-isolate-scope">
				<div class="checkoutcart-container">
					<div class="checkoutcart-title">
						<h2>订单详情</h2>
						<a href="backToStore();">&lt;返回商家修改</a>
					</div>
					<div class="checkoutcart-tablerow tablehead">
						<div class="cell itemname">商品</div>
						<div class="cell itemquantity">份数</div>
						<div class="cell itemtotal">小计（元）</div>
					</div>
					<dl class="checkoutcart-group ng-scope">
					<c:forEach items="${carList}" var="car">
						<dd class="ng-scope">
							<div class="checkoutcart-tablerow">
								<div class="cell itemname ng-binding" title="${car.foodName}">${car.foodName}</div>
								<input type="hidden" class="foodId" value="${car.foodId}"/>
								<div class="cell itemquantity">
									<button class="minus" onclick="btnMinus($(this));">-</button>
									<input class="ng-pristine ng-valid" maxlength="2" value="${car.count}" onchange="countChange($(this));">
									<button class="plus" onclick="btnPlus($(this));">+</button>
								</div>
								<input type="hidden" class="foodPrice" value="${car.price}"/>
								<div class="cell itemtotal ng-binding">¥<span>${car.price*car.count}</span></div>
							</div>
						</dd>
					</c:forEach>
					</dl>
					<div class="checkoutcart-distributionMoney">
						配送费&nbsp;&nbsp;¥<span class="distributionMoney">${store.distributionMoney}</span>
					</div>
					<div class="checkoutcart-total color-stress">
						¥<span class="num ng-binding"></span>
					</div>
					<div class="checkoutcart-totalextra">
						共 <span class="ng-binding"></span> 份商品
					</div>
					<%-- ${carList} --%>
				</div>
			</div>
			<div class="checkout-content ng-scope">
				<div class="checkout-select ng-isolate-scope">
					<h2>
						收货地址 <a class="checkout-addaddress ng-hide" href="javascript:" onclick="addAddress();">添加新地址</a>
					</h2>
					<c:if test="${userAddressList==null}">
						<a class="checkout-noaddress ng-scope"  href="javascript:" onclick="addAddress();" <c:if test="${userAddressList!=null}">style="display: none;"</c:if> >+ 添加新地址</a>
					</c:if>
					<ul class="checkout-address-list ng-hide showfirst">
						<c:forEach items="${userAddressList}" var="address" varStatus="i">
							<li>
								<label class="addressInfo" onclick="labelClick($(this));">
									<input type="hidden" id="addressId" value="${address.id}"/>
									<input type="hidden" class="isDefault" value="${address.isDefault}"/> 
									<input type="radio" name="userAddress" class="addressRadio" value="${address.id}" <c:if test="${address.isDefault==1}">checked="checked"</c:if> />
									<span class="user-address">
										<span>${address.contactName}</span>
										<em>${address.contactPhone}</em>
										<span>${address.contactAddress} </span>
									</span>
									<c:choose>
										<c:when test="${address.isDefault==1}">
											<em class="default" style="color: #b6b6b4;">默认地址</em>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);" class="set-default" onclick="setDefault($(this));">设为默认地址</a>
										</c:otherwise>
									</c:choose>
									<span class="tips" style="display: none;">
										<i class="success success-icon"><img alt="" width="14px;" height="14px;" src="${cp}static/files/chenggong.png"></i>
										<span class="success success-tip">设置成功！</span>
									</span>
								</label>
								<a class="modify" href="javascript:void(0);" style="display: none;" onclick="deleteAddress('${address.id}',$(this));">删除本地址</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="checkout-select">
					<h2 class="checkout-title">
						付款方式<span class="color-tip checkout-pay-tip">推荐使用在线支付，不用找零，优惠更多</span>
					</h2>
					<ul class="clearfix">
						<!-- ngRepeat: pay in payList -->
						<li class="checkout-pay ng-scope active">
							<p class="ng-binding">支付宝在线支付</p>
							<!-- <p class="color-mute ng-binding">支持微信、支付宝、QQ钱包及大部分银行卡</p> -->
						</li>
					</ul>
				</div>
				<div class="checkout-select">
					<h2 class="checkout-title">其他信息</h2>
					<div class="checkout-info">
						<span class="checkout-infolabel">配送方式</span> 
						<span>本订单由<a class="ng-binding"> [商家] </a>提供配送</span>
					</div>
					<div class="checkout-info">
						<span class="checkout-infolabel">订单备注</span> 
						<span>
							<input class="checkout-input ng-pristine ng-valid">
						</span>
					</div>
				</div>
				<div>
					<button class="btn-stress btn-lg ng-binding ng-isolate-scope" onclick="sureOrders();">确认下单</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加地址 -->
	<span id="addAddressDiv" style="display: none;">
	<div style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; z-index: 1006;"></div>
    <div class="addressdialog" style="z-index: 1007; left: 460px; top: 150px;">
    	<div class="addressdialog-close" onclick="closeDiv();"></div>
    	<div class="addressdialog-header">添加新地址</div>
    	<div class="addressdialog-content">
    		<div class="addressform">
	    		<form id="addressForm" method="post" action="">
	    		<div class="addressformfield">
	    			<label>姓名</label>
	    			<input placeholder="请输入您的姓名" onblur="inputBlur($(this));" id="contactName" name="contactName">
	    			<span class="addressformfield-hint-span">(请输入您的姓名)</span>
	    			<div class="addressformfield-hint"><span></span></div>
	    		</div>
	    		<div class="addressformfield sexfield">
	    			<label>性别</label>
	    			<div>
	    				<input id="sexfield-1-male" name="gender" type="radio" value="1" checked="checked"/>
	    				<label for="sexfield-1-male">先生</label>
	    				<input id="sexfield-1-female" type="radio" name="gender" value="0"/>
	    				<label for="sexfield-1-female">女士</label>
	    			</div>
	    			<div class="addressformfield-hint"><span></span></div>
	    		</div>
	    		<input id="city" value="${city}" type="hidden">
	    		<input id="userId" name="userId" value="${user.id}" type="hidden">
	    		<input id="storeCoordinate" name="storeCoordinate" value="${store.coordinate}" type="hidden">
	    		<div class="addressformfield addressfield">
	    			<label>位置</label>
	    			<img src="${cp}static/files/zuobiao8451285.png" width="20px;" height="20px;">
	    			<input id="tipinput" placeholder="请输入小区、大厦或学校" oninput="addressChange();" onblur="inputBlur($(this));">
	    			<span class="addressformfield-hint-span">(请输入小区、大厦或学校)</span>
	    			<!-- <input id="xiangxiAddress" name="xiangxiAddress" value="" type="text"> -->
	    			<div id="panel"></div>
	    			<div class="addressformfield-hint"><span></span></div>
	    			<!-- <div class="addressform-tip" style="display: none;">
	    				<p><span>没找到你的地址？</span><a style="display: none;">去地图看看吧！</a></p>
	    				<p>请尝试只输入小区、大厦或学校看看。</p>
	    				<div class="arrow"></div>
	    			</div> -->
	    		</div>
	    		<div class="addressformfield">
	    			<label>详细地址</label>
	    			<input id="xiangxiAddress" name="xiangxiAddress"><!-- <span class="addressformfield-hint-span">(请输入单元、门牌号)</span> -->
	    			<div class="addressformfield-hint"><span></span></div>
	    		</div>
	    		<div class="addressformfield phonefield">
	    			<label>手机号</label>
	    			<input id="contactPhone" name="contactPhone" placeholder="请输入您的手机号" onblur="checkPhone($(this));"><span class="addressformfield-hint-span">(请输入您的手机号)</span>
	    			<div class="addressformfield-hint"><span></span></div>
	    		</div>
	    	</form>
	    	<div class="addressform-buttons">
	    		<button onclick="saveAddress();">保存</button>
	    		<button onclick="closeDiv();">取消</button>
	    	</div>
	    </div>
	   </div>
   </div>
   </span>
   
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<c:import url="footer.jsp"></c:import>

</body>

</html>