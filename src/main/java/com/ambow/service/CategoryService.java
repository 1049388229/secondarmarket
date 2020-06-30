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

    List<Category> selectAllCatelogy(int page, int size);

    List<Category> getCategoryLike(String name,int page,int size);

    boolean checkCategory(String cname);

    boolean checkUpCname(String cname, int cid);
}
