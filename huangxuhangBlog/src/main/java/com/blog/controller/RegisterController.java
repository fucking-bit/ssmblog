package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.service.LoginService;
import com.blog.utils.IDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    @Qualifier("loginServiceImpl")
    private LoginService loginServic;

    //跳转至注册
    @RequestMapping("/ToRegister")
    public String toRegister(){
        return "register";
    }


    //注册
    @RequestMapping("/Register")
    @ResponseBody
    public String register(HttpServletRequest request){
        String msg ="";
        Admin admin1 = new Admin();
        admin1.setId(IDUtil.genId());
        admin1.setName(request.getParameter("username"));
        admin1.setPwd(request.getParameter("password"));
        admin1.setEmail(request.getParameter("email"));
        admin1.setGender(request.getParameter("sex"));
        admin1.setCreateDate(new Date());
        Admin admin2 = loginServic.usernameVerify(request.getParameter("username"));
        if (admin2!=null){
            //System.out.println("用户名存在");
            msg = "用户名存在";
        }else if (admin2==null){
            loginServic.register(admin1);
            msg = "注册成功";
        }
        return msg;
    }
}
