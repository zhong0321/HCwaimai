<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>周边检索</title>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <style type="text/css">
        #panel {
            position: fixed;
            background-color: white;
            max-height: 90%;
            overflow: auto;
            top: 10px;
            right: 10px;
            width: 300px;
            border-bottom: solid 1px silver;
        }
        .amap_lib_placeSearch_poi,.poi-img,.poi-title .poi-more,.poi-info .poi-tel,.amap_lib_placeSearch_page{
        	display: none;
        }
        .amap_lib_placeSearch_ul{
        	overflow: auto;
        }
        .amap_lib_placeSearch .poibox {
		    padding: 3px 0 3px 0px;
		}
    </style>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=c3d2b1786038ce4ac5ba21d7be2ec631"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script></head>
<body>
<div id="container" style="width: 80%;height: 80%;z-index: -1;"></div>
<div>
	请输入：<input type="text"  value="" oninput="addressChange();" >
</div>

<div id="panel"></div>



	<ul class="address-list"
		data-reactid=".0.$confirmOrder_1.$address_1.0.2">
		<li class="address-wrap default selected"
			data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0"><div
				class="addressBox"
				data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0">
				<div data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.0">
					<i class="marker"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.0.0"></i><span
						class="marker-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.0.1">寄送至</span>
				</div>
				<label class="addressInfo" for="addressInput-8603248878"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3"><input
					type="radio" name="address" id="addressInput-8603248878"
					checked="checked" data-id="8603248878"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.0"><span
					class="user-address"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1"><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.0">北京
							北京市 大兴区 观音寺街道 </span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.2">双河南里甲15-5号北大青鸟北大公学</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.3">（</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.4">钟雪</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.5"
						data-spm-anchor-id="a210c.1.0.i1.52681debn1Yu1Z"> 收）</span><em
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.1.6">13219505431</em>
				</span><span class="tips"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.2"><em
						class="default"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.2.0">默认地址</em><i
						class="success success-icon"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.2.1"></i><span
						class="success success-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.2.2">设置成功！</span>
				</span><a class="modify" href="javascript:void(0);" data-id="8603248878"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$0.0.3.3">修改本地址</a>
				</label>
			</div>
		</li>
		<li class="address-wrap"
			data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1"><div
				class="addressBox"
				data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0">
				<label class="addressInfo" for="addressInput-9171249699"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3"
					data-spm-anchor-id="a210c.1.0.i0.52681debn1Yu1Z"><input
					type="radio" name="address" id="addressInput-9171249699"
					data-id="9171249699"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.0"><span
					class="user-address"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1"><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.0">北京
							北京市 大兴区 黄村镇 </span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.2">狼垡一村，京良路口西飞慕墙</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.3">（</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.4">曾成方</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.5">
							收）</span><em data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.1.6">13552984622</em>
				</span><span class="tips"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.2"><a
						class="set-default" href="javascript:void(0);"
						data-id="9171249699"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.2.0">设置为默认收货地址</a><i
						class="failure failure-icon"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.2.1"></i><span
						class="failure failure-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$1.0.3.2.2">设置失败！</span>
				</span> </label>
			</div></li>
		<li class="address-wrap"
			data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2"><div
				class="addressBox"
				data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0">
				<label class="addressInfo" for="addressInput-7818866001"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3"><input
					type="radio" name="address" id="addressInput-7818866001"
					data-id="7818866001"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.0"><span
					class="user-address"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1"><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.0">四川省
							成都市 郫都区 郫筒街道 </span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.2">梨园路一段596号联众地产</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.3">（</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.4">钟雪</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.5">
							收）</span><em data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.1.6">13219505431</em>
				</span><span class="tips"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.2"><a
						class="set-default" href="javascript:void(0);"
						data-id="7818866001"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.2.0">设置为默认收货地址</a><i
						class="failure failure-icon"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.2.1"></i><span
						class="failure failure-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$2.0.3.2.2">设置失败！</span>
				</span> </label>
			</div></li>
		<li class="address-wrap"
			data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3"><div
				class="addressBox"
				data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0">
				<label class="addressInfo" for="addressInput-7808435497"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3"><input
					type="radio" name="address" id="addressInput-7808435497"
					data-id="7808435497"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.0"><span
					class="user-address"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1"><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.0">四川省
							成都市 郫都区 郫筒街道 </span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.2">创智南一路109号（联众地产）</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.3">（</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.4">钟雪</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.5">
							收）</span><em data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.1.6">13219505431</em>
				</span><span class="tips"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.2"><a
						class="set-default" href="javascript:void(0);"
						data-id="7808435497"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.2.0">设置为默认收货地址</a><i
						class="failure failure-icon"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.2.1"></i><span
						class="failure failure-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$3.0.3.2.2">设置失败！</span>
				</span> </label>
			</div></li>
		<li class="address-wrap"
			data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4"><div
				class="addressBox"
				data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0">
				<label class="addressInfo" for="addressInput-5749477724"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3"><input
					type="radio" name="address" id="addressInput-5749477724"
					data-id="5749477724"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.0"><span
					class="user-address"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1"><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.0">四川省
							成都市 都江堰市 大观镇 </span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.2">高尔夫大道367号</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.3">（</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.4">钟雪</span><span
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.5">
							收）</span><em data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.1.6">13219505431</em>
				</span><span class="tips"
					data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.2"><a
						class="set-default" href="javascript:void(0);"
						data-id="5749477724"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.2.0">设置为默认收货地址</a><i
						class="failure failure-icon"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.2.1"></i><span
						class="failure failure-tip"
						data-reactid=".0.$confirmOrder_1.$address_1.0.2.$4.0.3.2.2">设置失败！</span>
				</span> </label>
			</div></li>
	</ul>




	<script type="text/javascript">
	class="address-suggestlist"
	/* var map = new AMap.Map("container", {
        resizeEnable: true
    }); */
	function addressChange(){
		var input=$("input").val();
	    AMap.service(["AMap.PlaceSearch"], function() {
	        //构造地点查询类
	        var placeSearch = new AMap.PlaceSearch({ 
	            type: '', // 兴趣点类别
	            city: "北京", // 兴趣点城市
	            citylimit: true,  //是否强制限制在设置的城市内搜索
	            panel: "panel", // 结果列表将在此容器中进行展示。
	        });
	        
	        var cpoint = [116.405467, 39.907761]; //中心点坐标
	        placeSearch.searchNearBy(input, cpoint, 6000, function(status, result) {
	
	        });
	        //点击panel列表的点标记     	
	        //listElementClick--使用map、panel属性后，结果面板中POI对应的列表项被点击时触发
	        AMap.event.addListener(placeSearch,"listElementClick",function(e) {
		    	console.log(e.data.location);//当前marker的经纬度信息    
		    	console.log(e.data.address);//获取当前marker的具体地址信息    
		    	console.log(e.data);//则是包含所有的marker数据
		    	alert(e.data.name);
		    	alert(e.data.cityname+e.data.adname+e.data.address);
		    });
	        
	    });
	}
	
    
</script>
</body>
</html>