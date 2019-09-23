<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'adminInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
					<li><a href="">首页</a></li>
                    <li class="activ"><a href="admins">商家入驻审核</a></li>
				</ul>
			</div>

			<!-- 商店信息 -->
			<div
				class="col-sm-11 col-sm-offset-2 col-md-10 col-md-offset-2 sidebar mains">
				<h1 class="page-hader">店铺审核信息</h1>
				<div class="glh-div">
					<ul class="list-inline">
						<li id="storeid" style="display: none">${storeAptitude.store.id
							}</li>
						<li>商家名称: <span>${storeAptitude.store.storeName }</span>
						</li>
						<li>商家地址: <span>${storeAptitude.store.storeAddress }</span>
						</li>
						<li>商家Logo: <span><img
								src="static/images/${storeAptitude.store.storeImg }" alt="">
						</span>
						</li>
						<li>商家类型:<span><c:forEach items="${storeTypes }"
									var="type">${type.storeType }&nbsp;&nbsp;&nbsp;</c:forEach> </span>
						</li>
						<li>商家电话:<span>${storeAptitude.store.storePhone }</span>
						</li>
						<li>起送价格:<span>${storeAptitude.store.startMoney }</span>元</li>
						
						
						<li>联系人姓名:<span>${storeAptitude.linkmanName }</span></li>
						<li>法定联系人:<span>${storeAptitude.legalRepresentative }</span></li>
						<li>法定代表人身份证号:<span>${storeAptitude.IDCard }</span></li>
						<li>法人代表人手持身份证照片:<span><img alt="法人代表人手持身份证照片" src="static/images/${storeAptitude.IDCardImg }"></span></li>
						<li>银行卡号:<span>${storeAptitude.bankCard }</span></li>
						<li>营业执照号:<span> ${storeAptitude.shopCard }</span></li>
						<li>营业执照号照片:<span><img alt="" src="static/images/${storeAptitude.shopCardImg }"></span></li>
						<li>餐饮服务许可证照片:<span><img alt="" src="static/images/${storeAptitude.foodLicenceImg }"></span></li>
						<li>
							<button type="button" class="btn btn-success" onclick="tongguo()">审核通过</button>
							<button data-target="#myModal" data-toggle="modal" class="btn btn-danger">审核不通过</button></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabel">不通过理由</h4>
	            </div>
	            <div class="modal-body">
					<textarea rows="5" cols="20" id="text" style="width: 100%"></textarea>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                <button type="button" class="btn btn-primary" onclick="butongguo()">确定</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<script src="static/js/admin/jquery.js"></script>
	<script src="static/js/admin/bootstrap.js"></script>
	<script src="static/js/admin/index.js"></script>
</body>
</html>
