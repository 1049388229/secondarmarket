package com.ambow.service.impl;


import com.ambow.dao.OrderDao;
import com.ambow.pojo.Order;
import com.ambow.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderservice")
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Override
    public List<Order> getMybuyOrder(String uid) {
        return orderDao.getMybuyOrder(uid);
    }

    @Override
    public List<Order> getMysellOrder(String uid) {
        return orderDao.getMysellOrder(uid);
    }

    @Override
    public Order selectOrderByOid(String  oid) {
        return orderDao.selectOrderByOid(oid);
    }

    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }


    @Override
    public void updateOrder(Order order){
        orderDao.updateOrder(order);
    }

    @Override
    public List<Order> getAllOrder() {
        return orderDao.getAllOrder();
    }
}
