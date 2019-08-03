/**
 * 页面中提示招聘前端的bug。
 */

define(function() {
  var print = function() {
    if (window.console) {
      if (!+[1,]) {
        ;
      } else {
        console.log('在研究美团外卖的代码，或是发现了什么问题？不如和我们一起为她添砖加瓦吧！');
        console.log('将简历发送至liuye03@meituan.com');
        console.log('请注明%c 来自:console', 'color:#333;font-weight:bold;');
      }
    }
  }; 
  
  return {
    print: print
  };
});