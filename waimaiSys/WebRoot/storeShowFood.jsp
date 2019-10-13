<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>豪吃外卖</title>

<link rel="stylesheet" href="/waimaiSys/static/css/store/showFood.css">
<script type="text/javascript"
	src="/waimaiSys/static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/waimaiSys/static/js/store/index.js"></script>
</head>
<body>
	<header>
        <div class="storeName">${store.storeName} </div>
        <div class="storeName"> <a href="${cp}index/zhuxiao/2">注销</a> </div>
    </header>
	<div class="bottom">
		<%@include file="storeList.jsp"%>
		<div class="right">
			<input type="hidden" value="${id }" id="storeid">
			<div class="foodStateType">
				<ul>
					<li><a href="../../${id }/0/0">全部（${num }）</a>
					</li>
					<li><a href="../../${id }/1/0">售卖中（${one }）</a>
					</li>
					<li><a href="../../${id }/3/0">已售完（${two }）</a>
					</li>
					<li><a href="../../${id }/2/0">已下架（${three }）</a>
					</li>
				</ul>
				<button class="addFoodBtn" id="show">新建商品</button>
			</div>
			<div class="bottomAllFood">
				<div class="leftFoodType">
					<div>
						<button id="show-addtype">
							<strong>十</strong> &nbsp;新建分类
						</button>
					</div>
					<ul>
						<c:forEach items="${findStoreFoodType }" var="list">
							<li data-gao="${list.foodTypeId}"><a
								href="../../${id }/${nums }/${list.foodTypeId}">${list.foodType
									} <span id="foodtypenum">（${list.num }）</span> </a>
									<a href="#" style="font-size: 14px;margin-right :20px; float:right; color:#ff9c00;" onclick="deletefoodtype(${id },${list.foodTypeId},${list.num });return false;">删除</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="rightFoodInfo">
					<ul>
						<c:forEach var="list" items="${findFood }">
							<li>
								<div>
									<img src="../../../static/images/${list.foodImage }"
										style="width: 110px;height: 75px" />
								</div>
								<div class="rightFoodInfo_center">
									<input class="foodName" type="text" value="${list.foodName }" />
									<span> ￥ <input class="foodPrice" type="text"
										value="${list.price }" /> 
										<c:if test="${list.fsid==1 }">
											<button class="shouqing" onclick="shouqing(${list.id})">售罄</button>
										</c:if>
										<c:if test="${list.fsid==3 }">
											<button class="shouqing" onclick="weishouqing(${list.id})">未售罄</button>
										</c:if>
									</span>
								</div>
								<div class="rightFoodInfo_last">
									<div>
										<input type="hidden" value="${list.id}">
										<c:if test="${list.fsid!=2 }">
											<button class="xiajia">下架</button>
										</c:if>
										<c:if test="${list.fsid==2 }">
											<button class="shangjia">上架</button>
										</c:if>
									</div>
									<br />
									<div class="caozuo">
										<span> <a href=""
											onclick="foodDelete(${list.id});return false;">删除</a> </span> <span>
											<a href="" onclick="updatafood(${list.id});return false;">编辑</a>
										</span>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 弹框 -->
	<div class="model" id="addtype" style="display: none">
		<div class="model-context">
			<div class="model-header">
				<h4>添加食品分类</h4>
				<button class="close">&times;</button>
			</div>
			<div class="model-body">
				<div class="body-context">
					<span>类型:</span> <input type="text" class="border-color" id="type"
						name="" placeholder="输入要添加的分类"> <span class="tips .red"></span>
				</div>
			</div>
			<div class="model-footer">
				<div class="footer-button">
					<button class="close">关闭</button>
					<button onclick="addtype()">添加</button>
				</div>
			</div>
		</div>
	</div>
	<div class="model" id="addgoods" style="display: none">
		<div class="model-context">
			<div class="model-header">
				<h4>添加商品</h4>
				<button class="close">&times;</button>
			</div>
			<div class="model-body">
				<div class="body-context">
					<table>
						<tr>
							<td><span class="red">*</span>商品名称:</td>
							<td><input class="border-color" placeholder="请输入商品名称"
								id="foodName" type="text">
							</td>
						</tr>
						<tr>
							<td><span class="red">*</span>商品类型:</td>
							<td><select class="goodsType" id="foodtype">
									<c:forEach items="${findStoreFoodType }" var="type">
										<option value="${type.foodTypeId }">${type.foodType }</option>
									</c:forEach>
							</select>
							</td>
							<!-- <td><input type="button" class="addtype" value="添加分类"></td>
                            <td><input class="border-color hide" type="text"></td> -->
						</tr>
						<tr>
							<td><span class="red">*</span>商品价格:</td>
							<td><input placeholder="请输入商品价格" class="border-color"
								id="jiae" type="text">
							</td>
						</tr>
						<tr>
							<td><span class="red">*</span>商品图片:</td>
							<td><input type="file" id="test-image-file" name="test"
								accept="image/gif, image/jpeg, image/png, image/jpg">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="model-footer">
				<div class="footer-button">
					<button class="close">关闭</button>
					<button onclick="addfood()">添加</button>
				</div>
			</div>
		</div>
	</div>

	<div class="model" id="updatafood" style="width:700px; display: none">
		<div class="model-context">
			<div class="model-header">
				<h4>编辑商品</h4>
				<button class="close">&times;</button>
			</div>
			<div class="model-body">
				<div class="body-context">
				<div class="context-left">
					<table>
						<tr>
							<td><span class="red">*</span>商品名称:</td>
							<td><input class="border-color" placeholder="请输入商品名称"
								id="foodName" type="text">
							</td>
						</tr>
						<tr>
							<td><span class="red">*</span>商品类型:</td>
							<td><select class="goodsType" id="foodtype">
									<c:forEach items="${findStoreFoodType }" var="type">
										<option value="${type.foodTypeId }">${type.foodType }</option>
									</c:forEach>
							</select>
							</td>
							<!-- <td><input type="button" class="addtype" value="添加分类"></td>
                            <td><input class="border-color hide" type="text"></td> -->
						</tr>
						<tr>
							<td><span class="red">*</span>商品价格:</td>
							<td><input placeholder="请输入商品价格" class="border-color"
								id="jiae" type="text">
							</td>
						</tr>
						<tr>
							<td><span class="red">*</span>商品图片:</td>
							<td><input type="file" id="test-image-file" name="test"
								accept="image/gif, image/jpeg, image/png, image/jpg">
							</td>
						</tr>
					</table>
					</div>
					<dir class="context-right">
						<img id="imgs" width="200px" height="200px" src="/waimaiSys/static/images/00da3a2ecb631cb21b303d45c8f7e5d270059.jpg"/>
					</dir>
				</div>
			</div>
			</form>
			<div class="model-footer">
				<div class="footer-button">
					<button class="close">关闭</button>
					<button onclick="updatafoods()">修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="zhe" id="zhe" style="display: none"></div>
</body>
</html>