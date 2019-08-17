$(function (){
	$("#sousuo").click(function (){
		var con=$("#header-search").val();
		var add=$(".current-county").text();
		var addnum=$("#lnglat").val();
		var username=$(".Verification").text();
		if(add!=""){
			if(con.trim()!=""){
				window.location.href="./selects?add="+addnum+"&vl="+con;
			}
		}else{
			alert("请选择地址");
		}
	});
});