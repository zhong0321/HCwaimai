$(function(){
    $("ul li").eq(0).hover(function (e) {
        e.preventDefault();
        $(this).tab("show");
        $(".dropdown-menu").show();
    }, function () {
        $(".dropdown-menu").hide();
    });

    $("ul li").mouseenter(function () {
        $(this).tab("show");
    });
    $(".glh-title li").mouseout(function () {
        $(this).removeClass("active");
    });
    
    
});
function tongguo(){
	var id=$("#storeid").text();
	tijiao(id,3,"");
	location.href="admins";
}
function butongguo(){
	var text=$("#text").val();
	var id=$("#storeid").text();
	tijiao(id,2,text);
	location.href="admins";
}

function tijiao(id,registState,b){
var a=false;
	$.ajax({
		url:"updateStoreRegistState",
		type:"post",
		async:false,
		data:"id="+id+"&registState="+registState+"&text="+b,
		success:function(data){
			if(data=0){
				a=false;
			}else {
				a=true;
			}
		}
	});
	return a;
}