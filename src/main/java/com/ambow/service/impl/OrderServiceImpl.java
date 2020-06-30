package com.ambow.service.impl;


import com.ambow.dao.OrderDao;
import com.ambow.pojo.Order;
import com.ambow.service.OrderService;
import com.github.pagehelper.PageHelper;
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

    @Override
    public Order getOrderInformationByOid(String oid) {
        return orderDao.getOrderInformationByOid(oid);
    }

    @Override
    public Order getOrderByOid(String oid) {
        return orderDao.getOrderByOid(oid);
    }

    @Override
    public List<Order> getOrderBypid(int pid) {
        return orderDao.getOrderBypid(pid);
    }

    @Override
    public void deleteOrder(String oid) {
        orderDao.deleteOrder(oid);
    }

    @Override
    public List<Order> selectAllOrder(int page, int size) {
        PageHelper.startPage(page,size);
        return orderDao.getAllOrder();
    }

    @Override
    public List<Order> getOrderLike(String oid, int page, int size) {
        PageHelper.startPage(page,size);
        return orderDao.getOrderLike(oid);
    }

}
