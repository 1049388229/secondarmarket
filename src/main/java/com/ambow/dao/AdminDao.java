package com.ambow.dao;

import com.ambow.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    Admin adminLogin(@Param("username") String username, @Param("password")String password);
}
