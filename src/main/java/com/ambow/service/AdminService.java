package com.ambow.service;

import com.ambow.pojo.Admin;

public interface AdminService {

    Admin adminLogin(String telephone,String password);

    Boolean checkTelephone(String telephone);

    Boolean checkAdmin(String telephone, String password);


    Boolean updatePassword(String password, int id);
}
