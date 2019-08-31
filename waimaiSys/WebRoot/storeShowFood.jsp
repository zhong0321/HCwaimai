<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>豪吃外卖</title> 
    <link rel="stylesheet" href="/waimaiSys/static/css/store/showFood.css">
</head>
<body>
    <header>
        <div class="storeName">一只羊</div>
        <div class="storeInfo">sidufisjf</div>
    </header>
    <div class="bottom">
        <%@include file="storeList.jsp" %>
        <div class="right">
            <div class="foodStateType">
                <ul>
                    <li>全部（0）</li>
                    <li>售卖中（0）</li>
                    <li>已售完（0）</li>
                    <li>已下架（0）</li>
                </ul>
                <button class="addFoodBtn">新建商品</button>
            </div>
            <div class="bottomAllFood">
                <div class="leftFoodType">
                    <div>
                        <button> <strong>十</strong> &nbsp;新建分类</button>
                    </div>
                    <ul>
                        <li>本店热销 <span>（0）</span></li>
                        <li>本店热销 <span>（0）</span></li>
                        <li>本店热销 <span>（0）</span></li>
                        <li>本店热销 <span>（0）</span></li>
                    </ul>
                </div>
                <div class="rightFoodInfo">
                    <ul>
                        <li>
                            <div>
                                <img src="images/26ab5b007f4dc408ad28a1cff42f9d5b329493.jpg" alt="" width="110px;" height="79px;"/>
                            </div>
                            <div class="rightFoodInfo_center">
                                <input class="foodName" type="text"/>
                                <span>
                                    ￥ <input class="foodPrice" type="text"/>
                                    <button class="shouqing">售罄</button>
                                </span>
                            </div>
                            <div class="rightFoodInfo_last">
                                <div>
                                    <button class="xiajia">下架</button>
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
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>