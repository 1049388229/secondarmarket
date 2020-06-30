package com.ambow.dao;

import com.ambow.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    Admin adminLogin(@Param("telephone") String telephone, @Param("password")String password);

    Admin  checkTelephone(String telephone);

    Admin checkAdmin(@Param("telephone") String telephone, @Param("password")String password);

    void updatePassword(@Param("password")String password, @Param("id")int id);
}
