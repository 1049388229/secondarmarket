package com.ambow.dao;

import com.ambow.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    void userRegist(User user);

    User activeUser(String user_id);

    void updateUser(User user);

    Long checkTelephone(String telephone);

    User userLogin(@Param("telephone") String telephone, @Param("password") String password);

    List<User> getAllUser();

    User selectUserbyid(String id);

    void deletUser(String uid);

    User selectUserByTelephone(String telephone);

    Boolean checkUser(String telephone, String password);

    Long checkStudentId(String studentid);

    List<User> getUserLike(String username);

    User checkUpdateTelephone(@Param("user_id") String user_id, @Param("telephone") String telephone);
}
