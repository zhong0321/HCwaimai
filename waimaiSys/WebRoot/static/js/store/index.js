$(function() {
	$("#show-addtype").click(function() {
		$(".zhe").css("display", "block");
		$("#addtype").css("display", "block");
	});
	$("#show").click(function() {
		$(".zhe").css("display", "block");
		$("#addgoods").css("display", "block");
	});
	$(".close").click(function() {
		$(".model input").val("");
		$(".model").hide();
		$(".zhe").hide();
	});
	$(".xiajia").click(function(){
		var r=confirm("确认下架?");
		if(r){
			xiajia(this);
		}
	});
	
	$(".shangjia").click(function(){
		var r=confirm("确认上架?");
		if(r){
			shangjia(this);
		}
	});
});
var foodids;
function updatafood(foodid){
	$(".zhe").css("display", "block");
	$("#updatafood").css("display", "block");
	foodids=foodid;
	$.ajax({
		url:'../../../findFoodInfo',
		type:'post',
		data:'foodid='+foodid,
		cache:false,
		async:false,
		dataType:'json',
		success:function(data){
			$("#updatafood #foodName").val(data.foodName);
			$("#updatafood #jiae").val(data.price);
			$("#updatafood #imgs").attr("src","/waimaiSys/static/images/"+data.foodImage);
			$("#updatafood #foodtype").val(data.foodTypeId);
		}
	});
}

function xiajia(el){
	var foodid=$(el).prev().val();
	if(foodid!=""){
		$.ajax({
			url:'../../../updataFoodState',
			type:'post',
			data:'foodid='+foodid+'&fsid='+2,
			cache:false,
			async:false,
			success:function(data){
				if(data==1){
					location.reload();
				}else{
					alert("下架失败");
				}
			}
		});
	}
}
function foodDelete(num){
	var r=confirm("确认删除该商品?");
	if(r){
		shanchu(num);
	}
}

function shouqing(id){
	var r=confirm("确认将该商品设为售罄?");
	if(r){
		shou(id);
	}
}
function weishouqing(id){
	var r=confirm("确认将该商品有库存?");
	if(r){
		$.ajax({
			url:'../../../updataFoodState',
			type:'post',
			data:'foodid='+id+'&fsid='+1,
			cache:false,
			async:false,
			success:function(data){
				if(data==1){
					location.reload();
				}
			}
		})
	}
}

function shou(id){
	$.ajax({
		url:'../../../updataFoodState',
		type:'post',
		data:'foodid='+id+'&fsid='+3,
		cache:false,
		async:false,
		success:function(data){
			if(data==1){
				location.reload();
			}
		}
	})
}


function shanchu(num){
	$.ajax({
		url:'../../../deleteFood',
		type:'post',
		data:'foodid='+num,
		cache:false,
		async:false,
		success:function(data){
			if(data==1){
				location.reload();
			}
		}
	});
}

function shangjia(el){
	var foodid=$(el).prev().val();
	var storeid = $("#storeid").val();
	if(foodid!=""){
		$.ajax({
			url:'../../../updataFoodState',
			type:'post',
			data:'foodid='+foodid+'&fsid='+1,
			cache:false,
			async:false,
			success:function(data){
				if(data==1){
					location.reload();
				}else{
					alert("上架失败");
				}
			}
		})
	}
}


function imgupload(e){
	var a=false;
	var formData = new FormData();
	var b="";
	if(e==1){
		b='#addgoods #test-image-file';
	}else{
		b='#updatafood #test-image-file';
	}
	formData.append("file",$(b)[0].files[0]);
	$.ajax({
		url:'../../../uploadimg',
		type:'post',
		 contentType: "application/json",
		 data: formData ,
		 processData: false ,
		 contentType: false ,
		cache:false,
		async:false,
		mimeType: "multipart/form-data",
		success:function(data){
			
		}
	});
}

