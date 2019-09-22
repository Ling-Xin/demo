package com.tx.dao;


import com.tx.entity.User;
import com.tx.util.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {

    private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
    private String sql;

    /**
     * 用户登录
     * @param user_name 用户名
     * @param user_password 用户密码
     * @return  成功返回 user对象 失败返回 null
     */
    public User userLogin(String user_name, String user_password){
        sql = "select * from tb_user where user_name = ? and user_password = ?";
        User user = null;
        try {
            user = qr.query(sql, new BeanHandler<>(User.class), user_name, user_password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
