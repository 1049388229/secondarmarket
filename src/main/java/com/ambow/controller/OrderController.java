package com.ambow.controller;


import com.ambow.pojo.*;
import com.ambow.service.OrderService;
import com.ambow.service.ProductService;
import com.ambow.service.PurseService;
import com.ambow.service.UserService;
import com.ambow.util.UUIDUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderservice;

    @Resource
    private  ProductService productService;

    @Resource
    private PurseService purseService;

    @Resource
    private UserService userService;

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
            order.setPname(product.getName());
            order.setPprice(product.getPrice());
            order.setPimage(product.getImage());
            order.setOid(UUIDUtils.getId());
            order.setOrder_price(product.getPrice());
            order.setBuy_uid(user.getUser_id());
            order.setSell_uid(uid);
            order.setDealAddress(dealaddres);
            order.setDealdate(dealdate);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String order_date = sdf.format(date);
            order.setOrder_date(order_date);
            order.setOrder_state(0);
            try{
                orderservice.addOrder(order);
                product.setStatus(0);
                productService.updateProduct(product);
                purseService.updatePurse(purse);
                res.setCharacterEncoding("utf-8");
                res.setContentType("text/html; charset=UTF-8"); //转码
                res .setHeader("Cache-Control", "no-cache");
                PrintWriter out = res.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('支付成功');");
                out.println("</script>");
            }catch (Exception e){
                res.setCharacterEncoding("utf-8");
                res.setContentType("text/html; charset=UTF-8"); //转码
                res .setHeader("Cache-Control", "no-cache");
                PrintWriter out = res.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('支付失败');");
                out.println("history.back();");
                out.println("</script>");
            }

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
    public ModelAndView getAllAlder(@RequestParam(name = "page" ,required = true,defaultValue = "1")int page,@RequestParam(name = "size" ,required = true,defaultValue = "10")int size){
        ModelAndView mv=new ModelAndView();
        List<Order> listOrder=orderservice.selectAllOrder(page,size);
        PageInfo pageInfo=new PageInfo(listOrder);
        mv.addObject("orders",pageInfo);
        mv.setViewName("admin/order_list");
        return mv;
    }





    @RequestMapping("/getOrderInformationByOid.do")
    public ModelAndView getOrderInformationByOid(@RequestParam(name = "oid")String oid){
        Order order=orderservice.getOrderInformationByOid(oid);
        User buyUser=userService.selectUserbyid(order.getBuy_uid());
        User sellUser=userService.selectUserbyid(order.getSell_uid());
        ModelAndView mv=new ModelAndView();
        mv.addObject("order",order);
        mv.addObject("buyUser",buyUser);
        mv.addObject("sellUser",sellUser);
        mv.setViewName("admin/orderInformation");
        return mv;
    }

    /**
     * 通过ID查询订单
     */
    @RequestMapping("/getOrderByOid.do")
    public ModelAndView getOrderByOid(@RequestParam(name = "oid")String oid){
        Order order=orderservice.getOrderInformationByOid(oid);
        ModelAndView mv=new ModelAndView();
        mv.addObject("orderByOid",order);
        mv.setViewName("admin/order_update");
        return mv;
    }


    /**
     * 修改订单
     */
    @RequestMapping("/updateOrder.do")
    @ResponseBody
    public Map<String,String> updateCategoryBycid(@RequestParam(name = "oid") String  oid, @RequestParam(name = "dealdate") String dealdate, @RequestParam(name = "dealAddress") String dealAddress,@RequestParam(name = "order_state")int order_state ){
        String flag = "0";
        String msg = "0";
        Order order=orderservice.getOrderByOid(oid);
        String user_id=order.getSell_uid();
        Purse purse=purseService.getPurseByUserId(user_id);

        if (order.getOrder_state()==1&&order_state==0){
            msg="系统错误";
            flag="5";
        }else if(order.getOrder_state()==2&&order_state==1){
            msg="系统错误";
            flag="5";
        }else if (order.getOrder_state()==2&&order_state==0){
            msg="系统错误";
            flag="5";
        }else if(order.getOrder_state()==0&&order_state==2){
            msg="系统错误";
            flag="5";
        }else if (order.getOrder_state()==1&&order_state==2){
            order.setOid(oid);
            order.setDealdate(dealdate);
            order.setDealAddress(dealAddress);
            order.setOrder_state(order_state);
            purse.setBalance(purse.getBalance()+order.getOrder_price());
            purseService.updatePurse(purse);
            orderservice.updateOrder(order);
            msg="修改成功";
            flag="1";
        }else {
            msg="修改失败";
            flag="2";
        }

        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }


    @RequestMapping("/adminQueRenOrder.do")
    @ResponseBody
    public Map<String,String > adminQueRenOrder(@RequestParam(name = "adminoid")String adminoid){
        Order order=orderservice.getOrderByOid(adminoid);
        String user_id=order.getSell_uid();
        Purse purse=purseService.getPurseByUserId(user_id);
        String flag = "0";
        String msg = "0";

        try {
            if (order.getOrder_state().equals(0)){
                flag="3";
            }else if (order.getOrder_state().equals(2)) {
                msg="已确认收货";
                flag="4";

            }else {
                order.setOrder_state(2);
                purse.setBalance(purse.getBalance()+order.getOrder_price());
                purseService.updatePurse(purse);
                orderservice.updateOrder(order);
                msg="收货成功";
                flag="1";
            }

        }catch (Exception e){
            msg="收货失败";
            flag="2";
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;

    }


    @RequestMapping("/adminDeleteOrder.do")
    @ResponseBody
    public Map<String,String > adminDeleteOrder(@RequestParam(name = "oid")String oid ){
        Order order=orderservice.getOrderByOid(oid);
        String flag = "0";
        String msg = "0";
        if(order.getOrder_state().equals(2)){
            try {
                orderservice.deleteOrder(oid);
                flag="1";
                msg="删除成功";
            }catch (Exception e){
                flag="2";
                msg="删除失败";
            }

        }else {
            flag="3";
            msg="交易未完成";
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }


    @RequestMapping("/getOrderLike.do")
    public ModelAndView getOrderLike(@RequestParam(name="oid")String oid,@RequestParam(name = "page" ,required = true,defaultValue = "1")int page,@RequestParam(name = "size" ,required = true,defaultValue = "10")int size) {
        ModelAndView mv = new ModelAndView();
        if (oid.equals("") || oid.equals(null)) {
            List<Order> listOrder=orderservice.selectAllOrder(page,size);
            PageInfo pageInfo=new PageInfo(listOrder);
            mv.addObject("orders",pageInfo);
            mv.setViewName("admin/order_list");
            return mv;

        }else {
            List<Order> listOrder = orderservice.getOrderLike(oid,page,size);

            PageInfo pageInfo=new PageInfo(listOrder);
            mv.addObject("orders",pageInfo);


            System.out.println(pageInfo);
            mv.setViewName("admin/order_list");
            return mv;
        }


    }






}