function addfood() {
	var imgp = $($("#addgoods #test-image-file")).val();
	var storeid = $("#storeid").val();
	var filename=imgp.substring(imgp.lastIndexOf("\\")+1,imgp.length);
	if(foodName($("#addgoods  #foodName"))){
		if(jiae($("#addgoods  #jiae"))){
			if(img($("#addgoods  #test-image-file"))){
				 imgupload(1);
				$.ajax({
					url : '../../../addFood',
					type : 'post',
					cache : false,
					async : false,
					data : 'storeId=' + $("#storeid").val() + "&foodName=" + $("#addgoods  #foodName").val()
					+"&foodtypeid="+$("#addgoods  #foodtype").val()+"&jiage="+$("#addgoods  #jiae").val()+"&imgName="+filename,
					success:function(data){
						if(data==1){
							alert("添加成功!");
							location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
						}else{
							alert("添加失败!");
							location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
						}
					}
				});
			}
		}
	}
}

$(document).ready(function() {
    $("#updatafood #test-image-file").on('change', function () {
        //判断格式是否正确
   	 var name=$("#updatafood #test-image-file").val();  
	     var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();  
	     if(fileName!="jpg"&& fileName !="jpeg" && fileName !="pdf" && fileName !="png" && fileName !="dwg" && fileName !="gif"){  
	       //alert(fileName); 
	     alert("格式错误");
	     $("#updatafood #test-image-file").val("");  
	         return;
	     }else{
	    	 //预览图片
	    	 if (typeof (FileReader) != "undefined") {
	             var reader = new FileReader();
	             reader.readAsDataURL($("#updatafood #test-image-file")[0].files[0]);
	             reader.onload = function (e) {
	            	 $("#updatafood #imgs").attr("src",e.target.result);
	             }
	         } else {
	         }
	     }
   });
});


function updatafoods(){
	var imgp = $($("#updatafood #test-image-file")).val();
	var storeid = $("#storeid").val();
	var filename=imgp.substring(imgp.lastIndexOf("\\")+1,imgp.length);
	if(foodNames($("#updatafood  #foodName"),foodids)){
		if(jiae($("#updatafood  #jiae"))){
			if($("#updatafood  #imgs").attr("src")!=null&&$("#updatafood  #imgs").attr("src")!==""){
				imgupload(0);
				$.ajax({
					url : '../../../updataFoodInfo',
					type : 'post',
					cache : false,
					async : false,
					data : 'id=' +foodids+ "&foodName=" + $("#updatafood  #foodName").val()
					+"&foodTypeId="+$("#updatafood  #foodtype").val()+"&price="+$("#updatafood  #jiae").val()+"&foodImage="+filename,
					success:function(data){
						if(data==1){
							alert("修改成功!");
							location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
						}else{
							alert("修改失败!");
							location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
						}
					}
				});
			}
		}
	}
	
}
function foodNames(el,foodid) {
	var is = false;
	var name = $(el).val().trim();
	var storeid = $("#storeid").val();
	if (name != "") {
		$.ajax({
			url : '../../../findFoodNames',
			type : 'post',
			cache : false,
			async : false,
			data : 'storeId=' + storeid + "&foodName=" + name+"&foodid="+foodid,
			success : function(data) {
				if (data == 0) {
					is = true;
					$(el).css("border", "1px rgb(229, 233, 12) solid").attr(
							"placeholder", "请输入商品名称");
				} else {
					$(el).css("border", "1px red solid").val("").attr(
							"placeholder", "商品已存在");
					is = false;
				}
			}
		});
	} else {
		$(el).css("border", "1px red solid").attr(
				"placeholder", "请输入商品名称");
		is = false;
	}
	return is;
}
function deletefoodtype(sid,typeid,num){
		var r=confirm("这个分类下有"+num+"个商品是否全部删除?");
		if(r){
			$.ajax({
				url : '../../../deleteFoodByType',
				type : 'post',
				cache : false,
				async : false,
				data : 'storeId=' + sid + "&typeid=" + typeid,
				success:function(data){
					if(data==1){
						location.href="http://localhost:8080/waimaiSys/findfoodtype/"+sid+"/0/0";
					}
				}
			})
		}
}

