package com.ambow.service;


import com.ambow.pojo.Product;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ProductService {

    List<Product> getAllProduct();

    List<Product> getAllProductBycid(int cid);

    Product getProductBypid(int id);

    List<Product> getMyProducrByUid(String id);


    void pubMyproduct(Product product);

    Product getProductUserBypid(int pid);

    List<Product> getAllProducts(int page, int size);

    Product getAllProductBypid(int id);

    void updateProduct(Product product);

    List<Product> likeProduct(String name);

    void deleteProduct(int productId);

    List<Product> getAllMyProducrByUid(String id);

    List<Product> getProductLike(String name, int page, int size);
}
