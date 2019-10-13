<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>" /><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title>
    <link rel="stylesheet" href="${cp}static/css/page/home.css">
	<link rel="stylesheet" href="${cp}static/css/page/index.glh.css" type="text/css"></link>
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<script type="text/javascript" src="${cp}static/js/index/sousuo.js"></script>
	</head>
<body>
<div class="wrapper">
      <c:import url="header.jsp"></c:import>
      <div class="page-wrap">
	      <div class="inner-wrap">
			<input type="hidden" value="${max }" id="max">
			<div class="inner-bg">
			    <div class="top-tools clearfix">
			        <div class="fl" style="position: relative;">
			            <a href="https://waimai.meituan.com/new/waimaiIndex/?stay=1"><i class="fl address-icon"> </i></a>
			            <img alt="" src="${cp}static/files/weizhi4584151.png" style="height: 20px;width: 20px;">
			            <span class="current-county">${address}</span>
			            <span style="color: #ccc;">|</span>
			            <a href="${cp}getAddress.jsp" id="change-position" class="change-position">订餐地址</a>
			            <input type="hidden" id="lnglat" value="${lnglat}"/>
			        </div>
			        <%-- <div class="fr" style="position: relative;">
				        <div class="clearfix" id="dis-login" style="line-height: 30px; position: relative">
				        	<c:if test="${user!=null }">
				            	<a class="new-list-btn fr" href="">我的订单</a>
				            </c:if>
				            <c:if test="${user==null }">
					            <a class="j-login new-login-btn fr" href="gologin/1" rel="nofollow">登录</a>
					            <a class="j-register new-register-btn fr" href="goreg/1" rel="nofollow">注册</a>
				            </c:if>
				        </div>
			        </div> --%>
			    </div>
			    <div class="rest-banner">
			      <div class="imgsort-wrapper">
			        <span class="imgsort-filter-title">商家分类</span>
			        <span class="imgsort-filter-split">|</span>
			        <ul class="clearfix imgsort-content">
			          <li class="fl">
			            <a href="javascript:void(0)" class="imgsort-list" title="全部">
			              <span class="imgsort-info" data-id="0">全部</span>
			            </a>
			            </li>
			          <c:forEach items="${storeTypes}" var="st">
			          	<li class="fl">
			              <a class="imgsort-list" href="javascript:void(0)">
			                <span class="imgsort-info" data-id="${st.id }">${st.storeType}</span>
			              </a>
			            </li>
			          </c:forEach>
			        </ul>
			        <div class="search-box fr" id="searchBox">
			            <input type="text" id="header-search" class="header-search fl" placeholder="搜索商家，美食">
			            <a href="javascript:;" class="doSearch fr"><span class="sss" id="sousuo" ><img src="${cp}static/files/sousuo445168435.png" width="20px;" height="20px;"> </span> </a>
			            <div class="result-box" style="display: none;">
			              <div class="result-left fl">
			                <div class="rest-words ct-black">商家</div>
			                <div class="food-words ct-black">美食</div>
			              </div>
			              <div class="result-right fl">
			                <ul class="rest-lists">
			                </ul>
			                <div class="line"></div>
			                <ul class="food-lists">
			                </ul>
			              </div>
			            </div>
			            <div class="no-result" style="display: none;">
			             	 没有找到相关结果，请换个关键字搜索！
			            </div>
			        </div>
			      </div>
			    </div>
			    
			  	<div id="announcement-area" style="padding-left: 40px;">
			 		<ul class="com-sel">
				 		<li class="com-opt" data-type="1">距离<div class="bg"></div></li>
				 		<li class="com-opt" data-type="2">评分<div class="bg"></div></li>
				 		<li class="com-opt" data-type="3">销量<div class="bg"></div></li>
				 		<li class="com-opt" data-type="4">配送费<div class="bg"></div></li>
				 		<li class="com-opt" data-type="5">开店时间<div class="bg"></div></li>
			 		</ul>
			  	</div>
			  	<div class="rest-list">
			    	<ul class="list clearfix">
			    	</ul>
			    </div>
			</div>
	
	      </div>
    </div>
    
    <c:import url="footer.jsp"></c:import>

</div>

	<script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" charset="utf-8" src="${cp}static/js/page/home.js"></script>

	
      <!-- <li class="rest-separate j-rest-separate loading" id="loading">
          <div class="isloading">点击加载更多商家</div>
      </li> 
    <c:forEach items="${storeByAddress}" var="store">
    	<li class="fl rest-li">    
	        <div class="j-rest-outer rest-outer transition">
		      <div data-title="${store.storeName}" data-poiid="144737917011462967" class="restaurant" data-all="1" data-invoice="1" data-minpricelevel="1">
		        <a class="rest-atag" href="${cp}restaurant/findAll/${store.id}" target="_blank" data-pos="0">
		          <div class="top-content">
		            <div class="preview">
		              <img data-rid="144737917011462967" data-index="0" class="scroll-loading" src="${cp}static/images/${store.storeImg}" data-max-width="208" data-max-height="156">
		              <div class="rest-tags">
		              </div>
		            </div>
		            <div class="content">
		              <div class="name">
		                <span title="${store.storeName}">${store.storeName}</span>
		              </div>
		                <div class="rank clearfix">
		                 <span class="star-ranking fl"><!-- 
		                    5颗星72px长度，算此时星级的长度
		                    算出空白填充的部分长度 
		                    <span class="star-score" style="width: 66px"></span>
		                  </span>
		                  <span class="score-num fl">4.5分</span> 
		                  <span class="start-price mtsi-num">销量:</span>
		                  <input type="hidden" class="point" value="${store.coordinate}"/>
		                  <input type="hidden" class="getDis"/>
		                </div>
		              <div class="price">
		                <span class="start-price mtsi-num">起送:￥${store.startMoney}</span>
		                <span class="send-price mtsi-num">配送费:￥${store.distributionMoney}</span>
		                <span class="send-time mtsi-num"></span>
		              </div>
		            </div>
		            <div class="clear"></div>
		          </div>
		        </a>
		        <a href="javascript:;" class="un-favorite j-save-up" data-poiid="144737917011462967" title="收藏商家">
		          <i class="icon i-poi-fav1"></i>
		        </a>
		      </div>
		    </div>
		</li>
    </c:forEach>
	
      -->
      	<script language="javascript">
		if($("#lnglat").val()==""||$("#lnglat").val()==null){
			window.location.href="getAddress.jsp";
		}
		
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
		    var rohrdata = '';
		    var Rohr_Opt = new Object;
		    Rohr_Opt.Flag = 100007;
		    Rohr_Opt.LogVal = 'rohrdata';
		</script>
	<script type="text/javascript" src="${cp}static/js/index/index.js"></script>
</body>
</html>