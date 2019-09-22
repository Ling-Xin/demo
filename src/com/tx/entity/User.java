package com.tx.entity;

/**
 * 用户实体类
 */
public class User {
    private int user_id;
    private String user_name;
    private String user_password;
    private int user_age;
    private int user_sex;   //0 男  1 女
    private String user_address;
    private String user_tel;
    private int user_flag;  // 0 用户 1 管理员

    public User() {
    }

    public User(int user_id, String user_name, String user_password, int user_age, int user_sex, String user_address, String user_tel, int user_flag) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_age = user_age;
        this.user_sex = user_sex;
        this.user_address = user_address;
        this.user_tel = user_tel;
        this.user_flag = user_flag;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public int getUser_age() {
        return user_age;
    }

    public void setUser_age(int user_age) {
        this.user_age = user_age;
    }

    public int getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(int user_sex) {
        this.user_sex = user_sex;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public int getUser_flag() {
        return user_flag;
    }

    public void setUser_flag(int user_flag) {
        this.user_flag = user_flag;
    }
}
