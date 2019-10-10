package com.ambow.controller;


import com.ambow.pojo.Category;
import com.ambow.pojo.User;
import com.ambow.service.CategoryService;

import com.ambow.util.UUIDUtils;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    @RequestMapping("/getAllCategory.do")
    @ResponseBody
    public String getAllCategory() throws Exception{

            List<Category> list =categoryService.getAllCategory();
            String  jsonStr= JSONArray.fromObject(list).toString();
            System.out.println(jsonStr);


        return jsonStr;


    }


    @RequestMapping("/getCategory.do")
    public ModelAndView getCategory(HttpServletRequest request){
        User user= (User) request.getSession().getAttribute("userLogin");
        ModelAndView mv=new ModelAndView();

        if (user==null){
            request.setAttribute("msg", "用户激活失败,请重新激活!");
            String msg="请先登录!";
            mv.addObject("msg",msg);
            mv.setViewName("info");
            return mv;
        }else{

            List<Category> catList =categoryService.getAllCategory();
            mv.addObject("catList",catList);
            mv.setViewName("pubProduct");
            return mv;
        }

    }


    @RequestMapping("/getAdminCatelogy.do")
    public ModelAndView getAdminCatelogy(){
        List<Category> categories=categoryService.getAdminCategory();
        ModelAndView mv=new ModelAndView();
        mv.addObject("categories",categories);
        mv.setViewName("admin/category_list");
        return mv;
    }

    @RequestMapping("/selectCategoryBycid.do")
    public ModelAndView selectCategorycypid(@RequestParam(name = "cid") int cid){
        ModelAndView mv=new ModelAndView();
        Category category=categoryService.getCartegortByCid(cid);
        mv.addObject("category",category);
        mv.setViewName("admin/category_update");
        return mv;
    }

    @RequestMapping("/updateBycid.do")
    @ResponseBody
    public Map<String,String> updateCategoryBycid(@RequestParam(name = "cid") int cid,@RequestParam(name = "cname") String cname,@RequestParam(name = "state") int state,Category category){
        String flag = "0";
        String msg = "0";
        category.setCname(cname);
        category.setCid(cid);
        category.setState(state);
        try {
            categoryService.updateCategory(category);
            msg="修改成功";
            flag="1";
        }catch (Exception e){
            msg="修改失败";
            flag="2";
        }

        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }


    @RequestMapping("/addCategory.do")
    @ResponseBody
    public Map<String,String> addCategory(@RequestParam(name = "cname") String cname,@RequestParam(name = "state") int state,Category category){
        String flag = "0";
        String msg = "0";
        category.setCname(cname);
        category.setState(state);
        try {
            categoryService.addCategory(category);
            msg="添加成功";
            flag="1";
        } catch (Exception e) {
            msg="添加失败";
            flag="2";
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }
}
