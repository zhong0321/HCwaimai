package cn.zx.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.glh.config.AlipayConfig2;

import cn.zx.entity.Order;
import cn.zx.service.OrderService;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
@Controller
public class AlipayOutController {

	@Resource
	private OrderService orderService;
	
	@RequestMapping(value="/aliout/{orderNumber}/{qian}/{id}")
	public String alipay(@PathVariable("orderNumber")String WIDout_trade_no,@PathVariable("qian")String qian,@PathVariable("id")Integer id,HttpServletRequest request){
		String path = request.getContextPath();
		String cp=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		Date t=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.format(t);
		String result="";
		try {

			//获得初始化的AlipayClient
			AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig2.gatewayUrl, AlipayConfig2.APPID, AlipayConfig2.RSA_PRIVATE_KEY, "json", AlipayConfig2.CHARSET, AlipayConfig2.ALIPAY_PUBLIC_KEY, AlipayConfig2.SIGNTYPE);
			
			//设置请求参数
			AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
			
			//商户订单号，商户网站订单系统中唯一订单号
			String out_trade_no = new String(WIDout_trade_no.getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String("".getBytes("ISO-8859-1"),"UTF-8");
			//请二选一设置
			//需要退款的金额，该金额不能大于订单金额，必填
			String refund_amount = new String(qian.getBytes("ISO-8859-1"),"UTF-8");
			//退款的原因说明
			String refund_reason = new String("".getBytes("ISO-8859-1"),"UTF-8");
			//标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
			String out_request_no = new String("1".getBytes("ISO-8859-1"),"UTF-8");
			
			alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
					+ "\"trade_no\":\""+ trade_no +"\"," 
					+ "\"refund_amount\":\""+ refund_amount +"\"," 
					+ "\"refund_reason\":\""+ refund_reason +"\"," 
					+ "\"out_request_no\":\""+ out_request_no +"\"}");

			
			//请求
			result = alipayClient.execute(alipayRequest).getBody();

			//输出
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//输出

		
		Order order = new Order();
		order.setId(id);
		order.setOrderState(13);
		orderService.updateOrderState(order);//修改订单状态为退款成功
		
		return "redirect:"+cp+"/storeOrder/showStoreOrder/99";

	}
}
