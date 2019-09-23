<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="baidu-site-verification" content="k2rI8MgxnB">
    <meta name="applicable-device" content="pc">
    <title>搜索结果</title>
    <link rel="stylesheet" href="static/css/page/search/result.css?v=1.07" />
    <meta name="lx:category" content="waimai">
    <meta name="lx:appnm" content="mtpc">
    <meta name="lx:autopv" content="off">
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="static/js/index/meishi.js"></script>
	<body style="">
		<div class="wrapper">
			<c:import url="header.jsp"></c:import>
      		<div class="page-wrap">
        		<div class="inner-wrap">
					<div class="result-wrap">
						<div class="result-change clearfix">
							<a href="javascript:void(0);" class="result-sort fl poi cur-sort" id ="ct">餐厅</a>
							<a href="javascript:void(0);" class="result-sort fl food" id="ms">美食</a>
						</div>
						<div class="result-content">
      						<h2>搜索"
      							<span class="keyWords cc-lightred-new"> 
      								${vl}
								</span>"的餐厅结果
							</h2>
							<ul class="clearfix">
							<c:forEach var="li" items="${list }" varStatus ="vs" >
								<li class="rest-list fl <c:if test="${vs.count%4==0}">row-last</c:if>">  
									<a href="restaurant/findAll/${li.id}" target="_blank">
								    	<div class="content">
											<p class="name">${li.storeName }</p>
								      		<p class="price ct-lightgrey">
								        		<span class="start-price">${li.startMoney }元起送</span>
								        		<span class="send-price">${li.distributionMoney }元配送费</span>
								      		</p>
								        	<p class="rank clearfix">
								          		<span class="star-ranking fl">
								  	        		<span class="star-score" style="width: ${li.commentlv*7.2}px"></span>
								  	      		</span>
								        	</p>
								        	<p class="send-time ct-lightgrey">送餐距离：${li.juli }米</p>
								    	</div>
									    <div class="discount clearfix">
									        <i class="icon i-pay fl"></i>
									      <!-- 是否支持代金券 -->
									      <!-- 返 -->
									    </div>
									</a>
								</li>
							</c:forEach>
							</ul>
  						</div>
					</div>
      			</div>
    		</div>
    		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>