package com.ambow.controller;


import com.ambow.pojo.Admin;
import com.ambow.pojo.Purse;
import com.ambow.pojo.User;
import com.ambow.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
@SessionAttributes("adminLogin")
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;




    @RequestMapping(value = "/adminlogin.do")
    @ResponseBody
    public Map<String, String> adminLogin(ModelMap modelMap,HttpServletRequest request, @RequestParam(name = "telephone") String telephone, @RequestParam(name = "password") String password, @RequestParam(name = "yanzhengma") String yanzhengma) {
        Admin admin = null;
        String flag = "0";
        String msg = "0";
        HttpSession session = request.getSession(true);
        String yanzhengmasession= (String)session.getAttribute("yanzhengma");
        Boolean checkTelephone = adminService.checkTelephone(telephone);
        if (!yanzhengma.equals(yanzhengmasession)){
            flag="1";
            msg="验证码错误";
        }else {
            if (checkTelephone == false) {
                flag = "2";
                msg = "手机号不存在!";
            } else {
                //反之手机号存在，判断密码是否正确
                Boolean checkAdmin = adminService.checkAdmin(telephone, password);
                if (checkAdmin == false) {
                    flag = "3";
                    msg = "密码错误!";
                } else {
                    //反之密码
                    admin = adminService.adminLogin(telephone, password);
                    flag = "4";
                    msg = "登陆成功";
                    modelMap.addAttribute("adminLogin", admin);
                }
            }
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;

    }

    //跳转到后台首页
    @RequestMapping("/adminIndex.do")
    public String adminIndex(){
        return "admin/index";
    }


    //跳转到后台登录页面
    @RequestMapping("/adminExitLogin.do")
    public String adminExitLogin(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/page/admin/login.jsp";
    }

    //跳转到修改密码页面
    @RequestMapping("/adminUpdayejsp.do")
    public String adminUpdayejsp(){

        return "admin/admin-updatepwd";
    }



    @RequestMapping("/adminInformation.do")
    public ModelAndView getAdminInfomation(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        Admin admin= (Admin) request.getSession().getAttribute("adminLogin");
        mv.addObject("admin",admin);
        mv.setViewName("admin/admin-information");
        return mv;

    }


    @RequestMapping("/updatePassword.do")
    @ResponseBody
    public Map<String,String> updatePassword(@RequestParam(name = "password")String password,@RequestParam(name = "newpassword")String newpassword,HttpServletRequest request){
        Admin admin= (Admin) request.getSession().getAttribute("adminLogin");
        int id=admin.getId();
        String flag = "0";
        String msg = "0";
        if (!admin.getPassword().equals(password)){
            flag="1";
            msg="原密码不正确";
        }else {
            Boolean f= adminService.updatePassword(newpassword,id);
            if (f==true){
                flag="2";
                msg="密码修改成功，请重新登录";
            }
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }


    @RequestMapping("/loginOut.do")
    public  String  loginOut(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:adminExitLogin.do";
    }



}
