package com.tx.service;

import com.tx.dao.UserDao;
import com.tx.entity.User;

import java.util.List;

public class UserService {

    private UserDao userDao = new UserDao();

    public User userLogin(String user_name, String user_password) {
        return userDao.userLogin(user_name, user_password);
    }

    public List<User> searchAll() {
        return userDao.searchAll();
    }

    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    public boolean updateUser(int user_id, User user) {
        return userDao.updateUser(user_id, user);
    }

    public boolean delUser(int user_id) {
        return userDao.delUser(user_id);
    }
}
