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
    <title>搜索结果</title>
    <link rel="stylesheet" href="static/css/page/search/result.css?v=1.07" />
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="static/js/index/meishi.js"></script><body style="">
		<div class="triffle" id="triffle">
		</div>
		<div class="wrapper">
        	<c:import url="header.jsp"></c:import>
      		<div class="page-wrap">
				<div class="inner-wrap">
					<div class="result-wrap">
						<div class="result-change clearfix">
							<a href="javascript:;" class="result-sort fl poi" data-geoid="wx4g5591sbdt" id="ct">餐厅</a>
							<a href="javascript:;" class="result-sort fl food cur-sort" data-geoid="wx4g5591sbdt" id="ms">美食</a>
						</div>
						<div class="result-content">
    						<h2>搜索"
    							<span class="keyWords cc-lightred-new">    
    								${vl}
								</span>"的美食结果
							</h2>
							
							<c:forEach items="${list }" var="li" varStatus="vs">
	  							<div class="result-list ">
	    							<div class="poi-info clearfix">
	      								<div class="name clearfix">
	        								<h3 class="fl">
	        									<a href="restaurant/findAll/${li.id}" target="_blank" title="${li.storeName }">
	        										${li.storeName }
	        									</a>
	        								</h3>
	        								<div class="discount fl">
	            								<i class="icon i-pay fl"></i>
										          <!-- 是否支持代金券 -->
										          <!-- 返 -->
											</div>
										</div>
										<div class="info-content clearfix">
									        <span class="rank fl">
												<span class="star-ranking fl">
													<span class="star-score" style="width: ${li.commentlv*7.2}px">
													</span>
												</span>
												<span class="rank-grades ct-lightgrey fl">${li.commentlv/2}</span>
									        </span>
									        <span class="fl ct-b5gray">|</span>
									        <span class="price fl ct-lightgrey">
												<span class="start-price">${li.startMoney }元起送</span>
												<span class="send-price">
									              ${li.distributionMoney }元配送费
												</span>
									        </span>
										</div>
									    <div class="poi-status ct-b5gray  ">
									    	<i class="icon i-pre-order "></i>
									    	<!-- <p class="status-pre">接受预订<span>|</span><span class="cc-lightred-new">09:40 分开始送餐</span></p> -->
									    </div>
	    							</div>
	    							
	    							<ul class="food-list">
	    							<c:forEach items="${list1 }" var="list1" varStatus="vs">
	    								<c:if test="${list1.storeId==li.id }">
	          							<li class="clearfix" data-poiname="${li.storeName }" data-poiid="144903552466397991" data-foodid="237145005">
	            							<a href="restaurant/findAll/${li.id}#gao${list1.id}" class="food fl">
												<p class="details fl ">
													<span class="food-name ">
														${list1.foodName }
													</span>
												</p>
												<span class="food-price fl">
													￥${list1.price }元
												</span>
												<span class="food-total fl  ct-middlegrey"></span>
												<span class="food-good cc-lightred-new fl">
													<i class="icon i-zan fl"></i>
													<span class="zan fl">
														<!-- (0) -->
													</span>
												</span>
												<span class="buy fl">
													购买
												</span>
											</a>
										</li>
										</c:if>
	          					</c:forEach>
								</ul>
							</div>
  							</c:forEach>

						</div>
					</div>
      </div>
    </div>
    <c:import url="footer.jsp"></c:import>
</div>
</body></html>