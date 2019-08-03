<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${cp}static/css/store/storeRegist.css">
	<style type="text/css">
	.thumb-image{
	 float:left;width:100px;
	 position:relative;
	 padding:5px;
	}
	</style>

  </head>
  
  <body>
    <header>
        <div class="logoDiv"></div>
        <div class="username">
           	${store.storePhone}
        </div>
    </header>
    <div class="bottom">
        <div class="content">
            <div class="titleDiv">
                <span>首页 &nbsp; > &nbsp;新建店铺 </span>
            </div>
            <div class="navDiv">
                <div>店铺信息</div>
                <div style="background: #08C1AE;">资质信息</div>
                <div>完成</div>
            </div>
            <div class="storeInfo">
                <p>带 <span class="xing">*</span> 表格为必填项</p>

                <form action="storeRegist/addStoreAptitude" method="post" id="storeAptitudeForm" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>联系人姓名</span>
                            </td>
                            <td>
                                <input name="linkmanName" size="60" type="text" placeholder="请输入联系人姓名"/>
                                <input name="storeId" value="${store.id}" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>联系人电话</span>
                            </td>
                            <td>
                                <input size="60" name="linkmanPhone" type="text" placeholder="请输入联系人电话"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>法定代表人</span>
                            </td>
                            <td>
                                <input size="60" name="legalRepresentative" type="text" placeholder="请输入法定代表人姓名"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>身份证号</span>
                            </td>
                            <td>
                                <input size="60" name="IDCard" type="text" placeholder="请输入法定代表人身份证号"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>银行账号</span>
                            </td>
                            <td>
                                <input size="60" name="bankCard" type="text" placeholder="请输入银行账号"/>
                            </td>

                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>营业执照号</span>
                            </td>
                            <td>
                                <input size="60" name="shopCard" type="text" placeholder="请输入营业执照号"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>手持身份证照片</span>
                            </td>
                            <td>
                                <input size="60" type="file" class="fileUpload" name="file"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>营业执照照片</span>
                            </td>
                            <td>
                                <input size="60" type="file" class="fileUpload" name="file"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tishi">
                                <span class="xing">*</span>
                                <span>餐饮服务许可证</span>
                            </td>
                            <td>
                                <input size="60" type="file" class="fileUpload" name="file"/>
                            </td>
                        </tr>
                        <tr class="buttonTr">
                            <td></td>
                            <td>
                                <span><button>上一步</button></span>
                                <span><button style="background: #08C1AE;">下一步</button></span>
                            </td>

                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${cp}static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${cp}static/js/store/filesUpload.js"></script>
    <script type="text/javascript">
    	//提交表单之前判断是否为空
		function checkNotNull(){
			var linkmanName=$("input[name='linkmanName']").val();
			var linkmanPhone=$("input[name='linkmanPhone']").val();
			var legalRepresentative=$("input[name='legalRepresentative']").val();
			var IDCard=$("input[name='IDCard']").val();
			var bankCard=$("input[name='bankCard']").val();
			var shopCard=$("input[name='shopCard']").val();
			var fileUpload=$(".fileUpload").val();
			if(linkmanName!=null && linkmanName!="" && linkmanPhone!=null && linkmanPhone!="" &&legalRepresentative!=null && legalRepresentative!="" 
			&&IDCard!=null && IDCard!="" &&bankCard!=null && bankCard!="" &&shopCard!=null && shopCard!="" &&fileUpload!=null && fileUpload!="" ){
				return true;
			}else{
				//ShowDiv_1('MyDiv1','fade1','除了商品描述以外的，其他均为必填项<br/>请填写完整的商品信息');
				return false;
			}
		}
		
		function checkPhone(){
			var linkmanPhone=$("input[name='linkmanPhone']").val();
			var ref="/^1[3456789]\d{9}$/";
			if(ref.test(linkmanPhone)){
				return true;
			}else{
				return false;
			}
		}
		
		function formSubmit(){
			if(checkNotNull()){
				if(checkPhone()){
					$("#storeAptitudeForm").submit();
				}else{
					alert("手机号格式错误！");
				}
			}else{
				alert("请填写完整的信息！");
			}
		}
    
    </script>
  </body>
</html>
