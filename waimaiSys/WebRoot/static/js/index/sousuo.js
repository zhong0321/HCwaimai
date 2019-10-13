$(function (){
	$("#sousuo").click(function (){
		var con=$("#header-search").val();
		var add=$(".current-county").text();
		var addnum=$("#lnglat").val();
		var username=$(".Verification").text();
		if(add!=""){
			if(con.trim()!=""){
				window.location.href="/waimaiSys/selects?add="+addnum+"&vl="+con;
			}
		}else{
			alert("请选择地址");
		}
	});
	
	$(".com-opt").hover(function(){
		$(this).css({"background-color":"rgb(255,140,0,0.7)","border":"1.3px #F08080 solid"});
		var aa=$(this).children("div");
		$(aa).css({"background-image":"static/images/paixubai.png"});
	},function(){
		$(".com-opt").css({"background-color":"rgb(255,165,0,0.2)"});
		$(this).css({"background-color":"rgb(255,165,0,0.2)","border":"1px #ffa735 solid"});
	});
});

