package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.service.LoginService;
import com.blog.utils.CreateValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;


@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    @Qualifier("loginServiceImpl")
    private LoginService loginServic;

    //跳转至登录
    @RequestMapping("/ToLogin")
    public String toLogin(){
        return "login";
    }

    //登录
    @RequestMapping("/Login")
    @ResponseBody
    public String login(String username,String password,String code,HttpServletRequest request){
        String msg="";
        Admin admin1 = loginServic.usernameVerify(username);
        Admin admin2 = loginServic.adminVerify(username, password);
        if (admin1==null){
            //System.out.println("用户名不存在");
            msg="NNO";
        }else if (admin2==null){
            //System.out.println("密码错误");
            msg="PNO";
        }else if (!request.getSession().getAttribute("code").equals(code)){
            msg="CNO";
        }else {
            request.getSession().setAttribute("admin",admin2);
        }
        return msg;
    }

    //验证码
    @RequestMapping("/GetCode")
    public void getValidateCode(HttpServletResponse response,HttpServletRequest request) throws IOException {

        //创建输出流
        OutputStream outputStream = response.getOutputStream();
        //获取session
        HttpSession session = request.getSession();
        //获取验证码
        CreateValidateCode createValidateCode = new CreateValidateCode();
        String generateVerifyCode = createValidateCode.getString();
        //将验证码存入session，做登录验证
        session.setAttribute("code",generateVerifyCode);
        System.out.println(generateVerifyCode);
        //获取验证码图片
        BufferedImage image = createValidateCode.getImage();
        ImageIO.write(image, "png", outputStream);
        //关流
        outputStream.flush();
        outputStream.close();

    }

}
