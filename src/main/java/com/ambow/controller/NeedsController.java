package com.ambow.controller;


import com.ambow.pojo.Needs;
import com.ambow.pojo.User;
import com.ambow.service.NeedsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.net.ssl.HttpsURLConnection;
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
@RequestMapping("/needs")
public class NeedsController {

    @Resource
    private NeedsService needsService;

    @RequestMapping("/pubNeedProduct.do")
    public String pubNeedProduct(Needs needs,HttpServletRequest request,HttpServletResponse res) throws IOException {
        User user=(User) request.getSession().getAttribute("userLogin");
        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html; charset=UTF-8"); //转码
        res .setHeader("Cache-Control", "no-cache");
        PrintWriter out = res.getWriter();
        if (user==null){



                out.flush();
                out.println("<script>");
                out.println("alert('请登录!');");
                out.println("</script>");

            return "login";

        }else {
            needs.setNmessage(request.getParameter("nmessage"));
            needs.setUid(user.getUser_id());
            Date date = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String pubdate = sdf.format(date);
            needs.setPubdate(pubdate);
            try {
                needsService.addNeed(needs);
                out.flush();
                out.println("<script>");
                out.println("alert('发布成功！');");

                out.println("</script>");
            }catch (Exception e){
                out.flush();
                out.println("<script>");
                out.println("alert('发布失败，请重新发布！');");
                out.println("history.back();");
                out.println("</script>");
            }

            return "shouye";
        }

    }


    @RequestMapping("getNeedProduct")
    public ModelAndView getNeedProduct(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        User user= (User) request.getSession().getAttribute("userLogin");
        List<Needs> listNeeds=needsService.getNeedProduct();
        for (Needs ne :
                listNeeds) {
            System.out.println(ne.getUser());
        }
        mv.addObject("listNeeds",listNeeds);
        mv.addObject("userNeeds",user);
        mv.setViewName("needProduct");
        return mv;
    }


    @RequestMapping("/getAllNeeds.do")
    public ModelAndView getAllNeeds(){
        ModelAndView mv=new ModelAndView();
        List<Needs> needs=needsService.getAllNeeds();
        mv.addObject("needs",needs);
        mv.setViewName("admin/need_list");
        return  mv;
    }


    @RequestMapping("/deletNeed.do")
    public String deletNeed(@RequestParam(name = "nid" ,required = true)int nid){
        try {
            needsService.deleteNeed(nid);
        }catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/needs/getAllNeeds.do";

    }

    @RequestMapping("/deleteNeeds.do")
    @ResponseBody
    public Map<String,String> deleteNeeds(@RequestParam(name = "nid")int nid){
        String flag = "0";
        String msg = "0";
        try{
            needsService.deleteNeeds(nid);
            flag="1";
            msg="删除成功";
        }catch (Exception e){
            flag="2";
            msg="删除失败";
        }


        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }



}
