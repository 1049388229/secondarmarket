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

    Order getOrderInformationByOid(String oid);

    Order getOrderByOid(String oid);

    List<Order> getOrderBypid(int pid);

    void deleteOrder(String oid);

    List<Order> selectAllOrder(int page, int size);

    List<Order> getOrderLike(String oid, int page, int size);
}
