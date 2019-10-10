package com.ambow.controller;


import com.ambow.pojo.Product;
import com.ambow.pojo.Purse;
import com.ambow.pojo.User;
import com.ambow.service.ProductService;
import com.ambow.service.PurseService;
import com.ambow.service.UserService;
import com.ambow.util.MailUtils;
import com.ambow.util.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
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

@SessionAttributes("userLogin")
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    UserService userService;
    @Resource
    ProductService productService;
    @Resource
    PurseService purseService;


    @RequestMapping(value = "/userRegist.do")
    public String addUser(HttpServletRequest request, User user) {
        user.setUser_id(UUIDUtils.getId());

        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        user.setCreatedate(createdate);
        user.setState(0);
        user.setActiveCode(UUIDUtils.getCode());
        user.setConditions("正常");
        try {
            String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活<a href='http://localhost:8088/secondarmarket_war/user/userActive.do?activecode=" + user.getActiveCode() + "'>http://localhost:8088/secondarmarket_war/user/userActive.do?activecode=" + user.getActiveCode() + "</a>";
            userService.userRegister(user);
            MailUtils.sendMail(user.getEmail(), emailMsg);
            request.setAttribute("msg", "用户注册成功，请激活！");
            return "success";

        } catch (Exception e) {
            request.setAttribute("msg", "用户注册失败，请重新注册！");
            e.printStackTrace();
            return "register";
        }

    }


    @RequestMapping(value = "userActive.do")
    public String userActive(@RequestParam(name = "activecode", required = true) String activeCode, HttpServletRequest request) {

        boolean flag = userService.activeUser(activeCode);
        if (flag == true) {
            request.setAttribute("msg", "用户激活成功，请登录!");
            return "info";
        } else {
            request.setAttribute("msg", "用户激活失败,请重新激活!");
            return "info";
        }


    }


    @RequestMapping(value = "/checkTelephone.do")
    @ResponseBody
    public Boolean checkTelephone(@RequestParam("telephone") String telephone, HttpServletResponse response) throws IOException {
        boolean isExit = userService.checkTelephone(telephone);

        return isExit;

    }

    @RequestMapping(value = "/userLogin.do")
    @ResponseBody
    public Map<String, String> userLogin(ModelMap modelMap, @RequestParam(name = "telephone", required = true) String telephone, @RequestParam(name = "password", required = true) String password, HttpServletResponse res, Purse purse) {
        User user = null;
      /*  try {
            user= userService.userLogin(telephone,password);
            if (user.getConditions().equals("禁用")){
                res.setCharacterEncoding("utf-8");
                res.setContentType("text/html; charset=UTF-8"); //转码
                res .setHeader("Cache-Control", "no-cache");
                PrintWriter out = res.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('您已被禁用，请联系系统管理员');");
                out.println("history.back();");
                out.println("</script>");
            }else {
                User user1=userService.selectUserByTelephone(telephone);

               Purse purse1=purseService.getPurseByUserId(user1.getUser_id());

                if (purse1==null){
                    System.out.println(user1.getUser_id()+"++++++++++++++++++++");
                    String uid=user1.getUser_id();
                    purse.setUser_id(uid);

                    purse.setBalance(0f);
                    try {
                        purseService.addPurse(purse);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                modelMap.addAttribute("userLogin",user);


            }


        } catch (Exception e) {
            e.printStackTrace();
            String msg=e.getMessage();
            System.out.println(msg);
            modelMap.addAttribute("msg",msg);
            return "info";
        }
        return "shouye";*/
        System.out.println("+++++++++++++++++++++++++++++++++++");
        String flag = "0";
        String msg = "0";
        Boolean checkTelephone = userService.checkTelephone(telephone);
        if (checkTelephone == false) {
            flag = "1";
            msg = "手机号不存在!";
        } else {
            //反之手机号存在，判断密码是否正确
            Boolean checkUser = userService.checkUser(telephone, password);
            if (checkUser == false) {
                flag = "2";
                msg = "密码错误!";
            } else {
                //反之用户存在  判断密码是否正确
                user = userService.userLogin(telephone, password);
                if (user.getState().equals(0)){
                    flag = "3";
                    msg = "您的用户未激活！请重新激活";
                }else {
                    if (user.getConditions().equals("禁用")) {
                        flag = "4";
                        msg = "您的用户因为违规被禁用，请联系管理员,管理员联系电话17790792756";
                    } else {

                        flag = "5";
                        msg = "登陆成功";
                        modelMap.addAttribute("userLogin", user);

                    }
                }



            }


        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;

    }











    @RequestMapping(value = "/loginOut.do")
    public String loginOut(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/page/shouye.jsp";
    }



    @RequestMapping("/myProduct.do")
    public String myProduct(Model model,HttpServletRequest request){
       User user= (User) request.getSession().getAttribute("userLogin");
        if (user==null){
            request.setAttribute("msg","请先登录！");
            return "info";
        }else{
            String id=user.getUser_id();
            List<Product> productList = productService.getMyProducrByUid(id);
            model.addAttribute("products",productList);
            return "myProduct";
        }


    }


    @RequestMapping("/getAllUser.do")
    public ModelAndView getAllUser(ModelAndView modelAndView){
        List<User> userList=userService.getAllUser();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("admin/userlist");
        return modelAndView;

    }

    @RequestMapping("/selectUserbyid.do")
    public ModelAndView selectUserbyid(ModelAndView modelAndView,@RequestParam(name = "uid")String uid){
        User user =userService.selectUserbyid(uid);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("admin/user-update");
        return modelAndView;

    }


    @RequestMapping("/updateUser.do")
    public String  updateUser(User user,HttpServletRequest request){
        try {
            userService.updateUser(user);

        }catch (Exception e){

            e.printStackTrace();

        }

        return "redirect:/user/getAllUser.do";

    }


    @RequestMapping("/deletUser.do")
    public String deletUser(@RequestParam(name = "uid")String uid){
        try {
            userService.deletUser(uid);
        }catch (Exception e){

        }

        return "redirect:/user/getAllUser.do";
    }

    @RequestMapping(value = "/myPurse.do")
    public ModelAndView getMoney(HttpServletRequest request) {
        User cur_user = (User) request.getSession().getAttribute("userLogin");
        String user_id = cur_user.getUser_id();

        Purse purse = purseService.getPurseByUserId(user_id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("myPurse", purse);
        mv.setViewName("purse");
        return mv;
    }



    @RequestMapping(value = "/updatePurse.do")
    public String updatePurse(HttpServletRequest request,@RequestParam(name = "recharge") String  recharge,@RequestParam(name = "withdrawals")String withdrawals)  {
        User cur_user = (User) request.getSession().getAttribute("userLogin");
        String  user_id = cur_user.getUser_id();
        Purse purse=purseService.selectPurseByuid(user_id);
        purse.setUser_id(user_id);

        if (recharge!=""){
            float re=Float.parseFloat(recharge);
            if (purse.getBalance() == 0f) {
                System.out.println("++++++++++++++++");
                purse.setBalance(re);
                purseService.updatePurse(purse);
            }else {
                System.out.println("---------------------");
                float newbalance=purse.getBalance()+re;
                purse.setBalance(newbalance);
                purseService.updatePurse(purse);
            }

        }

        if (withdrawals !="" ){
            float wr=Float.parseFloat(withdrawals);
                float newbalance=purse.getBalance()-wr;
                purse.setBalance(newbalance);
                purseService.updatePurse(purse);

        }

        return "redirect:/user/myPurse.do";
    }


    @RequestMapping("/myInformation.do")
    public ModelAndView myInformation(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("userLogin");
        User myUser=userService.selectUserbyid(user.getUser_id());
        ModelAndView mv=new ModelAndView();
        mv.addObject("myUser",myUser);
        mv.setViewName("user");
        return mv;
    }

    @RequestMapping("/updateMyInformation.do")
    public String updateMyInformation(User user,HttpServletRequest request){
        try {
            userService.updateUser(user);
        } catch (Exception e) {
            request.setAttribute("msg", "修改失败，重新修改!");
            return "info";
        }
        return "redirect:/user/myInformation.do";
    }


}
