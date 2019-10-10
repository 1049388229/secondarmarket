package com.ambow.dao;

import com.ambow.pojo.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> getAllCategory();

    Category getCategoryName(int cid);

    List<Category> getAdminCategory();

    Category getCartegortByCid(int cid);


    void updateCategory(Category category);

    void addCategory(Category category);
}
