<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<style type="text/css">
			/*begin  mask layer  begin*/
			a{
				text-decoration: none;
			}
			.black_overlay{
				width:100%; height:100%; background:url(/waimaiSys/static/files/box_bg.png) repeat center top; display:none; position:fixed; top:0%; left:0%; z-index:900;
			}
			.white_content{	
				background:url(/waimaiSys/static/files/box.png) repeat center top;
				width:340px; 
				height:auto !important; 
				min-height:100px; 
				height:100px;  
				display:none; 
				position:fixed; 
				top: 28%;
    			left: 77%;
				margin-left:-270px; 
				z-index:901;
			}
			.white_d{
				width: 320px;
			    overflow: hidden;
			    background-color: white;
			    margin: 10px;
			    /* padding-bottom: 50px;
			    position: fixed;
			    left: 18px; */
			}
			.notice_t{
				width:300px; height:30px; line-height:30px; overflow:hidden; font-size:16px; font-family:"Microsoft YaHei"; margin:1px auto;
			}
			.notice_c{
				width:320px; overflow:hidden; height: 80px;padding-left: 10px;
			}
			.notice_c #fm1{
				text-align: center;
			}
			.b_sure{
				width: 80px;
			    height: 30px;
			    line-height: 30px;
			    overflow: hidden;
			    background-color: #029ff9;
			    color: white;
			    font-size: 14px;
			    font-family: "Microsoft YaHei";
			    text-align: center;
			    float: left;
			    display: inline;
			    margin-left: 15px;
			}
			.b_sure:hover{
				color:#FFF;
			}
			.b_buy{
				width:88px; height:38px; line-height:38px; overflow:hidden; background-color:#f6f6f6; color:#ff4e00; font-size:14px; font-family:"Microsoft YaHei"; text-align:center; float:left; display:inline; margin-right:10px; border:1px solid #eaeaea;
			}
			.b_buy:hover{
				color:#ff4e00;
			}
			
			/*end  mask layer  end*/
		</style>
	</head>
	<body>
		<!--Begin 弹出层-单选通用提示框 Begin-->
	    <div id="fade1" class="black_overlay"></div>
	    <div id="MyDiv1" class="white_content">             
	        <div class="white_d">
	            <div class="notice_t">
	                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv1','fade1')">
	                <img style="float: right; margin-top: 10px;" src="/waimaiSys/static/files/close.gif" /></span>
	            </div>
	            <div class="notice_c">
	                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
	                  <tr valign="top">
	                    <td><span id="fm1">  </span></td>
	                  </tr>
	                  <tr height="50" valign="bottom">
	                    <td><a href="javascript:CloseDiv('MyDiv1','fade1')" class="b_sure">确定</a></td>
	                  </tr>
	                </table>
	            </div>
	        </div>
	    </div>    
	    <!--End 弹出层-单选通用提示框 End-->
	</body>
	<script type="text/javascript">
		function CloseDiv(show_div,bg_div)
		{
			document.getElementById(show_div).style.display='none';
			document.getElementById(bg_div).style.display='none';
		};
	</script>
</html>


