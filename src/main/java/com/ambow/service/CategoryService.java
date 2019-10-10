package com.ambow.service;

import com.ambow.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getAllCategory();

    List<Category> getAdminCategory();

    Category getCategoryName(int cid);

    Category getCartegortByCid(int cid);



    void updateCategory(Category category);

    void addCategory(Category category);
}
