
//展示订单详情
function showOrderDetails(orderId,e){
	var ul=$(".right .order_content ul li .hiddenContent .orderDetail ul");
	$(ul).find("li").remove();
	$.ajax({
		   type: "POST",
		   url: "../../storeOrder/showOrderDetails",
		   data: {"orderId":orderId},
		   success: function(obj){
			   	for(var i=0,l=obj.length;i<l;i++){
			   		$(ul).append("<li><span>"+obj[i].foodName+"</span><span>"+obj[i].count+"</span><span>￥"+obj[i].cost+"</span></li>");
				}
			   	$(e).css({"display":"none"});
			   	$(e).next().css({"display":"inline"});
			   	$(e).parent().next().css({"display":"block"});
		   }
	});
}

//收起订单详情
function closeOrderDetails(e){
	$(e).css({"display":"none"});
   	$(e).prev().css({"display":"inline"});
   	$(e).parent().next().css({"display":"none"});
}

//拒单事件
function refuseOrder(id,storeId){
	$.ajax({
		   type: "POST",
		   url: "../../storeOrder/findRefuseOrderNum",
		   data: {"id":id,"storeId":storeId},
		   success: function(obj){
			   	if(obj==null){
			   		alert("对不起，每日只有5次拒单机会，您的次数已达上限");
			   	}else{
			   		location.href="../../aliout/"+obj.orderNumber+"/"+obj.totalMoney+"/"+obj.id;
			   	}
		   }
	});
}