function foodName(el) {
	var is = false;
	var name = $(el).val().trim();
	var storeid = $("#storeid").val();
	if (name != "") {
		$.ajax({
			url : '../../../findFoodName',
			type : 'post',
			cache : false,
			async : false,
			data : 'storeId=' + storeid + "&foodName=" + name,
			success : function(data) {
				if (data == 0) {
					is = true;
					$(el).css("border", "1px rgb(229, 233, 12) solid").attr(
							"placeholder", "请输入商品名称");
				} else {
					$(el).css("border", "1px red solid").val("").attr(
							"placeholder", "商品已存在");
					is = false;
				}
			}
		});
	} else {
		$(el).css("border", "1px red solid").attr(
				"placeholder", "请输入商品名称");
		is = false;
	}
	return is;
}

function jiae(el){
	var a=$(el).val().trim();
	var b=/^[0-9]+(.[0-9]{1})?$/;
	if(a!=""){
		if(b.test(a)){
			$(el).css("border", "1px rgb(229, 233, 12) solid").attr(
					"placeholder", "请输入商品价格");
			return true;
		}else{
			$(el).css("border", "1px red solid").attr(
					"placeholder", "请输入正常价格");
			return false;
		}
	}else{
		$(el).css("border", "1px red solid").val("").attr(
				"placeholder", "请输入商品价格");
		return false;
	}
}
function img(el){
	var imgname = $(el).val();
	if(imgname!=""){
		$(el).css("border", "");
		return true;
	}else{
		$(el).css("border", "1px red solid");
		return false;
	}
}


function addtype() {
	var storeid = $("#storeid").val();
	var con = $("#type").val();
	if (con != "" && con != null) {
		$
				.ajax({
					url : '../../../findAllFoodType',
					type : 'post',
					data : "foodType=" + con,
					success : function(datas) {
						// 查询全部分类里有没有，有返回id，没有返回0
						if (datas == 0) {
							$
									.ajax({
										url : '../../../addFoodTypes',
										type : 'post',
										data : "foodType=" + con,
										success : function(data) {
											// 添加分类，添加成功返回1 失败返回0
											if (data == 1) {
												$
														.ajax({
															url : '../../../findAllFoodType',
															type : 'post',
															data : "foodType="
																	+ con,
															success : function(
																	data) {
																// 查询类型id找到返回id
																// 没有找到返回0
																if (data != 0) {
																	$
																			.ajax({
																				url : '../../../addStoreStoretypes',
																				type : 'post',
																				data : "storeId="
																						+ storeid
																						+ "&storeTypeId="
																						+ data,
																				success : function(
																						data) {
																					// 添加中间表数据成功返回1失败返回0
																					if (data == 1) {
																						window.location.href = "http://localhost:8080/waimaiSys/findfoodtype/"
																								+ storeid
																								+ "/0/0";
																					} else {
																						$(
																								"#type")
																								.css(
																										"border",
																										"1px red solid");
																						$(
																								".tips")
																								.text(
																										"添加失败");
																					}
																				}
																			});
																}
															}
														});
											}
										}
									});
						} else {
							$
									.ajax({
										url : '../../../findfoodTypes',
										type : 'post',
										data : "storeId=" + storeid
												+ "&foodType=" + datas,
										success : function(data) {
											// 查询店铺里有没有这个分类没有返回0 有返回1
											if (data == 0) {
												$
														.ajax({
															url : '../../../addStoreStoretypes',
															type : 'post',
															data : "storeId="
																	+ storeid
																	+ "&storeTypeId="
																	+ datas,
															success : function(
																	data) {
																if (data == 1) {
																	window.location.href = "http://localhost:8080/waimaiSys/findfoodtype/"
																			+ storeid
																			+ "/0/0";
																} else {
																	$("#type")
																			.css(
																					"border",
																					"1px red solid");
																	$(".tips")
																			.text(
																					"添加失败");
																}
															}
														});
											} else {
												$("#type").css("border",
														"1px red solid").attr(
														"placeholder", "类型已存在")
														.val("");
												$(".tips").text("添加失败");
											}
										}
									});
						}
					}
				});
	} else {
		$("#type").css("border", "1px red solid");
		$(".tips").text("请输入类型");
	}
}