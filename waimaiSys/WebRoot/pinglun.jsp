<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title>  
     	<link rel="stylesheet" href="../static/css/page/comment.css" type="text/css"></link>
<script type="text/javascript" src="../static/js/jquery-1.11.2.min.js"></script></head>
	<body style="">
	  <div class="triffle" id="triffle">
	  </div>
	  <div class="wrapper">
        <c:import url="header.jsp"></c:import>
      <div class="page-wrap">
<div class="inner-wrap">
<div class="rest-info">
    <div class="right-bar fr clearfix ct-lightgrey">
        <div class="fl ack-ti">
            <div class="desc">起送</div>
            <div class="nu">
                <strong class="mtsi-num">${store_comment.startMoney }</strong>元
            </div>
        </div>
      <div class="fl in-ti">
          <div class="desc">配送费</div>
          <div class="nu">
              <strong class="mtsi-num">${store_comment.distributionMoney }</strong>元
          </div>

      </div>
    </div>

  <div class="details">
    <div class="up-wrap clearfix">
      <div class="avatar fl">
        <img class="scroll-loading" src="${cp }static/images/${store_comment.storeImg}"  data-max-width="106" data-max-height="80" style="width: 106px; height: 79.5px;">
      </div>
      <input type="hidden" id="store_comment" value="${store_comment.id }">
      <input type="hidden" value="${all }" id="getPageNum">
       <input type="hidden" value="${bad}" id="bad">
       <input type="hidden" value="${fine}" id="fine">
      <div class="list">
        <div class="na">
          <a href="https://waimai.meituan.com/restaurant/144895314720927658">
            <span>${store_comment.storeName }</span><i class="icon i-triangle-dn"></i>
          </a>
        </div>
        <div class="stars clearfix" style="margin-top:14px;">
			${store_comment.storeAddress} <br>
		</div>
      </div>
    </div>
    <%-- <div class="rest-info-down-wrap" style="">
      <div class="clearfix sale-time">
        <p class="poi-detail-left"><svg class="icon-Combined-Shape"><use xlink:href="#icon-Combined-Shape"></use></svg><span>营业时间</span></p>
        <p class="poi-detail-right"><span class="info-detail">09:00-19:30</span></p>
      </div>
        <div class="rest-info-thirdpart poi-address">
        <p class="poi-detail-left"><svg class="icon-Shape-Copy"><use xlink:href="#icon-Shape-Copy"></use></svg><span class="poi-address-title">商家地址</span></p>
        <p class="poi-detail-right">${store_comment.storeAddress }</p>
        </div>
    </div> --%>
  </div>
  <div class="save-up-wrapper">
    <a href="javascript:;" class="save-up j-save-up favorite" data-poiid="144895314720927658">
      <p class="ct-black">已收藏</p>
      <i class="icon i-heart-22"></i>
    </a>
    <p class="cc-lightred-new j-save-up-people"></p>
  </div>
</div>

<div class="comments fl" id="comments" data-pid="144895314720927658">
  <div class="tab-link">
    <div class="tab-link-inner clearfix">
      <a href="${cp}restaurant/findAll/${store_comment.id }" class="tab-item ">菜单</a>
      <a href="${cp}findStor/${store_comment.id }" class="tab-item active">评价</a>
        <%-- <a href="${cp}findanqian/${store_comment.id }" class="tab-item  ">食品安全档案</a> --%>
    </div>
  </div>
  <div class="title clearfix">
    <label class="fr "><input type="checkbox" checked="checked" class="has-cont" id="has-cont"><span class="ct-lightgrey">有内容的评价</span></label>
    <div class="clearfix filters ct-deepgrey j-filters">
        <label class="chose fl">
        	<input type="radio"  id="quanbu" value="全部" name="comment" checked="checked" class="filter">
        	<span>全部评价 
        		<em>(${all })</em>
        	</span>
        </label>
        <label class="fl">
        	<input type="radio" id="haoping" value="好评" name="comment" class="filter">
        	<span>好评 
        		<em>(${fine })</em>
        	</span>
        </label>
        <label class="last-label fl">
        	<input type="radio" id="chaping" value="差评"  name="comment" class="filter">
        	<span>差评 
        		<em>(${bad })</em>
        	</span>
        </label>
    </div>
  </div>
  <div class="list">
    <div class="loading" style="display: none;">
    
    </div>
    <div class="comment-list-wrapper">
	<ul id="ul"></ul>
	</div>
	<div class="page-navbar clearfix" id="pager">
		<div class="page-nav-wrapper">  
			<a href="#top" class="first-page">首页</a>  
			<a href="#top" class="previous" >
				<i class="tri">&lt;</i>上一页
			</a>
			<a href="#top" id="jian"></a>    
			<span class="current" id="dangqian">1</span>    
			<a href="#top" id="jia"></a>    
			<a href="#top" class="next" data-page="11">下一页
				<i class="tri">&gt;</i>
			</a>  
			<a href="#top" class="last-page" data-page="27">尾页</a>
		</div>
	</div>
</div>
</div>

<div class="rank fr">
  <div class="title">总体评分</div>
  <div class="head clearfix">
    <strong class="fl">${avg }</strong>
    <span class="star-ranking fl">
  	  <span class="star-score" style="width: 135px"></span>
  	</span>
  </div>
  <div class="detail">
  <c:forEach items="${list2}" var="li">
      <div class="field clearfix">
        <span class="fl score-num">
            ${li.commentlv }分
        </span>
        <span class="fl bar"><i style="width: ${li.avg*100}%;"></i></span>
        <span class="fr percent">${li.avg*100}%</span>
      </div>
      </c:forEach>
  </div>
</div>

<div class="clear"></div>
      </div>
    </div>
    <c:import url="footer.jsp"></c:import>
</div>
<script type="text/javascript" src="${cp }static/js/pinlun/pinlun.js"></script>
</body>

</html>