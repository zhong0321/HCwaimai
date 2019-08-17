<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>" /><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title>
    <link rel="stylesheet" href="${cp}static/css/page/home.css">
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<script type="text/javascript" src="static/js/index/sousuo.js"></script></head>
	<body>
	<div id="container"><span class="Verification">${user}</span> </div>
	<div id="panel"></div>
	  <div class="triffle" id="triffle"></div>
	  <div class="wrapper">
	      <div id="top-tips" class="top-tips" style="display: none;">
	        <a class="j-top-tips-close top-tips-close" href="javascript:;"><i class="icon i-top-tips-close"></i></a>
	        <div class="j-top-tips-content top-tips-content" data-id=""></div>
	      </div>
        <div class="csr-header">
            <div class="header-content">
                <a id="left" href="https://waimai.meituan.com/">
                    <div class="logo-pic"></div>
                    <div class="waimai">
                        <div class="waimai-title"></div>
                        <div class="waimai-slogan"></div>
                    </div>
                </a>
                <div id="right">
                    <ul id="links">
                        <li data-index="0"><a href="https://waimai.meituan.com/">首页</a></li>
                        <li data-index="1"><a href="https://i.waimai.meituan.com/node/csr/joinin">商家入驻</a></li>
                        <li data-index="4"><a href="https://waimai.meituan.com/new/waimaiIndex" class="active">点外卖</a></li>
                        <li data-index="5"><a href="https://waimai.meituan.com/mobile/download/default">后台管理</a></li>
                        用户：${user}
                    </ul>
                </div>
            </div>
        </div>
      <div class="page-wrap">
        <div class="inner-wrap">
		<script>
		    var rohrdata = '';
		    var Rohr_Opt = new Object;
		    Rohr_Opt.Flag = 100007;
		    Rohr_Opt.LogVal = 'rohrdata';
		</script>
<script id="page-data-template" type="text/template">
  {"page":  "home"
  }
