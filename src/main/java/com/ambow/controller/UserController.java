package com.ambow.controller;


import com.ambow.pojo.Product;
import com.ambow.pojo.Purse;
import com.ambow.pojo.User;
import com.ambow.pojo.YuanXi;
import com.ambow.service.ProductService;
import com.ambow.service.PurseService;
import com.ambow.service.UserService;
import com.ambow.service.YuanXiService;
import com.ambow.util.MailUtils;
import com.ambow.util.UUIDUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    @Resource
    private YuanXiService yuanXiService;


    @RequestMapping(value = "/userRegist.do")
    public String addUser(HttpServletRequest request, User user,Purse purse) {
        String uid=UUIDUtils.getId();
        user.setUser_id(uid);
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        user.setCreatedate(createdate);
        user.setState(0);
        user.setConditions("正常");
        try {

            userService.userRegister(user);
            String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活<a href='http://localhost:8088/secondarmarket_war/user/userActive.do?user_id=" + user.getUser_id() + "'>http://localhost:8088/secondarmarket_war/user/userActive.do?user_id=" + user.getUser_id() + "</a>";
            purse.setUser_id(uid);
            purse.setBalance(0f);
            purseService.addPurse(purse);
            MailUtils.sendMail(user.getEmail(), emailMsg);
            request.setAttribute("msg", "用户注册成功，请激活！");
            return "success";

        } catch (Exception e) {
            request.setAttribute("msg", "用户注册失败，请重新注册！");
            e.printStackTrace();
            return "register";
        }

    }

    @RequestMapping("/userRegieterjsp.do")
    public ModelAndView userRegieterjsp(){
        ModelAndView mv=new ModelAndView();
        List<YuanXi> yuanXis=yuanXiService.getAll();
        mv.addObject("yuanXis",yuanXis);
        mv.setViewName("register");
        return mv;
    }


    @RequestMapping(value = "userActive.do")
    public String userActive(@RequestParam(name = "user_id", required = true) String user_id, HttpServletRequest request) {
        boolean flag = userService.activeUser(user_id);
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
    public Boolean checkTelephone(@RequestParam("telephone") String telephone) throws IOException {
        boolean isExit = userService.checkTelephone(telephone);

        return isExit;

    }
    @RequestMapping(value = "/checkStudentId.do")
    @ResponseBody
    public Boolean checkStudentId(@RequestParam("studentid") String studentid) throws IOException {
        boolean studentIdIsExit = userService.checkStudentId(studentid);
        return studentIdIsExit;

    }

    @RequestMapping(value = "/userLogin.do")
    @ResponseBody
    public Map<String, String> userLogin(ModelMap modelMap, @RequestParam(name = "telephone", required = true) String telephone, @RequestParam(name = "password", required = true) String password,@RequestParam(name = "yzm")String yzm,HttpServletRequest request) {
        User user = null;
        String flag = "0";
        String msg = "0";
        HttpSession session = request.getSession(true);
        String yanzhengmasession=(String)session.getAttribute("yanzhengma");
        Boolean checkTelephone = userService.checkTelephone(telephone);
        if (checkTelephone == false) {
            //判断手机号码是否存在
            flag = "1";
            msg = "手机号不存在!";
        } else {
            //反之手机号存在，判断密码是否正确
            Boolean checkUser = userService.checkUser(telephone, password);
            if (checkUser == false) {
                flag = "2";
                msg = "密码错误!";
            } else {
                //手机号密码匹配成功，判断用火是否已经激活
                user = userService.userLogin(telephone, password);
                if (user.getState().equals(0)){
                    flag = "3";
                    msg = "您的用户未激活！请重新激活";
                }else {
                    //判断用户是否被禁用
                    if (user.getConditions().equals("禁用")) {
                        flag = "4";
                        msg = "您的用户因为违规被禁用，请联系管理员,管理员联系电话17790792756";
                    } else {
                        if(!yzm.equals(yanzhengmasession)){
                            flag="5";
                            msg="验证码不正确";
                        }else {
                            //用户登录成功
                            flag = "6";
                            msg = "登陆成功";
                            modelMap.addAttribute("userLogin", user);
                        }
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
            List<Product> productList = productService.getAllMyProducrByUid(id);
            model.addAttribute("products",productList);
            return "myProduct";
        }


    }


    @RequestMapping("/getAllUser.do")
    public ModelAndView getAllUser(ModelAndView modelAndView,@RequestParam(name = "page" ,required = true,defaultValue = "1")int page,@RequestParam(name = "size" ,required = true,defaultValue = "10")int size){

        List<User> userList=userService.getAdminAllUser(page,size);
        PageInfo pageInfo=new PageInfo(userList);
        modelAndView.addObject("userList",pageInfo);
        modelAndView.setViewName("admin/userlist");
        return modelAndView;

    }






    @RequestMapping("/updateUser.do")
    public String  updateUser(User user,@RequestParam(name = "yid") int yid,HttpServletRequest request){

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
                purse.setBalance(re);
                purseService.updatePurse(purse);
            }else {
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

    @RequestMapping("/selectUserbyid.do")
    public ModelAndView getUserByid(@RequestParam(name = "uid")String uid){
        ModelAndView mv=new ModelAndView();
        User user=userService.selectUserbyid(uid);
        List<YuanXi> yuanXis=yuanXiService.getAll();
        mv.addObject("lists",yuanXis);
        mv.addObject("user",user);

        mv.setViewName("admin/user-update");
        return mv;


    }


    @RequestMapping("/myInformation.do")
    public ModelAndView myInformation(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("userLogin");
        User myUser=userService.selectUserbyid(user.getUser_id());
        ModelAndView mv=new ModelAndView();
        List<YuanXi> yuanXiList=yuanXiService.getAll();
        mv.addObject("myUser",myUser);
        mv.addObject("yuanXiList",yuanXiList);
        mv.setViewName("user");
        return mv;
    }

    @RequestMapping("/updateMyInformation.do")
    public String updateMyInformation(User user,@RequestParam(name = "yid")int yid, HttpServletRequest request){
        try {
            user.setYid(yid);
            userService.updateUser(user);
        } catch (Exception e) {
            request.setAttribute("msg", "修改失败，重新修改!");
            return "info";
        }
        return "redirect:/user/myInformation.do";
    }


    @RequestMapping("/getUserLike.do")
    public ModelAndView getUserLike(@RequestParam(name="username")String username,@RequestParam(name = "page" ,required = true,defaultValue = "1")int page,@RequestParam(name = "size" ,required = true,defaultValue = "10")int size){
        ModelAndView mv=new ModelAndView();
        if (username.equals("")||username.equals(null)){
            List<User> userList=userService.getAdminAllUser(page,size);
            PageInfo pageInfo=new PageInfo(userList);
            mv.addObject("userList",pageInfo);
            mv.setViewName("admin/userlist");
            return mv;
        }else {
            List<User> userList=userService.getUserLike(username,page,size);
            PageInfo pageInfo=new PageInfo(userList);
            mv.addObject("userList",pageInfo);
            mv.setViewName("admin/userlist");
            return mv;
        }
    }

    @RequestMapping("/checkUpdateTelephone.do")
    @ResponseBody
    public Boolean checkUpdateTelephone(@RequestParam(name="user_id")String user_id,@RequestParam(name = "telephone" )String  telephone) throws IOException {
        boolean userIsExit = userService.checkUpdateTelephone(user_id,telephone);

        return userIsExit;

    }


}
