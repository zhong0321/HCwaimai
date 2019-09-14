<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<style type="text/css">
			body{
				margin: 0px;
			}
			.zhezhao{
				position: fixed;
				left: 0px;
				top: 0px;
				background: #000;
				width: 100%;
				height: 100%;
				opacity: 0.5;
			}
			.tankuang{
				position: relative;
				background: #fff;
				width: 50%;
				height:15%;
				border-radius: 5px;
				margin: 5% auto;
			}
			#header{
				height: 40px;
			}
			#header-right{
				position: absolute;
				width: 25px;
				height: 25px;
				border-radius: 5px;
				background: red;
				color: #fff;
				right: 5px;
				top: 5px;
				text-align: center;
			}
			.context{
				position: absolute;
				top:30px;
				right:30%;
			}
			.type{
				font-size: 18px;
				
			}
			.text{
				height: 35px;
				width: 250px;
				border-radius: 5px;
				border:1px  #aaa solid;
			}
			.button{
				width: 90px;
				height: 35px;
				border-radius: 5px;
				border:1px #aaa solid;
			}
		</style>
	</head>
	<body>
		<button type="button" onclick="dianwo()">点我</button>
		<div class="zhezhao" id='zhezhao'>
			<div class="tankuang">
				<div id="header">
					<div id="header-right" onclick="hidder()">x</div>
					<div class="context"><span class="type">类型：</span><input type="text" class="text"> <button class="button">添加</button></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			document.getElementById('zhezhao').style.display="none";
			function dianwo(){
				document.getElementById('zhezhao').style.display="";
			}
			function hidder(){
				document.getElementById('zhezhao').style.display="none";
			}
		</script>
	</body>
</html>


