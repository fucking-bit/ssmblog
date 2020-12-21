package com.blog.service;
import com.blog.pojo.Admin;



public interface LoginService {

    //用户名验证
    Admin usernameVerify(String name);
    //用户验证
    Admin adminVerify(String name,String pwd);

    //注册用户
    void register(Admin admin);


}
