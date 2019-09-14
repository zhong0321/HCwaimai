
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

//导航栏样式
function navStyle(e){
	$(e).parent().css({"border-bottom":"#464759 3px solid"});
	$(e).parent().siblings().css({"border-bottom":"none"});
}
