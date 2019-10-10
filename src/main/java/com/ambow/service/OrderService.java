package com.ambow.service;

import com.ambow.pojo.Order;

import java.util.List;

public interface OrderService {


    void addOrder(Order order);

    List<Order> getMybuyOrder(String uid);

    List<Order> getMysellOrder(String uid);

    Order selectOrderByOid(String oid);

     void updateOrder(Order order);

    List<Order> getAllOrder();
}
