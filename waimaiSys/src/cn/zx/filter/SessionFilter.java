package cn.zx.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zx.entity.Admin;
import cn.zx.entity.Car;
import cn.zx.entity.DeliveryMan;
import cn.zx.entity.Store;
import cn.zx.entity.User;
@WebFilter(value="/*")
public class SessionFilter implements Filter{
	
	public FilterConfig config;
    public void destroy() {
    	System.out.println("destroy");
        this.config = null;
    }
   /* public static boolean isContains(String container, String[] regx) {
    	System.out.println("contains");
        boolean result = false;
        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i]) != -1) {
                return true;
            }
        }
        return result;
    }*/
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		String uri = request.getRequestURI();
		User user = (User)request.getSession().getAttribute("user");//判断是否登录
		Admin admin = (Admin)request.getSession().getAttribute("admin");//判断是否登录
		DeliveryMan deliveryMan = (DeliveryMan)request.getSession().getAttribute("deliveryMan");//判断是否登录
		Store store = (Store)request.getSession().getAttribute("store");//判断是否登录
		List<Car> carList = (List<Car>) request.getSession().getAttribute("carList");//判断购物车是否为空
		

		if(uri.indexOf("gologin/1")>0)
		{
			//用户
			if(user!=null)
			{
				chain.doFilter(request, response);//放行
			}
		}else if(uri.indexOf("gologin/2")>0)
		{
			//商家
			if(store!=null)
			{
				chain.doFilter(request, response);//放行
			}
		}else
		{
			//外卖员
			if(deliveryMan!=null)
			{
				chain.doFilter(request, response);//放行
			}
		}
		
		
		if(
				uri.indexOf("car.jsp")>0||
				uri.indexOf("order.jsp")>0||
				uri.indexOf("ali")>0||
				uri.indexOf("car")>0||
				uri.indexOf("notify")>0||
				uri.indexOf("order")>0||
				uri.indexOf("return")>0
				
				)
		{
			if(user!=null || store!=null)
			{
					chain.doFilter(request, response);//放行
			}else{
				response.sendRedirect(request.getContextPath()+"/gologin/1");
			}
			//request.getRequestDispatcher(request.getContextPath()+"/gologin/1").forward(request, response);
		}else if(uri.indexOf("storeList.jsp")>0||uri.indexOf("storeOrder.jsp")>0||uri.indexOf("storeShowFood.jsp")>0||uri.indexOf("storeOrder")>0){
			if(store!=null)
			{
				chain.doFilter(request, response);//放行
			}else{
				response.sendRedirect(request.getContextPath()+"/gologin/2");
			}
		}else if(uri.indexOf("dmOrder.jsp")>0||uri.indexOf("dmOrderDetail.jsp")>0||uri.indexOf("dmOrder")>0){
			if(deliveryMan!=null)
			{
				chain.doFilter(request, response);//放行
			}else{
				response.sendRedirect(request.getContextPath()+"/dmLogin.jsp");
			}
		}else{
			chain.doFilter(request, response);
		}
		
		
		
		
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		System.out.println("init");
	}
}
