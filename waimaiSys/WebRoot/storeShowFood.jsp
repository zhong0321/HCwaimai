<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title> 
    <link rel="stylesheet" href="/waimaiSys/static/css/store/showFood.css">
    	<script type="text/javascript" src="/waimaiSys/static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/waimaiSys/static/js/store/index.js"></script>
</head>
<body>
    <header>
        <div class="storeName">一只羊</div>
        <div class="storeInfo">sidufisjf</div>
    </header>
    <div class="bottom">
        <%@include file="storeList.jsp" %>
        <div class="right">
        <input type="hidden" value="${id }" id="storeid">
            <div class="foodStateType">
                <ul>
                    <li><a href="../../${id }/0/0">全部（${num }）</a></li>
                    <li> <a href="../../${id }/1/0">售卖中（${one }）</a></li>
                    <li><a href="../../${id }/3/0">已售完（${two }）</a></li>
                    <li><a href="../../${id }/2/0">已下架（${three }）</a></li>
                </ul>
                <button class="addFoodBtn">新建商品</button>
            </div>
            <div class="bottomAllFood">
                <div class="leftFoodType">
                    <div>
                        <button onclick="dianwo()" > <strong>十</strong> &nbsp;新建分类</button>
                    </div>
                    <ul>
                    <c:forEach items="${findStoreFoodType }" var="list">
                    	<li data-gao="${list.foodTypeId}"><a href="../../${id }/${nums }/${list.foodTypeId}">${list.foodType } <span>（${list.num }）</span></a></li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="rightFoodInfo">
                    <ul>
                    <c:forEach var="list" items="${findFood }">
                        <li>
                            <div>
                                <img src="../../../static/images/${list.foodImage }" style="width: 110px;height: 75px"/>
                            </div>
                            <div class="rightFoodInfo_center">
                                <input class="foodName" type="text" value="${list.foodName }"/>
                                <span>
                                   	 ￥ <input class="foodPrice" type="text" value="${list.price }"/>
                                    <button class="shouqing">售罄</button>
                                </span>
                            </div>
                            <div class="rightFoodInfo_last">
                                <div>
	                                <c:if test="${list.fsid!=2 }">
	                                	 <button class="xiajia">下架</button>
	                                </c:if>
	                                <c:if test="${list.fsid==2 }">
	                                   	<button class="shangjia">上架</button>
	                                </c:if>
                                </div>
                                <br/>
                                <div class="caozuo">
                                    <span>
                                        <a href="">删除</a>
                                    </span>
                                    <span>
                                        <a href="">编辑</a>
                                    </span>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    		
		<div class="zhezhao" id='zhezhao'>
			<div class="tankuang">
				<div id="header">
					<div id="header-right" onclick="hidder()">x</div>
					<div class="context">
							<span class="type">类型：</span>
							<input type="text" class="text" placeholder="请输入食品类型">
							<button class="button" onclick="addtype()">添加</button>
					</div>
				</div>
			</div>
		</div>
		<div class="zhe" id="zhe"></div>
</body>
</html>