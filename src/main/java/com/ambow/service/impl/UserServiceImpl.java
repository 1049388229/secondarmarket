package com.ambow.service.impl;

import com.ambow.dao.UserDao;
import com.ambow.pojo.User;
import com.ambow.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;


    @Override
    public boolean activeUser(String userCode) {
       User user= userDao.activeUser(userCode);
        if(user!=null){
            user.setState(1);
            userDao.updateUser(user);
            return true;
        }else{
            return false;
        }

    }



    @Override
    public void userRegister(User user) {
        userDao.userRegist(user);
    }

    @Override
    public boolean checkTelephone(String telephone) {
        Long isExits=0L;
        try{
            isExits=userDao.checkTelephone(telephone);
        }catch (Exception e){
            e.printStackTrace();
        }



        return isExits>0?true:false;
    }

    @Override
    public User selectUserByTelephone(String telephone) {
        return userDao.selectUserByTelephone(telephone);
    }

    @Override
    public User userLogin(String telephone, String password) {
        User user=userDao.userLogin(telephone,password);
        if (user==null){
            throw new RuntimeException("密码有误");

        }else if (user.getState()==0){
            throw new RuntimeException("用户未激活");
        }else {
            return user;
        }
    }

    @Override
    public void deletUser(String uid) {
        userDao.deletUser(uid);
    }

    @Override
    public Boolean checkUser(String telephone, String password) {
        User user=userDao.userLogin(telephone,password);
        if (user==null){
            return false;

        }else {
            return true;
        }
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public User selectUserbyid(String id) {
        return userDao.selectUserbyid(id);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }
}
