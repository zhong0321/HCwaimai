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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>豪吃外卖</title>
	<link rel="stylesheet" href="${cp}static/css/page/customer/order/list.css">
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<script type="text/javascript">
		
	</script>
</head>
<body style="">
	<div class="triffle" id="triffle"></div>
	<div class="wrapper">
		<div class="csr-header">
			<div class="header-content">
				<a id="left" href="https://waimai.meituan.com/">
					<div class="logo-pic"></div>
					<div class="waimai">
						<div class="waimai-title"></div>
						<div class="waimai-slogan"></div>
					</div> </a>
				<div id="right">
					<ul id="links">
						<li data-index="0"><a href="">首页</a></li>
                        <li data-index="1"><a href="">商家入驻</a></li>
                        <li data-index="4"><a href="" class="active">点外卖</a></li>
                        <li data-index="5"><a href="">后台管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="page-wrap">
			<div class="inner-wrap">
				<div class="orders-cont clearfix">
					<div class="orders-tab fl">
						<span href="javascript:;" class="tab">
							<ul>
								<li>
									<a href="https://waimai.meituan.com/customer/order/list"
									class="borderradius-1 order-today active"><i></i>三个月订单</a></li>
							</ul> </span> <span href="javascript:;" class="tab">
							<ul>
								<li><a href="https://waimai.meituan.com/account/setting"
									class="borderradius-1 my-account "><i></i>我的账号</a></li>
								<li><a
									href="https://waimai.meituan.com/favorite/restaurant"
									class="borderradius-1 my-favorite "><i></i>我的收藏</a></li>
							</ul> </span>
					</div>

					<div class="orders-list">

						<div class="order-header">
							<span class="oh-content">订单内容</span><span class="oh-phone">商家电话</span><span
								class="oh-money">支付金额</span><!-- <span class="oh-operate">操作</span> -->
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
										<span class="order-total">${order.totalMoney}</span> 
										<span class="order-id">订单号：${order.orderNumber}</span>
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
													class="fr delivery-cost">¥ ${store.distributionMoney}</span>
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
											<i class="icon i-orderok"></i> <i class="i-orderarrow"></i> 
											<i class="icon i-orderok"></i> <i class="i-orderarrow"></i> 
											<i class="icon i-orderok"></i> <i class="i-orderarrow"></i> 
											<i class="icon i-orderok"></i> <i class="i-orderarrow"></i> 
											<i class="icon i-orderok"></i>
										</div>
										<div class="fl tips">
											<div class="step-1 ">
												<span class="fr t-1">2019-05-14 12:50</span>
												<p class="bold">订单提交成功，等待付款</p>
											</div>
											<div class="step-2 ">
												<span class="fr t-2">2019-05-14 12:50</span>
												<p class="bold">支付成功，等待商家接单</p>
											</div>
											<div class="step-3 ">
												<span class="fr t-3">2019-05-14 12:50</span>
												<p class="bold">商家接单，制作中</p>
											</div>

											<div class="step-4 ">
												<span class="fr t-delivery"></span>
												<p class="bold">美食配送中</p>
											</div>

											<div class="step-finish">
												<span class="fr t-finish">2019-05-14 13:03</span>
												<p class="bold">订单完成</p>
												<p class="sub">订单完成超过一周，评价已关闭，下次请记得早点评价哦～</p>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>



					</div>
				</div>
				<div id="anti_token"
					data-token="MfyoYCwPbTi3t8oSypDcXzm82YHr07h7h3POp1KfHHkIL3rbR4rugHois+00gVju"></div>


			</div>
		</div>
		<div class="csr-footer-container">
			<div class="middle-line"></div>
			<div class="csr-footer">
				<div class="footer-content">
					<div class="top">
						<div class="left">
							<ul class="col1">
								<li><a target="_blank"
									href="https://i.waimai.meituan.com/node/csr/openplatform">开放平台</a>
								</li>
								<li><a target="_blank"
									href="https://waimai.meituan.com/story?next_step=/newhome/news/list">媒体报道</a>
								</li>
								<li><a target="_blank"
									href="https://i.waimai.meituan.com/c/agreements/index.html">资质规则</a>
								</li>
								<li><a target="_blank"
									href="https://i.waimai.meituan.com/node/csr/joinin">入驻加盟</a></li>
							</ul>
							<ul class="col2">
								<li><a target="_blank"
									href="https://waimai.meituan.com/help/faq">常见问题</a></li>
								<li><a target="_blank"
									href="https://waimai.meituan.com/help/feedback">用户反馈</a></li>
								<li><a target="_blank"
									href="https://waimai.meituan.com/help/inform">诚信举报</a></li>
								<li><a target="_blank"
									href="https://waimai.meituan.com/help/job">加入我们</a></li>
							</ul>
						</div>
						<div class="middle">
							<div class="cooperation">
								<div class="title">品牌合作</div>
								<div class="content">wpbg.marketing@meituan.com</div>
							</div>
							<div class="client-service">
								<div class="title">客服 1010-9777</div>
								<div class="content">
									周一至周日 9:00~23:00<br>客服不受理商务合作
								</div>
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
						<span class="copyright">©️ meituan.com 京ICP证070791号 </span>
						<div class="img"></div>
						<span class="police">京公网安备11010502025545号</span>
					</div>
				</div>
			</div>
		</div>


		<script type="text/javascript">
			// 全局违禁词规定: xdd, pmm
			var forbiddenWords = [ "%E4%B9%A0%E5%A4%A7%E5%A4%A7",
					"%E4%B9%A0%E8%BF%91%E5%B9%B3",
					"%E4%B9%A0%E5%93%92%E5%93%92",
					"%E4%B9%A0%E8%BE%BE%E8%BE%BE",
					"%E5%BD%AD%E5%A6%88%E5%A6%88",
					"%E5%BD%AD%E9%BA%BB%E9%BA%BB" ];
			// SEO: 开店申请
			var kdHrefs = document.getElementsByName('kd-href');
			if (kdHrefs) {
				for ( var i = 0, l = kdHrefs.length; i < l; i++) {
					kdHrefs[i].onclick = function() {
						window.open(this.href + '?source=1');
						return false;
					};
				}
			}
		</script>

		<script type="text/javascript">
			/* 重要: 由于历史遗留原因，需要手动添加版本号, 请全局搜索版本号并替换 */
			var require = {
				urlArgs : "v=1.07",
			};
		</script>

		<script type="text/javascript"
			data-main="/static/js/page/customer/order_n"
			src="./order_files/r.js.下载"></script>


	</div>
</body>
</html>