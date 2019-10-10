package com.ambow.dao;

import com.ambow.pojo.Product;


import java.util.List;

public interface ProductDao {


    List<Product> getAllProduct();

    List<Product> getAllProductBycid(int cid);

    Product getProductBypid(int id);

    List<Product> getMyProducrByUid(String user_id);

    void pubMyproduct(Product product);

    Product getProductUserBypid(int id);

    List<Product> getAllProducts();

    Product getAllProductBypid(int id);

    void updateProduct(Product product);

    List<Product> likeProduct(String name);
}
