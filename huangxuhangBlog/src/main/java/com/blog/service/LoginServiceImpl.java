package com.blog.service;

import com.blog.dao.LoginMapper;
import com.blog.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;


    //用户名验证
    @Override
    public Admin usernameVerify(String name) {
        return loginMapper.querryAdminByName(name);
    }
    //用户验证
    @Override
    public Admin adminVerify(String name, String pwd) {
        return loginMapper.querryAdminByNameAndPwd(name,pwd);
    }

    //注册
    @Override
    public void register(Admin admin) {
       loginMapper.addAdmin(admin);
    }


}
