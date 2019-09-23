	function getQueryVariable(variable)
	{
	       var query = window.location.search.substring(1);
	       var vars = query.split("&");
	       for (var i=0;i<vars.length;i++) {
	               var pair = vars[i].split("=");
	               if(pair[0] == variable){return pair[1];}
	       }
	       return(false);
	}
	
	$(function(){
		var inp=$("#phone").val();
		$.ajax({
			url: 'findstorebyPhone',
			type: 'post',
			async: true,
			data: {"phone":inp},
			success:function(data){
				if(data==2){
					$("#tsss").html("您的入驻申请失败请重新请求！");
					$("#shenheResend").css("display","block");
					$(".button").show();
				}else{
					$("#tsss").html("您的入驻申请已提交！请等待审核结果！<br/>工作人员会在1~3个工作日内对您的信息进行审核，请耐心等待。");
					$(".button").css({"display":"none"});
				}
			}
		});
	});