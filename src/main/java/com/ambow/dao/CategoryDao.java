package com.ambow.dao;

import com.ambow.pojo.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryDao {
    List<Category> getAllCategory();

    Category getCategoryName(int cid);

    List<Category> getAdminCategory();

    Category getCartegortByCid(int cid);


    void updateCategory(Category category);

    void addCategory(Category category);

    List<Category> getCategoryLike(String cname);

    Long checkCategory(String cname);

    Category checkUpCname(@Param("cname") String cname, @Param("cid") int cid);
}
