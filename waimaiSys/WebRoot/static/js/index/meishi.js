function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)
        return  decodeURI(r[2]);
      return null;
}
$(function (){
	$(".rest-list").hover(function (){
		$(this).addClass("hover");
	},function (){
		$(this).removeClass("hover");
	});
	
	var add = GetQueryString("add");
	var con = GetQueryString("vl");
	$("#ct").click(function (){
		if(add!=""){
			if(con.trim()!=""){
				window.location.href="./selects?add="+add+"&vl="+con;
			}
		}else{
			alert("请选择地址");
		}
	});
	$("#ms").click(function (){
		var add = GetQueryString("add");
		var con = GetQueryString("vl");
			if(add!=""){
				if(con.trim()!=""){
					window.location.href="./selectMs?add="+add+"&vl="+con;
				}
			}else{
				alert("请选择地址");
			}
});
});