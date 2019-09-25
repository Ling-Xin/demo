package com.tx.dao;


import com.tx.entity.User;
import com.tx.util.C3P0Utils;
import com.tx.util.MD5Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

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
            user = qr.query(sql, new BeanHandler<>(User.class), user_name, MD5Util.md5(user_password));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 分页展示用户
     * @return  返回用户列表
     */
    public List<User> searchUserBypage(int currPage,int pageSize,String userName){
        sql = "select * from tb_user where user_name like ? and user_flag = 0 order by user_id limit ?,?";
        List<User> list = null;
        try {
            list = qr.query(sql, new BeanListHandler<>(User.class),"%"+userName+"%",pageSize*(currPage - 1),pageSize);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 获得总用户数
     * @return
     */
    public int getTotalUser(String userName){
        sql = "select count(1) from tb_user where user_name like ? and user_flag = 0";
        int result = 0;
        try {
            result = Integer.parseInt(String.valueOf(qr.query(sql, new ScalarHandler(),"%"+userName+"%")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 新增用户
     * @param user  用户
     * @return  成功返回true 失败返回false
     */
    public boolean addUser(User user){
        sql = "insert into tb_user(user_name,user_password,user_age,user_sex,user_address,user_tel) values(?,?,?,?,?,?)";
        int result = 0;
        try {
            result = qr.update(sql, user.getUser_name(), MD5Util.md5(user.getUser_password()), user.getUser_age(), user.getUser_sex(), user.getUser_address(), user.getUser_tel());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result > 0;
    }

    /**
     * 修改用户信息
     * @param user_id   修改用户的id
     * @param user  修改后的信息
     * @return  成功返回true 失败返回 false
     */
    public boolean updateUser(int user_id,User user){
        sql = "update tb_user set user_name = ?,user_age = ?,user_sex = ?,user_address = ?,user_tel = ? where user_id = ?";
        int result = 0;
        try {
            result = qr.update(sql,user.getUser_name(),user.getUser_age(),user.getUser_sex(),user.getUser_address(),user.getUser_tel(),user_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  result > 0;
    }

    /**
     * 根据用户id删除用户
     * @param user_id   用户id
     * @return  成功返回 true 失败返回 false
     */
    public boolean delUser(int user_id){
        sql = "delete from tb_user where user_id = ?";
        int result = 0;
        try {
            result = qr.update(sql,user_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result > 0;
    }

    /**
     * 根据ID查找用户
     * @param user_id
     * @return
     */
    public User searchUserById(int user_id){
        sql = "select * from tb_user where user_id = ?";
        User user = null;
        try {
            user = qr.query(sql, new BeanHandler<>(User.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
