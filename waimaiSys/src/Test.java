
public class Test {
	public static void main(String[] args) {
		String address="河北省秦皇岛市海港区燕山大街街道秦皇岛市妇幼保健院";
<<<<<<< HEAD
		int index1=address.indexOf("市钟");
		int index2=address.indexOf("区高");
=======
		int index1=address.indexOf("市");
		int index2=address.indexOf("区高领");
>>>>>>> 52e2b46a656e554c1ac958cde71af2fa47935534
		String str=address.substring(index1+1, index2+1);
		System.out.println(str);
	}
}
