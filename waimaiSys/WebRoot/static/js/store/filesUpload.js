$(document).ready(function() {
     $(".fileUpload").on('change', function () {
    	 //清空预览图片
    	 var image_holder = $(".image-holder");
         image_holder.empty();
         //判断格式是否正确
    	 var name=$(".fileUpload").val();  
	     var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();  
	     if(fileName!="jpg"&& fileName !="jpeg" && fileName !="pdf" && fileName !="png" && fileName !="dwg" && fileName !="gif"){  
	       //alert(fileName); 
	     alert("格式错误");
	     $(".fileUpload").val("");  
	         return;
	     }else{
	    	 //预览图片
	    	 if (typeof (FileReader) != "undefined") {

	             var image_holder = $(".image-holder");
	             image_holder.empty();

	             var reader = new FileReader();
	             reader.onload = function (e) {
	                 $("<img />", {
	                     "src": e.target.result,
	                     "class": "thumb-image"
	                 }).appendTo(image_holder);

	             }
	             image_holder.show();
	             reader.readAsDataURL($(this)[0].files[0]);
	         } else {
	             alert("This browser does not support FileReader.");
	         }
	     }
    	 
        
    });   
});