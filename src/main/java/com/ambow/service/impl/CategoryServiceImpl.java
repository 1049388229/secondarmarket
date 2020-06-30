package com.ambow.service.impl;


import com.ambow.dao.CategoryDao;
import com.ambow.pojo.Category;
import com.ambow.pojo.User;
import com.ambow.service.CategoryService;
import com.github.pagehelper.PageHelper;
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

    @Override
    public List<Category> selectAllCatelogy(int page, int size) {
        PageHelper.startPage(page,size);
        return categoryDao.getAdminCategory();
    }

    @Override
    public List<Category> getCategoryLike(String name, int page, int size) {
        PageHelper.startPage(page,size);
        return categoryDao.getCategoryLike(name);
    }

    @Override
    public boolean checkCategory(String cname) {
        Long isExits=0L;
        try{
            isExits=categoryDao.checkCategory(cname);
        }catch (Exception e){
            e.printStackTrace();
        }
        return isExits>0?true:false;
    }

    @Override
    public boolean checkUpCname(String cname, int cid) {
        Category category=categoryDao.checkUpCname(cname,cid);
        if (category==null){
            Long isExits=0L;
            try{
                isExits=categoryDao.checkCategory(cname);
            }catch (Exception e){
                e.printStackTrace();
            }
            return isExits>0?true:false;
        }else {
            return false;
        }
    }


}
