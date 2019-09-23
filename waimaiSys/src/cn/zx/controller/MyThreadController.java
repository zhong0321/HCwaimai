package cn.zx.controller;

import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zx.entity.Comment;
import cn.zx.entity.Order;
import cn.zx.service.CommentService;
import cn.zx.service.OrderService;
import cn.zx.service.impl.CommentServiceImpl;
import cn.zx.service.impl.OrderServiceImpl;
/**
 * Created by Administrator on 2018/6/28 0028.
 * 自定义任务
 */
@Component
public class MyThreadController implements Runnable {
	//@Resource
	private OrderService orderService;
	//@Resource
	private CommentService commentService;
	
	
    /*private AtomicInteger atomicInteger = null;
    private Random random = null;*/
    private Integer orderId=null;
    public MyThreadController(){
    	
    }
    public MyThreadController(Integer id,OrderService orderService,CommentService commentService) {
      /*  atomicInteger = new AtomicInteger(0);
        random = new Random();*/
        orderId=id;
        this.orderService = orderService;
        this.commentService = commentService;
    }
    
    @Override
    public void run() {
        try {
            System.out.println("任务执行开始:" + new Date());
            /**使用随机延时[0-3]秒来模拟执行任务*/
            /*int sleepNumber = random.nextInt(3);
            TimeUnit.SECONDS.sleep(sleepNumber);*/
            
            System.out.println(orderId);
            
            //查询订单状态，如果订单未评价，默认评价
            Order order = orderService.findById(orderId);
            System.out.println(order);
            if(order.getOrderState()==5){
            	System.out.println("添加。。。。。");
            	Comment comment=new Comment();
            	comment.setOrderId(order.getId());
            	comment.setStoreId(order.getStoreId());
            	comment.setUserId(order.getUserId());
            	comment.setCommentlv(10);
            	commentService.addComment(comment);//添加评价
            	order.setOrderState(7);
            	orderService.updateOrderState(order);//修改订单状态为已自动评价
            }
            
            System.out.println("任务执行完毕:" + new Date());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}