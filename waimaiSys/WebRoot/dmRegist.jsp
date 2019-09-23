<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="cp" value="<%=basePath%>"/><!-- 获取项目访问路径http://localhost:8080/waimaiSys/ -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title></title>
    <style>
        body{
            background: #f2f1f6;
            background: url("static/files/waimaiBackground_500950652.jpg") no-repeat;
            background-size: 100% auto;
			overflow: hidden;
        }
        .regist{
            background: white;
            width: 90%;
            border-radius: 20px 20px;  
            padding: 1.2rem;
            margin: 2rem auto;
            font-size: 1rem;
        }
        input{
            border: 0;
            outline: none;
            background-color: rgba(0, 0, 0, 0);
            width: 60%;
        }
        .regist div{
            border-bottom: solid 0.12rem #f2f1f6;
            height: 3rem;
            line-height: 3rem;
        }
        .regist .registBtn{
            color: white;
            font-size: 1.1rem;
            border: none;
            background: #029ff9;
            width: 20rem;
            height: 3rem;
            border-radius: 80px 80px;
            margin: 2rem 1rem 0rem 0rem;
        }
        .checkNum input{
            
        }
        .checkNum .checkNumBtn{
            border: none;
            color: #464759;
            background: white;
        }
        .title{
            font-size: 1.2rem;
            height: 3rem;
            line-height: 3rem;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
        }
        .goLoginP{
        	text-align: center;
        	color: gray;
        	font-size: 14px;
        }
        .goLoginP a {
        	/* color: gray; */
        }
        .goLoginP a:hover{
        	color: #e04b38;
        }
        .amap_lib_placeSearch_poi,.poi-img,.poi-title .poi-more,.poi-info .poi-tel,.amap_lib_placeSearch_page{
        	display: none;
        }
        .amap_lib_placeSearch_ul{
        	overflow: auto;
        	
        }
        .amap_lib_placeSearch .poibox {
		    padding: 3px 0 3px 0px;
		}
		.amap-sug-result{
			border: 1px solid black;
    		border-radius: 3px;
    		position: fixed;
    		width:80%;
    		right:100px;
    		margin: 12px 300px 0px 0px;
		}
		
		
    </style>
	<script type="text/javascript" src="${cp}static/js/lib/jquery.js"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript">
	
	//地图加载
	var map = new AMap.Map("container", {
	    resizeEnable: true
	});
	
	function addressChange(){
		$("#panel").css("display","block");
		var commonlyAddress=$("#commonlyAddress").val();
		
	    var autoOptions = {
	    	city: "北京",
	        input: "commonlyAddress"
	    };
	    var auto = new AMap.Autocomplete(autoOptions);
	    var placeSearch = new AMap.PlaceSearch({
	    	city: "北京",
	    	citylimit: true,
	        panel: "panel"
	    }); 
	    AMap.event.addListener(auto, "select", function(e){
	    	//逆地理编码
	    	AMap.plugin('AMap.Geocoder', function() {
			  var geocoder = new AMap.Geocoder({
			    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
			    city: "北京" 
			  });
			 
			  geocoder.getAddress(e.poi.location, function(status, result) {
			    if (status === 'complete' && result.info === 'OK') {
			        // result为对应的地理位置详细信息
			        var address = result.regeocode.formattedAddress;
			        $("#xiangxi").val(address);
			    }
			  });
			});
	  	}); 
	  	
	  	
	  	
	}
	
	/* //实现密码可见性切换     获取input框内的切换图片id和input文本框的id
	 var demoImg = document.getElementById("showText");
	 var demoInput = $("#dmPassword").attr();
	 alert(demoInput);
	 function hideShowPsw() {
	  if (demoInput.attr() == "password") {
	   demoInput.type = "text";
	   demoImg.src ="../static/files/passwordLook.png";
	  } else {
	   demoInput.type = "password";
	   demoImg.src = "../static/files/passwordNoLook.png";
	  }
	 } */
	 
	 //验证手机号是否重复
	 function checkPhone(){
	 	var dmPhone=$("#dmPhone").val();
	 	var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
	 	var state;
	    if (!reg.test(dmPhone)) {
	    	ShowDiv('MyDiv1','fade1','手机号格式有误！');
	      	return false;
	    } else {
	    	$.ajax({
				   type: "POST",
				   url: "/waimaiSys/dmLogin/checkPhone",
				   data: {"dmPhone":dmPhone},
				   async:false,
				   success: function(obj){
				   		state=obj;
				   }
			});
			alert(state);
			if(state==0){
					return true;
			}else if(state==1){
					ShowDiv('MyDiv1','fade1','该手机号已被注册！');
					return false;
			}
	    }
	 	
	 }
	 
	 //是否为空
	 function isNull(){
	 	var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/;
	 	var dmPhone=$("#dmPhone").val();
	 	var dmName=$("#dmName").val();
	 	var yanzhengma=$("#yanzhengma").val();
	 	var dmPassword=$("#dmPassword").val();
	 	var commonlyAddress=$("#commonlyAddress").val();
	 	if(dmName==null || dmName=="" ||yanzhengma==null || yanzhengma=="" ||dmPassword==null || dmPassword=="" ||commonlyAddress==null || commonlyAddress==""){
	 		ShowDiv('MyDiv1','fade1','请完整填写信息！');
	 		return false;
	 	}else if(!reg.test(dmPassword)){
	 		ShowDiv('MyDiv1','fade1','密码必须是8-20位的数字或字母！');
	 		return false;
	 	}else{
	 		return true;
	 	}
	 
	 }
	 
	 //发送验证码
	 function sendYanZhengMa(){
	 	var dmPhone=$("#dmPhone").val();
	 	var random = Math.floor(Math.random()*100000)+100000;
	 	$("#maTrue").val("123456");
	 	$.ajax({
			type: "POST",
			url: "/waimaiSys/Obtain",
			data: {"random":random,"phoneNumber":dmPhone},
			async:false,
			success: function(obj){
			}
		});
	 }
	 
	 //注册事件
	 function registEvent(){
	 	if(isNull()==true && checkPhone()==true){
	 		var dmPhone=$("#dmPhone").val();
		 	var dmName=$("#dmName").val();
		 	var yanzhengma=$("#yanzhengma").val();
		 	var dmPassword=$("#dmPassword").val();
		 	var commonlyAddress=$("#xiangxi").val();
		 	var maTrue=$("#maTrue").val();
		 	if(maTrue!=yanzhengma){
	 			ShowDiv('MyDiv1','fade1','验证码输入错误！');
	 		}else{
		 		$.ajax({
					type: "POST",
					url: "/waimaiSys/dmLogin/dmRegist",
					data: {"dmPhone":dmPhone,"dmName":dmName,"dmPassword":dmPassword,"commonlyAddress":commonlyAddress},
					async:false,
					success: function(obj){
						location.href="dmLogin.jsp";
					}
				});
			}
	 	}
	 	
	 }
	 
	 //通用单选弹框
		function ShowDiv(show_div,bg_div,str){
			document.getElementById(show_div).style.display='block';
			document.getElementById(bg_div).style.display='block' ;
			document.getElementById("fm1").innerHTML = str;
			var bgdiv = document.getElementById(bg_div);
			bgdiv.style.width = document.body.scrollWidth;
			$("#"+bg_div).height($(document).height());
		};
	 
	 
	
	</script>
