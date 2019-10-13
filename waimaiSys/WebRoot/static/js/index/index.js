$(function (){
	var ggl=$(".list");
	var typeid="0";
	var sortypea="";
	var parameter={
			"storeTypeId":"0",
			"sorttype":"",
			"sortorder":"",
			"add":$("#lnglat").val()
	};
	sousuo(parameter);
	
	$(".imgsort-info").click(function (){
		parameter.storeTypeId=$(this).attr("data-id");
		parameter.sorttype="";
		parameter.sortorder="";
		$(ggl).html("");
		sousuo(parameter);
	});
	$(".com-opt").click(function(){
		parameter.sorttype=$(this).attr("data-type");
		$(ggl).html("");
		if(parameter.sortorder==null){
			parameter.sortorder=1;
		}else if(parameter.sortorder==1){
			parameter.sortorder=2;
		}else{
			parameter.sortorder=1;
		}
		sousuo(parameter);
	});
	function sousuo(parameter){
		$.ajax({
			url:"../storeRegist/findStoreComment",
			type:"post",
	        contentType : "application/json;charset=utf-8",
			data: JSON.stringify(parameter),
			dataType:"json",
			success:function(data){
				$(ggl).html("");
				for ( var i = 0; i < data.length; i++) {
					var lod=$(ggl).html();
		   			var aa = data[i];
		   			var li='<li class="fl rest-li"> <div class="j-rest-outer rest-outer transition"> <div data-title="'+aa.storeName+'"class="restaurant" data-all="1" data-invoice="1" data-minpricelevel="1"> <a class="rest-atag" href="http://localhost:8080/waimaiSys/restaurant/findAll/'+aa.id+'" target="_blank" data-pos="0"> <div class="top-content"> <div class="preview"> <img data-rid="144737917011462967" data-index="0" class="scroll-loading" src="http://localhost:8080/waimaiSys/static/images/'+aa.storeImg+'" data-max-width="208" data-max-height="156"> <div class="rest-tags"> </div> </div> <div class="content"> <div class="name"> <span title="'+aa.storeName+'">'+aa.storeName+'</span> </div> <div class="rank clearfix"> <span class="star-ranking fl"><!-- 5颗星72px长度，算此时星级的长度算出空白填充的部分长度 --><span class="star-score" style="width: '+(aa.commentlv/10*70)+'px"></span></span><span class="score-num fl">'+aa.commentlv+'分</span><span class="score-num fl" style="margin-left:50px;">销量:'+aa.ordrenum+'</span> </div><div class="price"><span class="start-price mtsi-num">起送:￥'+aa.startMoney+'</span> <span class="send-price mtsi-num">配送费:￥'+aa.distributionMoney+'</span><span class="send-time mtsi-num">'+Math.round((aa.juli+100)/100)/10+'km</span>	</div></div> <div class="clear"></div></div></a><a href="javascript:;" class="un-favorite j-save-up" data-poiid="144737917011462967" title="收藏商家"><i class="icon i-poi-fav1"></i></a></div></div></li>';
		   			$(ggl).html(lod+li);
				}
			}
		});
	}
});