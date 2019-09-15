package cn.zx.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.glh.config.AlipayConfig2;
import cn.zx.websocket.MyWebSocket;
import cn.zx.entity.Order;
import cn.zx.service.OrderService;

import com.alipay.api.internal.util.AlipaySignature;

@Controller
public class ReturnUrlController {
	@Resource
	private OrderService orderService;
	
	//@Resource
	private MyWebSocket socket=new MyWebSocket();
	
	@RequestMapping("/return")
	public String ReturnUrl(HttpServletRequest request,Model model) throws Exception {
		/* *
		 * 功能：支付宝服务器同步通知页面 日期：2017-03-30 说明：
		 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
		 * 
		 * 
		 * ************************页面功能说明*************************
		 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
		 */
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter
				.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified = AlipaySignature.rsaCheckV1(params,
				AlipayConfig2.ALIPAY_PUBLIC_KEY, AlipayConfig2.CHARSET,
				AlipayConfig2.SIGNTYPE); // 调用SDK验证签名

		// ——请在这里编写您的程序（以下代码仅作参考）——
		if (signVerified) {
			// 商户订单号
			String out_trade_no = new String(request.getParameter(
					"out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no")
					.getBytes("ISO-8859-1"), "UTF-8");
			// 付款金额
			String total_amount = new String(request.getParameter(
					"total_amount").getBytes("ISO-8859-1"), "UTF-8");
			/*return "trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
					+ "<br/>total_amount:" + total_amount;*/
			Order order=new Order();
			order.setOrderNumber(out_trade_no);
			Order o = orderService.findByOrderNumber(order);//根据订单号查询订单
			order.setId(o.getId());
			order.setOrderState(1);//支付尚未接单
			orderService.updateOrderState(order);//修改订单状态为已付款
			request.getSession().setAttribute("orderID", o.getId());
			
			socket.onMessage("有新订单", null);
			
			return "redirect:order/showOrder";
		} else {
			return "验签失败";
		}
	}
}
