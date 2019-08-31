package cn.glh.tools;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import cn.zx.entity.Store;
import cn.zx.entity.Store_Comment;
/**
 * 
 * 通过地图上的两个坐标计算距离（Java版本）
 * 
 * Add by 成长的小猪（Jason.Song） on 2017/11/01
 * 
 * http://blog.csdn.net/jasonsong2008
 */
public class MapHelper {
	/**
	 * 
	 * 地球半径
	 */

	private static double EarthRadius = 6378.137;

	/**
	 * 经纬度转化成弧度 Add by 成长的小猪（Jason.Song） on 2017/11/01
	 * http://blog.csdn.net/jasonsong2008
	 * 
	 * @param d
	 *            经度/纬度
	 * @return
	 */

	private static double rad(double d) {

		return d * Math.PI / 180.0;

	}

	/**
	 * 
	 * 计算两个坐标点之间的距离
	 * 
	 * Add by 成长的小猪（Jason.Song） on 2017/11/01
	 * 
	 * http://blog.csdn.net/jasonsong2008
	 * 
	 * 
	 * 
	 * @param firstLatitude
	 *            第一个坐标的纬度
	 * 
	 * @param firstLongitude
	 *            第一个坐标的经度
	 * 
	 * @param secondLatitude
	 *            第二个坐标的纬度
	 * 
	 * @param secondLongitude
	 *            第二个坐标的经度
	 * 
	 * @return 返回两点之间的距离，单位：公里/千米
	 */

	public static double getDistance(double firstLatitude,
			double firstLongitude,

			double secondLatitude, double secondLongitude) {
		double firstRadLat = rad(firstLatitude);
		double firstRadLng = rad(firstLongitude);
		double secondRadLat = rad(secondLatitude);
		double secondRadLng = rad(secondLongitude);
		double a = firstRadLat - secondRadLat;

		double b = firstRadLng - secondRadLng;

		double cal = 2
				* Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
						+ Math.cos(firstRadLat)

						* Math.cos(secondRadLat) * Math.pow(Math.sin(b / 2), 2)))
				* EarthRadius;

		double result = Math.round(cal * 10000d) / 10000d;

		return result;

	}

	/**
	 * 
	 * 计算两个坐标点之间的距离
	 * 
	 * Add by 成长的小猪（Jason.Song） on 2017/11/01
	 * 
	 * http://blog.csdn.net/jasonsong2008
	 * 
	 * 
	 * 
	 * @param firstPoint
	 *            第一个坐标点的（纬度,经度） 例如："31.2553210000,121.4620020000"
	 * @param secondPoint
	 *            第二个坐标点的（纬度,经度） 例如："31.2005470000,121.3269970000"
	 * @return 返回两点之间的距离，单位：公里/千米
	 */
	public static double GetPointDistance(String firstPoint, String secondPoint) {
		String[] firstArray = firstPoint.split(",");
		String[] secondArray = secondPoint.split(",");
		double firstLatitude = Double.valueOf(firstArray[0].trim());
		double firstLongitude = Double.valueOf(firstArray[1].trim());
		double secondLatitude = Double.valueOf(secondArray[0].trim());
		double secondLongitude = Double.valueOf(secondArray[1].trim());
		return getDistance(firstLatitude, firstLongitude, secondLatitude,
				secondLongitude);

	}

	public static List<Store_Comment> getStore(String Storeaddnum,List<Store_Comment> list){
		String Storeaddnum1="";
		if(Storeaddnum!=""&&Storeaddnum!=null){
			String[]  strs=Storeaddnum.split(",");
			Storeaddnum1=strs[1]+strs[0];
		}
		List<Store_Comment> list1 = new ArrayList<Store_Comment>();
		for (Store_Comment store2 : list) {
			String gg=store2.getCoordinate();
			String[]  strs=gg.split(",");
			String Storeaddnum2=strs[1]+strs[0];
			store2.setCoordinate(Storeaddnum2);
			double dd = GetPointDistance(Storeaddnum1, store2.getCoordinate());
			store2.setJuli(dd);
			list1.add(store2);
		}
		Collections.sort(list1);
		return list1;
		
	}
	
	public static void main(String[] args) {
		String aaa = "39.730075,116.343985";
		Store store = new Store();
		store.setStoreName("gao");
		Store store1 = new Store();
		store1.setStoreName("ling");
		store.setCoordinate("39.738295,116.339223");
		store1.setCoordinate("39.748076,116.338114");
		List<Store> list = new ArrayList<Store>();
		list.add(store);
		list.add(store1);
		
		List<Store> list3 = new ArrayList<Store>();
		for (Store store2 : list) {
			double dd = GetPointDistance(aaa, store2.getCoordinate());
			store2.setJuli(dd);
			list3.add(store2);
		}
		Collections.sort(list3);
		for (Store store2 : list3) {
			System.out.println(store2.getStoreName() + "。。。。。。"
					+ store2.getJuli());
		}
	}
}
