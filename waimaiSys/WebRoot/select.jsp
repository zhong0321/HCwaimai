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
			<div class="csr-header">
				<div class="header-content">
					<a id="left" href="https://waimai.meituan.com/">
                    	<div class="logo-pic">logo</div>
                	</a>
                	<div id="right">
	                    <ul id="links">
	                        <li data-index="0"><a href="https://waimai.meituan.com/">首页</a></li>
	                        <li data-index="1"><a href="https://i.waimai.meituan.com/node/csr/joinin">入驻加盟</a></li>
	                        <li data-index="2"><a href="https://i.waimai.meituan.com/node/csr/openplatform">开放平台</a></li>
	                        <li data-index="3"><a href="https://i.meituan.com/csrpc/index.html">社会责任</a></li>
	                        <li data-index="4"><a href="https://waimai.meituan.com/new/waimaiIndex">点外卖</a></li>
	                        <li data-index="5"><a href="https://waimai.meituan.com/mobile/download/default">下载手机版</a></li>
	                    </ul>
                	</div>
            	</div>
        	</div>
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
							<!-- 
								1
								<li class="rest-list fl">  
									<a href="https://waimai.meituan.com/restaurant/144934862776944909" target="_blank">
								    	<div class="content">
											<p class="name">回头客麻辣烫</p>
								      		<p class="price ct-lightgrey">
								        		<span class="start-price">20元起送</span>
								        		<span class="send-price">7元配送费</span>
								      		</p>
								        	<p class="rank clearfix">
								          		<span class="star-ranking fl">
								  	        		<span class="star-score" style="width: 67px"></span>
								  	      		</span>
								        	</p>
								        	<p class="send-time ct-lightgrey">平均送餐时间：45分钟</p>
								    	</div>
									    <div class="discount clearfix">
									        <i class="icon i-pay fl"></i>
									      是否支持代金券
									      返
									    </div>
									</a>
								</li>
								2
								<li class="rest-list fl">  
									<a href="https://waimai.meituan.com/restaurant/144811949402850635" target="_blank">
							    		<div class="content">
							      			<p class="name">    东北麻辣烫（石佛营店
							    		...
											</p>
							      			<p class="price ct-lightgrey">
							        			<span class="start-price">15元起送</span>
							        			<span class="send-price">
							            		5元配送费
							        			</span>
							      			</p>
							          		<p class="status-pre-order cc-lightred-new">接受预订, 15:00 分开始送餐</p>
							    		</div>
							    		<div class="discount clearfix">
							        	<i class="icon i-pay fl"></i>
							
							      是否支持代金券
							      返
							    	</div>
						  			</a>
								</li>
									
									3
								<li class="rest-list fl ">  
									<a href="https://waimai.meituan.com/restaurant/144811309452702498" target="_blank">
						    			<div class="content">
						      				<p class="name">    骨味鲜麻辣烫（第5档
						    					...
											</p>
						      				<p class="price ct-lightgrey">
						        				<span class="start-price">15元起送</span>
						        				<span class="send-price">
						            				5元配送费
						        				</span>
						      				</p>
						        			<p class="rank clearfix">
						          				<span class="star-ranking fl">
						  	        				<span class="star-score" style="width: 68px"></span>
						  	      				</span>
						        			</p>
						        			<p class="send-time ct-lightgrey">
						            			平均送餐时间：49分钟
						        			</p>
						    			</div>
						    			<div class="discount clearfix">
						        			<i class="icon i-pay fl"></i>
						      是否支持代金券
						      返
						    			</div>
						  			</a>
								</li>
								4
						          <li class="rest-list fl row-last">  
						          	<a href="https://waimai.meituan.com/restaurant/144804420325147610" target="_blank">
						    			<div class="content">
							      			<p class="name">    东北麻辣烫
											</p>
						      				<p class="price ct-lightgrey">
						        				<span class="start-price">10元起送</span>
						        				<span class="send-price">
						            				4元配送费
						        				</span>
						      				</p>
						        			<p class="rank clearfix">
						          				<span class="star-ranking fl">
						  	        				<span class="star-score" style="width: 67px"></span>
						  	      				</span>
						        			</p>
						        			<p class="send-time ct-lightgrey">
						            			平均送餐时间：46分钟
						        			</p>
						    			</div>
						    			<div class="discount clearfix">
						        			<i class="icon i-pay fl"></i>
						      是否支持代金券
						      返
						    			</div>
						  			</a>
								</li>
								<li class="rest-list fl ">  
									<a href="https://waimai.meituan.com/restaurant/144686008076846089" target="_blank">
						    			<div class="content">
						      				<p class="name">    杨国福麻辣烫（国美第
						    					...
											</p>
						      				<p class="price ct-lightgrey">
						        				<span class="start-price">15元起送</span>
						        				<span class="send-price">
						            				4元配送费
						        				</span>
						      				</p>
						          			<p class="status-rest">休息中</p>
						    			</div>
						    			<div class="discount clearfix">
						        			<i class="icon i-pay fl"></i>
						      				是否支持代金券
						      				返
						    			</div>
						  			</a>
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
		                            <li><a target="_blank" href="https://i.waimai.meituan.com/node/csr/openplatform">开放平台</a></li>
		                            <li><a target="_blank" href="https://waimai.meituan.com/story?next_step=/newhome/news/list">媒体报道</a></li>
		                            <li><a target="_blank" href="https://i.waimai.meituan.com/c/agreements/index.html">资质规则</a></li>
		                            <li><a target="_blank" href="https://i.waimai.meituan.com/node/csr/joinin">入驻加盟</a></li>
		                        </ul>
		                        <ul class="col2">
		                            <li><a target="_blank" href="https://waimai.meituan.com/help/faq">常见问题</a></li>
		                            <li><a target="_blank" href="https://waimai.meituan.com/help/feedback">用户反馈</a></li>
		                            <li><a target="_blank" href="https://waimai.meituan.com/help/inform">诚信举报</a></li>
		                            <li><a target="_blank" href="https://waimai.meituan.com/help/job">加入我们</a></li>
		                        </ul>
                    		</div>
		                    <div class="middle">
		                        <div class="cooperation">
		                            <div class="title">品牌合作</div>
		                            <div class="content">wpbg.marketing@meituan.com</div>
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
	                    <div class="qualification-img"></div>
	                    <a class="police qualification-text" href="https://zzlz.gsxt.gov.cn/businessCheck/verifKey.do?showType=p&amp;serial=11000020190617181155000003571695-SAIC_SHOW_10002020190618113213545&amp;signData=MEQCIKE43iS91r/0c+M9tsrGmifFpV/Jx8E6D0K4K7qMtEobAiBEHywkTc4tGkmCy/gdbi8CxUaltTHcCRW7cMHhZz2U1A" target="_blank">北京三快在线科技有限公司</a>
	                    <span class="copyright">©️ meituan.com 京ICP证070791号 </span>
	                    <div class="img"></div>
	                    <span class="police">京公网安备11010502025545号</span>
	                </div>
            	</div>
        	</div>
    	</div>
	</div>
</body>
</html>