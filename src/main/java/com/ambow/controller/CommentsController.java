package com.ambow.controller;

import com.ambow.pojo.Comments;
import com.ambow.pojo.User;
import com.ambow.service.CommentsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/comments")
public class CommentsController {

    @Resource
    private CommentsService commentsService;

    @RequestMapping("/addComments.do")
    public String addComents(Model model,@RequestParam(value = "pid" ,required = true)int pid, @RequestParam(name = "content")String content, HttpServletRequest request, HttpServletResponse res, Comments comments) throws IOException {
        User user = (User) request.getSession().getAttribute("userLogin");
        if (user==null){
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/html; charset=UTF-8"); //转码
            res .setHeader("Cache-Control", "no-cache");
            PrintWriter out = res.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('请先登录再评论');");
            out.println("</script>");
            return  "login";
        }else {
            comments.setUser_id(user.getUser_id());

            comments.setPid(pid);
            comments.setContent(content);
            Date date = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String create_at = sdf.format(date);
            comments.setCreate_at(create_at);
            try {
                commentsService.addComments(comments);
            } catch (Exception e) {
                request.setAttribute("msg", "评论失败，重新评论!");
                return "info";

            }
            model.addAttribute("pid",pid);
            return "redirect:/product/getProductBypid.do";
        }

    }

}
