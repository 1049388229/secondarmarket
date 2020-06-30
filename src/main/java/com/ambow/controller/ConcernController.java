package com.ambow.controller;


import com.ambow.pojo.Concern;
import com.ambow.pojo.Product;
import com.ambow.pojo.User;
import com.ambow.service.ConcernService;

import com.ambow.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/concern")
public class ConcernController {

    @Resource
    private ConcernService concernService;

    @Resource
    private ProductService productService;



    @RequestMapping("/addconern.do")
    public void conert(@RequestParam(name = "pid",required = true) int id, HttpServletRequest request, HttpServletResponse res) throws IOException {
        User user =(User) request.getSession().getAttribute("userLogin");
        Product product=productService.getAllProductBypid(id);
        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html; charset=UTF-8"); //转码
        res .setHeader("Cache-Control", "no-cache");
        PrintWriter out = res.getWriter();
        if (user==null){
            out.flush();
            out.println("<script>");
            out.println("alert('请先登录');");
            out.println("history.back();");
            out.println("</script>");

        }else{

            if (product.getUser_id().equals(user.getUser_id())){
                out.flush();
                out.println("<script>");
                out.println("alert('您不能关注自己的商品');");
                out.println("history.back();");
                out.println("</script>");
            }else {
                String uid=user.getUser_id();
                Concern concern=concernService.getMyproduct(id,uid);
                if (concern==null){
                    try {
                        concernService.addMyconert(id,uid);


                        out.flush();
                        out.println("<script>");
                        out.println("alert('关注成功');");
                        out.println("history.back();");
                        out.println("</script>");
                    }catch (Exception e){
                        e.printStackTrace();

                        res.setContentType("text/html; charset=UTF-8"); //转码

                        out.flush();
                        out.println("<script>");
                        out.println("alert('关注失败');");
                        out.println("history.back();");
                        out.println("</script>");


                    }
                }else {
                    out.flush();
                    out.println("<script>");
                    out.println("alert('您已关注过该商品！');");
                    out.println("history.back();");
                    out.println("</script>");
                }

            }



        }
    }


    @RequestMapping("/getMyconern.do")
    public ModelAndView getMyconern(HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("userLogin");
        String id=user.getUser_id();
        List<Product> list=concernService.getMyConcern(id);
        for (Product product:list
             ) {
            System.out.println(product.toString());
        }
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.setViewName("myConcern");
        return mv;
    }


}
