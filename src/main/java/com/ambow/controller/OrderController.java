package com.ambow.controller;


import com.ambow.pojo.Order;
import com.ambow.pojo.Product;
import com.ambow.pojo.Purse;
import com.ambow.pojo.User;
import com.ambow.service.OrderService;
import com.ambow.service.ProductService;
import com.ambow.service.PurseService;
import com.ambow.util.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderservice;

    @Resource
    private  ProductService productService;

    @Resource
    private PurseService purseService;

    @RequestMapping("/addOrder.do" )
    public String addOrder(@RequestParam(name = "dealAddress",required = true)String dealaddres, @RequestParam(name = "dealDate",required = true)String dealdate, @RequestParam(name = "pid",required = true)String pid, @RequestParam(name = "uid",required = true)String uid, Order order, HttpServletRequest request, HttpServletResponse res) throws IOException {
        User user=(User)request.getSession().getAttribute("userLogin");
        int id=Integer.parseInt(pid);
        Product product=productService.getAllProductBypid(id);
        Purse purse=purseService.getPurseByUserId(user.getUser_id());

        if (product.getPrice()>purse.getBalance()){
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/html; charset=UTF-8"); //转码
            res .setHeader("Cache-Control", "no-cache");
            PrintWriter out = res.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('您的余额不足。请先充值');");

            out.println("</script>");
            return "mypurse";
        }else{
            purse.setBalance(purse.getBalance()-product.getPrice());

            order.setOid(UUIDUtils.getId());
            System.out.println(product.getPrice()+"+++++++++++++++++++++++++++");
            order.setOrder_price(product.getPrice());
            order.setBuy_uid(user.getUser_id());
            order.setSell_uid(uid);
            order.setDealAddress(dealaddres);
            order.setDealdate(dealdate);
            Date date = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String order_date = sdf.format(date);
            order.setOrder_date(order_date);
            order.setOrder_state(0);
            orderservice.addOrder(order);
            product.setStatus(0);
            productService.updateProduct(product);
            purseService.updatePurse(purse);

            return "order";
        }



    }


    @RequestMapping("/getMyOrder.do")
    public ModelAndView getMyOrder(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        User user= (User) request.getSession().getAttribute("userLogin");
        String uid=user.getUser_id();
        List<Order> buyOrderList=orderservice.getMybuyOrder(uid);
        List<Order> sellOrderList=orderservice.getMysellOrder(uid);
        mv.addObject("buyOrderList",buyOrderList);
        mv.addObject("sellOrderList",sellOrderList);
        mv.setViewName("myOrder");
        return mv;

    }

    @RequestMapping("/getAllOrder.do")
    public ModelAndView getAllAlder(){
        ModelAndView mv=new ModelAndView();
        List<Order> orders=orderservice.getAllOrder();
        mv.addObject("orders",orders);
        mv.setViewName("admin/order_list");
        return mv;
    }




}
