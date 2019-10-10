package com.ambow.service.impl;

import com.ambow.dao.AdminDao;
import com.ambow.pojo.Admin;
import com.ambow.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public Admin adminLogin(String username, String password) {
        return adminDao.adminLogin(username,password);
    }
}
