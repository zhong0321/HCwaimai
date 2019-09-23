var zd;
var id=$("#store_comment").val();
var shang=$(".previous");
var xia=$(".next");
var dangqian=$(".current");
var jian=$("#jian");
var jia=$("#jia");
var getPageNum=parseInt($("#getPageNum").val()/10)+1;
$(function (){
	var first=$(".first-page");
	var id=$("#store_comment").val();
	var dq=parseInt($(".current").text());
	pinlun(1);
	zt();
	$(xia).click(function (){
		var dq=parseInt($(dangqian).text());
		$(dangqian).text(dq+1);
		pinlun(dq+1);
		zt();
	});
	
	$(first).click(function (){
		$(dangqian).text(1);
		pinlun(1);
		zt();
	});
	$(shang).click(function (){
		var dq=parseInt($(dangqian).text());
		$(dangqian).text(dq-1);
		pinlun(dq-1);
		zt();
	});
	
	$("#jia").click(function(){
		var a=$(this).text();
		$(dangqian).text(a);
		zt();
		pinlun(a);
	});
	$(".last-page").click(function(){
		$(dangqian).text(getPageNum);
		pinlun(getPageNum);
		zt();
	});

	$("#jian").click(function (){
		var a=$(this).text();
		$(dangqian).text(a);
		zt();
		pinlun(a);
	});
	
	/*$(".details").hover(function (){
		$(this).addClass("over");
		},function(){
			$(this).removeClass("over");
	});*/
});



function zt(){
	var dq= parseInt($(".current").text());
	$("#jia").text(dq+1);
	$("#jian").text(dq-1);
	if(dq==1){
		$(".first-page").hide();
		$(".previous").hide();
		jian.hide();
	}else{
		$(".first-page").show();
		$(".previous").show();
		jian.show();
	}
	if(dq==getPageNum){
		$(".last-page").hide();
		$(".next").hide();
		jia.hide();
	}else{
		$(".last-page").show();
		$(".next").show();
		jia.show();
	}
	jian.text(dq-1);
	jia.text(dq+1);
}

$("#quanbu").click(function (){
	getPageNum=parseInt($("#getPageNum").val()/10)+1;
	pinlun(1);
	$(".current").text(1);
	zt();
});
$("#chaping").click(function (){
	getPageNum=parseInt($("#bad").val()/10)+1;
	pinlun(1);
	$(".current").text(1);
	zt();
});
$("#haoping").click(function (){
	getPageNum=parseInt($("#fine").val()/10)+1;
	pinlun(1);
	$(".current").text(1);
	zt();
});

$("#has-cont").click(function (){
	pinlun(1);
	$(".current").text(1);
	zt();
});
function pinlun(num){
	var ul=$("#ul");
	$("#ul").html(" ");
	var filter=$(".filter");
	var url="";
	var nulls=0;
	if($("#has-cont").is(':checked')){
		//显示有内容的评论
		nulls=1;
	}else{
		//显示全部评论
		nulls=0;
	}
	
	for(var i=0;i<filter.length;i++){
		//判断那个单选按钮为选中状态		
		if(filter[i].checked){
			//弹出选中单选按钮的值
			switch (filter[i].value){
			case "全部":
				url="select/"+id+"/"+num+"/"+nulls;
				break;
			case "好评":
				url="selectFine/"+id+"/"+num+"/"+nulls;
				break;
			case "差评":
				url="selectBad/"+id+"/"+num+"/"+nulls;
				break;
			}
		}
	}
	$.ajax({
		type: 'post',
		url:url,
		dataType:"json",
		success:function(data){
			var aaa=$(".comment-list-wrapper");
			if(data.length==0){
				var tis='<div class="comment-list-wrapper"> <div class="none">尚无此类评价。</div></div>';
				aaa.html(tis);
				return;
			}else{
				aaa.html('<ul id="ul"></ul>');
			}
			ul=$("#ul");
           for ( var int = 0; int < data.length; int++) {
			var aa = data[int];
			var uls=$("#ul").html();
			var description="";
			if(aa.description==""){
				description="这家伙很懒什么都没写，不过我们推测应该吃的挺嗨。";
			}else{
				description=aa.description;
			}
			if(aa.commentlv<=5){
				con="差评";
			}else{
				con="好评";
			}
			var pl='<li class="reply-field"> <div class="reply-user-avatar"> <img class="user-avatar-img" src="static/images/'+aa.image+'"> </div> <div class="info clearfix"> <span class="fr time">'+aa.commentTime+'</span> <span class="name">'+aa.userName+'</span>  <span class="star-ranking">	<span class="star-score" style="width: 75px"></span>   </span>      <span class="feel">'+con+'</span> 	</div> <div class="user-reply-empty ct-lightgrey">'+description+'</div>  </li>';
			ul.html(uls+pl);
           }
        }
	});
	
}


