package com.ambow.service.impl;


import com.ambow.dao.CategoryDao;
import com.ambow.pojo.Category;
import com.ambow.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryDao categoryDao;
    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    @Override
    public void updateCategory(Category category) {
        categoryDao.updateCategory(category);
    }

    @Override
    public Category getCartegortByCid(int cid) {
        return categoryDao.getCartegortByCid(cid);
    }

    @Override
    public List<Category> getAdminCategory() {
        return categoryDao.getAdminCategory();
    }

    @Override
    public Category getCategoryName(int cid) {
        return categoryDao.getCategoryName(cid);
    }

    @Override
    public void addCategory(Category category) {
        categoryDao.addCategory(category);
    }
}