</head>
<body>
    <div class="regist" style="height: 600px;">
        <header class="title">
            <span><img src="${cp}static/files/back357841524684.png" width="20px" height="20px" onclick="location.href='dmLogin.jsp'"/></span>
            <span>注册</span>
            <span>   </span>
        </header>
        <form method="post" action="" id="regForm">
        <div class="phone">
        <img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
            <input type="text" id="dmPhone" name="dmPhone" onblur="checkPhone();" placeholder="手机号" autocomplete="new-password"/><span style="color: red;font-size: 11px;"></span>
        </div>
        <div class="name">
        <img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
             <input type="text" id="dmName" name="dmName" placeholder="真实姓名" autocomplete="new-password"/>
        </div>
        <div class="checkNum">
        <img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
             <input id="yanzhengma" name="yanzhengma" type="text" placeholder="验证码" autocomplete="new-password"/><button style="margin-left: 25px;" type="button" class="checkNumBtn" onclick="sendYanZhengMa();">获取验证码</button>
            <input type="hidden" id="maTrue" autocomplete="new-password" />
        </div>
        <div class="password">
        <img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
            <input type="password" placeholder="密码必须是8-20位的数字或字母" id="dmPassword" name="dmPassword" autocomplete="new-password"/>
            <img id="showText" src="${cp}static/files/passwordNoLook.png" width="20px" height="10px" onclick="hideShowPsw()" style="margin-left: 70px;"/>
        </div>
        <div class="IDNum">
        <img src="${cp}static/files/xiaohongdiantishi51545.png" width="15px" height="15px"/>
           	 <input type="text" id="commonlyAddress" style="width: 90%;" oninput="addressChange();" placeholder="意向工作地点"/>
           	 <input type="hidden" id="xiangxi" name="commonlyAddress" />
        </div>
        <button class="registBtn" type="button" onclick="registEvent();">注册</button>
        <p class="goLoginP">已有账号，马上<a href="${cp}dmLogin.jsp">登录</a> </p>
        </form>
    </div>
    <%@include file="tyAlert.jsp" %>
    
    
</body>
</html>