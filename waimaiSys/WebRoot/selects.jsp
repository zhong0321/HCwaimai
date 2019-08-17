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
        	<div class="csr-header">
            	<div class="header-content">
                	<a id="left" href="https://waimai.meituan.com/">
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
									    	<p class="status-pre">接受预订<span>|</span><span class="cc-lightred-new">09:40 分开始送餐</span></p>
									    </div>
	    							</div>
	    							
	    							<ul class="food-list">
	    							<c:forEach items="${list1 }" var="list1" varStatus="vs">
	    								<c:if test="${list1.storeId==li.id }">
	          							<li class="clearfix" data-poiname="${li.storeName }" data-poiid="144903552466397991" data-foodid="237145005">
	            							<a href="restaurant/findAll/${li.id}#gao${list1.id}" class="food fl" title="29超值全素套餐（送米饭1份）">
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
														(0)
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
</body></html>