</script>
<div class="inner-bg">
    <div class="top-tools clearfix">
        <div class="fl" style="position: relative;">
            <a href="https://waimai.meituan.com/new/waimaiIndex/?stay=1"><i class="fl address-icon"> </i></a>
            <img alt="" src="${cp}static/files/weizhi4584151.png" style="height: 20px;width: 20px;">
            <span class="current-county">${address}</span>
            <span style="color: #ccc;">|</span>
            <a href="" id="change-position" class="change-position">订餐地址</a>
            <input type="hidden" id="lnglat" value="${lnglat}"/>
        </div>
        <div class="fr" style="position: relative;">
	        <div class="clearfix" id="dis-login" style="line-height: 30px; position: relative">
	            <a class="new-list-btn fr" href="">我的订单</a>
	            <a class="j-login new-login-btn fr" href="" rel="nofollow">登录</a>
	            <a class="j-register new-register-btn fr" href="" rel="nofollow">注册</a>
	        </div>
        </div>
    </div>
    <div class="rest-banner">
      <div class="imgsort-wrapper">
        <span class="imgsort-filter-title">商家分类</span>
        <span class="imgsort-filter-split">|</span>
        <ul class="clearfix imgsort-content">
          <li class="fl">
            <a href="${cp}index/findByStoreTypes/0" class="imgsort-list" title="全部">
              <span class="imgsort-info">全部</span>
            </a>
          <c:forEach items="${storeTypes}" var="st">
          	<li class="fl">
              <a class="imgsort-list" href="${cp}index/findByStoreTypes/${st.id}">
                <span class="imgsort-info">${st.storeType}</span>
              </a>
            </li>
          </c:forEach>
        </ul>
        <div class="search-box fr" id="searchBox">
            <input type="text" id="header-search" class="header-search fl" placeholder="搜索商家，美食">
            <a href="javascript:;" class="doSearch fr"><span class="sss" id="sousuo">搜索</span> </a>
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
      
        <div class="rest-filter clearfix" style="border: none;">
        </div>
      <div class="divider"></div>
    </div>
    
    
    
  	<div id="announcement-area"><div><div class="divider"></div></div></div>
  	<div class="rest-list">
    <ul class="list clearfix">
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
		                  <!-- <span class="star-ranking fl">
		                    5颗星72px长度，算此时星级的长度
		                    算出空白填充的部分长度
		                    <span class="star-score" style="width: 66px"></span>
		                  </span>
		                  <span class="score-num fl">4.5分</span> -->
		                  <input type="hidden" class="point" value="${store.coordinate}"/>
		                  <input type="hidden" class="getDis"/>
		                </div>
		              <div class="price">
		                <span class="start-price mtsi-num">起送:￥${store.startMoney}</span>
		                <span class="send-price mtsi-num">配送费:￥${store.distributionMoney}</span>
		                <span class="send-time mtsi-num"><i class="icon i-poi-timer"></i>分钟</span>
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
	
	<script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" charset="utf-8" src="${cp}static/js/page/home.js"></script>
	
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Riding"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript">
		var map = new AMap.Map("container", {
		    resizeEnable: true,
		    center: [116.397428, 39.90923],//地图中心点
		    zoom: 13 //地图显示的缩放级别
		});
		var distance;
		var time;
		//骑行导航
		var riding = new AMap.Riding({
		    map: map,
		    /* panel: "panel"  */
		}); 
		
		$(".point").each(function(index,dom){
				var lnglat=($("#lnglat").val()).split(",");
				var point=($(dom).val()).split(",");
		    	var p1 = new AMap.LngLat(lnglat[0],lnglat[1]);
				var p2 = new AMap.LngLat(point[0],point[1]);
				riding.search([lnglat[0],lnglat[1]],[point[0],point[1]], function(status, result) {
				   	// result即是对应的骑行路线数据信息
				   	distance=result.routes[0].distance;//获取骑行路线的距离
				   	time=result.routes[0].time;//获取骑行时间
				   	var seconds = Math.ceil(time/60)+15;
				   	$(dom).next().val(distance); 
				   //	alert("time"+time);
				   //$(dom).parent().next().children(".send-time").children(".i-poi-timer").html(seconds);
				   	$(dom).parent().next().find(".i-poi-timer").html(seconds);
					if(dis>5000){
						$(dom).parents(".rest-li").css("display", "none");
					}
				});
		});
				
				
    </script>
	
      <!-- <li class="rest-separate j-rest-separate loading" id="loading">
          <div class="isloading">点击加载更多商家</div>
      </li> -->
    </ul>
  </div>
</div>

      </div>
    </div>
    
    <div class="csr-footer-container">
        <div class="middle-line"></div>
        <div class="csr-footer">
            <div class="footer-content">
                <div class="top">
                    <div class="left">
                        <ul class="col1">
                            <li>开放平台</li>
                            <li>媒体报道</li>
                            <li>资质规则</li>
                            <li>入驻加盟</li>
                        </ul>
                        <ul class="col2">
                            <li>常见问题</li>
                            <li>用户反馈</li>
                            <li>诚信举报</li>
                            <li>加入我们</li>
                        </ul>
                    </div>
                    <div class="middle">
                        <div class="cooperation">
                            <div class="title">品牌合作</div>
                            <div class="content">wpbg.marketing@haochi.com</div>
                        </div>
                        <div class="client-service">
                            <div class="title">客服 1010-9777</div>
                            <div class="content">周一至周日 9:00~23:00<br>客服不受理商务合作</div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="right-title">更多商家，更多优惠</div>
                        <div class="QR-code">
                            <div class="QR-code1"></div>
                            <div class="QR-code2"></div>
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <span class="copyright">©️ haochi.com 京ICP证070791号 </span>
                    <div class="img"></div>
                    <span class="police">京公网安备11010502025545号</span>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>