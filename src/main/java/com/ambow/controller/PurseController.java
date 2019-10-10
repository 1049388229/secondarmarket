package com.ambow.controller;


import com.ambow.pojo.Order;
import com.ambow.pojo.Purse;
import com.ambow.service.OrderService;
import com.ambow.service.PurseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/purse")
public class PurseController {

    @Resource
    private PurseService purseService;

    @Resource
    private OrderService orderService;

    @RequestMapping("/confirmProduct.do")
    public String confirmProduct(@RequestParam(name = "uid")String uid,@RequestParam(name = "price")String price,@RequestParam(name = "oid")String oid){
        Purse purse=purseService.getPurseByUserId(uid);

        Order order=orderService.selectOrderByOid(oid);

        float productPrice=Float.parseFloat(price);
        purse.setBalance(purse.getBalance()+productPrice);
        purseService.updatePurse(purse);
        order.setOrder_state(1);
        orderService.updateOrder(order);
        return "puseConfirm";
    }





}
