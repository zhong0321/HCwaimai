/**
 * ҳ������ʾ��Ƹǰ�˵�bug��
 */

define(function() {
  var print = function() {
    if (window.console) {
      if (!+[1,]) {
        ;
      } else {
        console.log('���о����������Ĵ��룬���Ƿ�����ʲô���⣿���������һ��Ϊ����ש���߰ɣ�');
        console.log('������������liuye03@meituan.com');
        console.log('��ע��%c ����:console', 'color:#333;font-weight:bold;');
      }
    }
  }; 
  
  return {
    print: print
  };
});