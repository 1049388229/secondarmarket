package com.ambow.controller;


import com.ambow.pojo.Admin;
import com.ambow.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;
    @RequestMapping("/adminlogin.do")
    public ModelAndView adminLogin(ModelAndView mv,@RequestParam(name = "username")String username, @RequestParam(name="password")String password, HttpServletResponse res) throws IOException {
        Admin admin=adminService.adminLogin(username,password);
        if (admin==null){
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/html; charset=UTF-8"); //转码
            res .setHeader("Cache-Control", "no-cache");
            PrintWriter out = res.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('密码不正确');");
            out.println("history.back();");
            out.println("</script>");
            mv.setViewName("admin/login");
            return mv;
        }
        else {
            mv.setViewName("admin/index");
            return mv;
        }
    }

}
