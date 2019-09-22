package com.tx.service;

import com.tx.dao.UserDao;
import com.tx.entity.User;

public class UserService {

    private UserDao userDao = new UserDao();

    public User userLogin(String user_name,String user_password){
        return userDao.userLogin(user_name,user_password);
    }
}
