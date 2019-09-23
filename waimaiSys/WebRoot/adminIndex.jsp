<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>豪吃外卖</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="static/bootstrap/bootstrap.css">
<link rel="stylesheet" href="static/css/admin/index.css">
<script type="text/javascript" src="static/js/admin/jquery.js"></script>
<script type="text/javascript" src="static/js/bootstrap/bootstrap.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a href="#" class="navbar-brand"> <img class="logo"
			src="static/images/mrlogo.png" alt="logo"> </a>
	</div>
	<div class="glh-title">
		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item"><a href="#"> <img
					src="static/images/logo.png" class="nav-header-img" alt="logo">
					北大青鸟 </a></li>
			<li class="nav-item"><a href=""> 消息 <span class="badge">42</span>
			</a></li>
			<li class="nav-item"><a href=""> shuaishuai </a></li>
			<li class="nav-item"><a href="">退出登录</a></li>
		</ul>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1 col-md-2 sidebar menu-lefts">
				<ul class="nav  nav-sidebar ziji">
					<li class="activ"><a href="">首页</a>
					</li>
					<li><a href="admins">商家入驻审核</a>
					</li>
				</ul>
			</div>
			<!-- 首页 -->
			<div
				class="col-sm-11 col-sm-offset-2 col-md-10 col-md-offset-2 mains sidebar">
				<h1 class="page-hader">数据</h1>
				<div class="row placeholders">
					<div class="col-md-3">
						<div>
							<img src="static/images/mrlogo.png" alt="">
						</div>
						<h5>订单数</h5>
					</div>
					<div class="col-md-3">
						<div>
							<img src="static/images/mrlogo.png" alt="">
						</div>
						<h5>订单数</h5>
					</div>
					<div class="col-md-3">
						<div>
							<img src="static/images/mrlogo.png" alt="">
						</div>
						<h5>订单数</h5>
					</div>
					<div class="col-md-3">
						<div>
							<img src="static/images/mrlogo.png" alt="">
						</div>
						<h5>订单数</h5>
					</div>
				</div>
				<h1 class="page-hader">店铺Top100</h1>
				<div class="">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th>排行</th>
								<th>店铺名称</th>
								<th>订单数量</th>
								<th>店铺类型</th>
								<th>开店时间</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<th>北京烤鸭</th>
								<th>9999</th>
								<th>精品</th>
								<th>2019-12-12</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="static/js/admin/jquery.js"></script>
	<script src="static/js/admin/bootstrap.js"></script>
	<script src="static/js/admin/index.js"></script>
</body>
</html>
