			$(function(){
				document.getElementById('zhezhao').style.display="none";
				document.getElementById('zhe').style.display="none";
			});
			function dianwo(){
				document.getElementById('zhezhao').style.display="";
				document.getElementById('zhe').style.display="";
			}
			function hidder(){
				document.getElementById('zhezhao').style.display="none";
				document.getElementById('zhe').style.display="none";
			}
			
			function xiajia(){
				
			}
			
			
			
			function addtype(){
				var storeid=$("#storeid").val();
				var con=$(".text").val();
				if(con!=""&&con!=null){
					$.ajax({
			            url: '../../../findAllFoodType',
			            type: 'post',
			            data: "foodType="+con,
			            success:function(datas){
			            	//查询全部分类里有没有，有返回id，没有返回0
			              	if(datas==0){
			              		$.ajax({
			              			url:'../../../addFoodTypes',
			              			type:'post',
			              			data: "foodType="+con,
			              			success:function(data){
			              			//添加分类，添加成功返回1 失败返回0
			              				if(data==1){
			              					$.ajax({
						              			url:'../../../findAllFoodType',
						              			type:'post',
						              			data: "foodType="+con,
						              			success:function(data){
						              			//查询类型id找到返回id 没有找到返回0
						              				if(data!=0){
						              					$.ajax({
									              			url:'../../../addStoreStoretypes',
									              			type:'post',
									              			data: "storeId="+storeid+"&storeTypeId="+data,
									              			success:function(data){
									              				//添加中间表数据成功返回1失败返回0
									              				if(data==1){
									              					alert("添加成功！");
									              					window.location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
									              				}
									              			}
								              			});
						              				}
						              				
						              			}
					              			});
			              				}
			              			}
			              		});
			              	}else{
			              		$.ajax({
									url:'../../../findfoodTypes',
									type:'post',
									data: "storeId="+storeid+"&foodType="+datas,
									success:function(data){
									//查询店铺里有没有这个分类没有返回0 有返回1
										if(data==0){
											$.ajax({
												url:'../../../addStoreStoretypes',
												type:'post',
												data: "storeId="+storeid+"&storeTypeId="+datas,
												success:function(data){
													if(data==1){
														alert("添加成功");
														window.location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
													}else{
														alert("添加失败");
													}
												}
											});
										}else{
											alert("分类已存在");
											window.location.href="http://localhost:8080/waimaiSys/findfoodtype/"+storeid+"/0/0";
										}
									}
								});
			              	}
			            }
		        	});
				}else{
					$(".text").css({"border":"1px red solid"});
				}
			}