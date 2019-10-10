package com.ambow.dao;

import com.ambow.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {

    void addOrder(Order order);

    List<Order> getMybuyOrder(String uid);

    List<Order> getMysellOrder(@Param(value = "uid") String uid);

    Order selectOrderByOid(String oid);

    void updateOrder(Order order);

    List<Order> getAllOrder();
}
