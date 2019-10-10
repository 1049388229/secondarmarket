package com.ambow.service.impl;

import com.ambow.dao.ProductDao;
import com.ambow.pojo.Product;
import com.ambow.service.ProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("productService")
public class ProductServiceImpl implements ProductService {


    @Resource
    private ProductDao productDao;
    @Override
    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }

    @Override
    public List<Product> getAllProductBycid(int cid) {


        return productDao.getAllProductBycid(cid);
    }

    @Override
    public List<Product> getMyProducrByUid(String id) {
        return productDao.getMyProducrByUid(id);
    }

    @Override
    public Product getProductBypid(int id) {
        return productDao.getProductBypid(id);
    }

    @Override
    public Product getProductUserBypid(int pid) {
        return productDao.getProductUserBypid(pid);
    }

    @Override
    public void pubMyproduct(Product product) {
        productDao.pubMyproduct(product);
    }

    @Override
    public List<Product> likeProduct(String productName) {
        return productDao.likeProduct(productName);
    }

    @Override
    public List<Product> getAllProducts(int page, int size) {

        PageHelper.startPage(page,size);
        return productDao.getAllProducts();
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Override
    public Product getAllProductBypid(int id) {
        return productDao.getAllProductBypid(id);
    }
}
