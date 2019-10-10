package com.ambow.controller;

import com.ambow.dao.CategoryDao;
import com.ambow.pojo.*;
import com.ambow.service.*;
import com.ambow.util.UUIDUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@SessionAttributes("cart")
@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;

    @Resource
    private CategoryService categoryService;

    @Resource
    private PurseService purseService;

    @Resource
    private ConcernService concernService;

    @Resource
    private CommentsService commentsService;

    @RequestMapping("/newsProduct.do")
    public ModelAndView getAllProduct(ModelMap modelMap){
        List<Product> list=productService.getAllProduct();
        modelMap.addAttribute("newsProduct",list);

        return new ModelAndView("index","newsProduct",list);
    }


    @RequestMapping("/getAllProductBycid.do")
    public ModelAndView getAllProductBycid(@RequestParam(name = "cid",required = true)int cid)throws Exception{
          ModelAndView mv=new ModelAndView();
         List<Product> productList= productService.getAllProductBycid(cid);
         Category category=categoryService.getCategoryName(cid);

         mv.addObject("category",category);
         mv.addObject("productList",productList);
         mv.setViewName("showProduct");


        return mv;


    }



    @RequestMapping("/getProductBypid.do")
    public ModelAndView getProductBypid(@RequestParam(name = "pid",required = true) int id){
        ModelAndView mv=new ModelAndView();
        Product product=productService.getProductUserBypid(id);
        List<Comments> commentsList=commentsService.getProductComments(id);
        mv.addObject("comments",commentsList);
        mv.addObject("productBypid",product);
        mv.setViewName("product-details");
        return mv;
    }

    @RequestMapping("/deleteMyConcern.do")
    public String deleteMyConcern(@RequestParam(name = "pid")int pid,HttpServletRequest request){
        User user =(User)request.getSession().getAttribute("userLogin");
        Concern concern=concernService.getMyproduct(pid,user.getUser_id());
        try {
            concernService.deleteMyConcern(concern.getMid());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/concern/getMyconern.do";
    }


    @RequestMapping("/pubProduct.do")
    public String pubMyproduct(Product product,HttpServletRequest request) throws Exception {
        User user=(User) request.getSession().getAttribute("userLogin");


            //文件上传
            MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
            //获得上传的文件mr.getFile(String fileName),fileName是<input type="file" name="pic"><br>中pic
            CommonsMultipartFile cf = (CommonsMultipartFile) mr.getFile("images");
            byte[] fb = cf.getBytes();
        System.out.println(cf+"***********************************************");
            //------- 使用 时间戳和随机三位值 生成不重复的文件名称
            String fileName = "";

            fileName = UUIDUtils.getCode();
            //加三位随机数


            //原始文件名
            String oriFileName = cf.getOriginalFilename();

            //获取后缀名 包含.
            String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
            //-------
            //获取路径   文件上传到服务器中的那个路径下
            String imageName=fileName + suffix;

            //在 服务器路径下 创建一个空文件

            String path = "E:/javaworkspace/ideaworkspace/secondarmarket/src/main/webapp/product";

            String pathTomcat = "F:/kaifagongju/apache-tomcat-8.5.43/webapps/secondarmarket_war/product";
            OutputStream out = new FileOutputStream(path+"/"+imageName);

            //将内存中上传的文件写入到 空文件中
            out.write(fb);
            out.flush();
            out.close();
            copyImge(path,pathTomcat,imageName);
            product.setImage(imageName);
            product.setUser_id(user.getUser_id());
            Date date = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String startime = sdf.format(date);
            product.setStart_time(startime);
            product.setStatus(1);

            try {
                productService.pubMyproduct(product);

            }catch (Exception e){
                e.printStackTrace();
                request.setAttribute("msg","发布失败，请重新发布！");

                return "info";
            }



        return "index";

    }

    private void copyImge(String olderPath,String newPath,String name) throws Exception{
        FileInputStream in=new FileInputStream(olderPath+"/"+name);
        FileOutputStream out= new FileOutputStream(newPath+"/"+name);
        BufferedInputStream bufferedIn=new BufferedInputStream(in);
        BufferedOutputStream bufferedOut=new BufferedOutputStream(out);
        byte[] by=new byte[1];
        while (bufferedIn.read(by)!=-1) {
            bufferedOut.write(by);
        }

        bufferedOut.flush();
        bufferedIn.close();
        bufferedOut.close();
    }

/*
    @RequestMapping("/cart.do")
    public String addCart(ModelMap modelMap, @RequestParam(name = "pid",required = true)Integer pid, HttpServletRequest request, HttpServletResponse response){
        Cart cart= (Cart) request.getSession().getAttribute("cart");
        if (cart==null){
            cart=new Cart();
            request.getSession().setAttribute("cart",cart);
        }
            Product product=productService.getProductBypid(pid);
            CartItem cartItem=new CartItem();
            cartItem.setProduct(product);
            System.out.println(cartItem.toString());
            cart.addCartItemToCar(cartItem);
            System.out.println(cart.toString());
             return "redirect:/page/cart.jsp";
    }


    @RequestMapping("/removeCartItem.do")
    public String removeCartItem(@RequestParam(name = "pid",required = true)int pid,HttpServletRequest request){
        Cart cart= (Cart) request.getSession().getAttribute("cart");

        cart.removeCartItem(pid);
        return "redirect:/page/cart.jsp";
    }*/

    @RequestMapping("/confirmBuy.do")
    public ModelAndView confirmBuy(@RequestParam(name = "pid",required = true)int pid,HttpServletRequest request,HttpServletResponse res) throws IOException {
        ModelAndView mv=new ModelAndView();
        Product product=productService.getProductUserBypid(pid);
        User user= (User) request.getSession().getAttribute("userLogin");
        if (user.getUser_id().equals(product.getUser_id())){

            res.setCharacterEncoding("utf-8");
            res.setContentType("text/html; charset=UTF-8"); //转码
            res .setHeader("Cache-Control", "no-cache");
            PrintWriter out = res.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('您不能购买自己的商品，请重新购买');");
            out.println("history.back();");
            out.println("</script>");
            return  null;

        }else{
            mv.addObject("confirmproduct",product);
            mv.setViewName("commitOrder");
            return mv;        }




    }


    /*    if (product.getPrice()>purse.getBalance()){


        return new ModelAndView("redirect:/user/myPurse.do");
    }else {
        mv.addObject("confirmproduct",product);
        mv.setViewName("commitOrder");
        return mv;
    }*/


    @RequestMapping("/getAllProduct.do")
    public ModelAndView getAllProduct(@RequestParam(name = "page" ,required = true,defaultValue = "1")int page,@RequestParam(name = "size" ,required = true,defaultValue = "10")int size){

        ModelAndView mv=new ModelAndView();
        List<Product> products=productService.getAllProducts(page,size);
        PageInfo pageInfo=new PageInfo(products);
        mv.addObject("pageInfoProduct",pageInfo);
        mv.setViewName("admin/product_list");
        return  mv;

    }



    @RequestMapping("/selectProductBypid.do")
    public ModelAndView selectProductBypid(@RequestParam(name = "pid" ,required = true)int pid){
        ModelAndView mv=new ModelAndView();
        Product product= productService.getAllProductBypid(pid);
        List<Category> categoryList=categoryService.getAllCategory();
        mv.addObject("product",product);
        mv.addObject("categoryList",categoryList);
        mv.setViewName("admin/product_update");
        return mv;
    }


    @RequestMapping("/updateProduct.do")
    public String updateProduct(Product product){
        try {
            productService.updateProduct(product);
        }catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/product/getAllProduct.do";
    }

    @RequestMapping("/likeProduct.do")
    public ModelAndView likeProduct(@RequestParam(name = "productName")String productName){
        List<Product> productsList=productService.likeProduct(productName);
        ModelAndView mv=new ModelAndView();
        mv.addObject("productsList",productsList);
        mv.setViewName("serchProduct");
        return mv;
    }



}
