
public class Test {
	public static void main(String[] args) {
		String address="河北省秦皇岛市海港区燕山大街街道秦皇岛市妇幼保健院";
		int index1=address.indexOf("市");
		int index2=address.indexOf("区");
		String str=address.substring(index1+1, index2+1);
		System.out.println(str);
	}
}