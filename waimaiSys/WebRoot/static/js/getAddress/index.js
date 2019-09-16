function search(ad){
		var tipinput=$("#tipinput").val();
		var lnglat=$("#lnglat").val();
		if(tipinput!=null&&tipinput!=""){
			if(lnglat!=null&&lnglat!=""){
				$("#searchForm").submit();
			}else{
				$("#tipinput").css({"border":" 1px solid red"});
			}
		}else{
			$("#tipinput").css({"border":" 1px solid red"});
		}
	}
//地图加载
var map = new AMap.Map("container", {
    resizeEnable: true
});

var getCity=$("#city").val();
$(function(){
	//下拉框改變事件
	$(".add").change(function(){
		gao();
		var tipinput=$("#tipinput").val(" ");
		getCity=$("#city").val();
		var autoOptions = {
	    	city: getCity,
	        input: "tipinput"
	    };
	    var auto = new AMap.Autocomplete(autoOptions);
	    var placeSearch = new AMap.PlaceSearch({
	    	city: "北京",
	    	citylimit: true,
	        map: map
	    }); 
	    AMap.event.addListener(auto, 'select', function(e){
	    	document.getElementById('lnglat').value =e.poi.location;
	    	getAddress();
	  	}); 
	});
	
	
	
});

//输入提示
var autoOptions = {
	city: "北京",
    input: "tipinput"
};
var auto = new AMap.Autocomplete(autoOptions);
var placeSearch = new AMap.PlaceSearch({
	city: "北京",
	citylimit: true,//
    map: map
}); 
//获取选中地址的信息，经纬度
AMap.event.addListener(auto, 'select', function(e){
	document.getElementById('lnglat').value =e.poi.location;
	getAddress();
	});

//逆地理编码
function getAddress(){
AMap.plugin('AMap.Geocoder', function() {
  var geocoder = new AMap.Geocoder({
    // city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
    city: getCity 
  });
 
  var lnglat=$("#lnglat").val();

  geocoder.getAddress(lnglat, function(status, result) {
    if (status === 'complete' && result.info === 'OK') {
        // result为对应的地理位置详细信息
        var address = result.regeocode.formattedAddress;
        document.getElementById('address').value = address;
    }
  });
});
}

