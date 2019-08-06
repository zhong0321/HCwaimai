package cn.zx.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.glh.config.AlipayConfig2;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

@Controller
public class AlipayController {
	@RequestMapping(value="/ali/{orderNumber}/{totalMoney}")
	@ResponseBody
	public String alipay(@PathVariable("orderNumber")String WIDout_trade_no,@PathVariable("totalMoney")String WIDtotal_amount){
		String result="";
		try {
			//获得初始化的AlipayClient
			AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig2.gatewayUrl, AlipayConfig2.APPID, AlipayConfig2.RSA_PRIVATE_KEY, "json", AlipayConfig2.CHARSET, AlipayConfig2.ALIPAY_PUBLIC_KEY, AlipayConfig2.SIGNTYPE);
			//设置请求参数
			AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
			alipayRequest.setReturnUrl(AlipayConfig2.return_url);
			alipayRequest.setNotifyUrl(AlipayConfig2.notify_url);
			//商户订单号，商户网站订单系统中唯一订单号，必填
			String out_trade_no = new String(WIDout_trade_no.getBytes("ISO-8859-1"),"UTF-8");
			//付款金额，必填
			String total_amount = new String(WIDtotal_amount.getBytes("ISO-8859-1"),"UTF-8");
			//订单名称，必填
			String subject = new String("豪吃订单");
			//商品描述，可空
			String body = new String("豪吃商品");
			alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
					+ "\"total_amount\":\""+ total_amount +"\"," 
					+ "\"subject\":\""+ subject +"\"," 
					+ "\"body\":\""+ body +"\"," 
					+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
			result = alipayClient.pageExecute(alipayRequest).getBody();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
