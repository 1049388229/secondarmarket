package com.ambow.service;

import com.ambow.pojo.User;

import java.util.List;

public interface UserService {

    void userRegister(User user);


    boolean activeUser(String activeCode);

    boolean checkTelephone(String telephone);
    User selectUserByTelephone(String telephone);

    User userLogin(String telephone, String password);

    List<User> getAllUser();

    User selectUserbyid(String id);

    void updateUser(User user);

    void deletUser(String uid);

    Boolean checkUser(String telephone, String password);
}
