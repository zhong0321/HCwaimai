<<<<<<< HEAD



=======
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
>>>>>>> 809ad917c907406bd233b3dbbc7d0d195833928d
public class Test {
	public static String request(String httpUrl, String httpArg) {
		BufferedReader reader = null;
		String result = null;
		StringBuffer sbf = new StringBuffer();
		httpUrl = httpUrl + "?" + httpArg;
		try {
			URL url = new URL(httpUrl);	
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			// 填入apix-key到HTTP header	        
			connection.connect();
			InputStream is = connection.getInputStream();
			reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String strRead = null;
			while ((strRead = reader.readLine()) != null) {
				sbf.append(strRead);
				sbf.append("\r\n");
				}
			reader.close();
			result = sbf.toString();
			
		} catch (Exception e) {	
			e.printStackTrace();
			}	    
		return result;
			}		
	public static void main(String[] args) {
<<<<<<< HEAD
		
=======
		//发送 GET 请求		
		String httpUrl = "http://api.avatardata.cn/IdCardCertificate/Verify";
		String httpArg = "key=***************************&realname=高令辉&idcard=41272420001218629X";
		String jsonResult = request(httpUrl, httpArg);
		System.out.println(jsonResult);
>>>>>>> 809ad917c907406bd233b3dbbc7d0d195833928d
	}
	
}
