package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.pojo.Article;
import com.blog.service.AdminService;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/individualMyBlog")
public class IndividualMyBlogController {
    @Autowired
    @Qualifier("articleServiceImp")
    ArticleService articleService;
    @Autowired
    @Qualifier("adminServiceImp")
    AdminService adminService;

    //个人资料
    @RequestMapping("/Information")
    public String information(HttpSession httpSession, Model model){
        Admin admin = (Admin) httpSession.getAttribute("admin");
        model.addAttribute("id",admin.getId());
        model.addAttribute("name",admin.getName());
        model.addAttribute("email",admin.getEmail());
        model.addAttribute("time",admin.getCreateDate().toString());
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "individual";
    }

    //留言
    @RequestMapping("/MsgAdd")
    public String msgAdd(){
        return "";
    }



    //我的博客
    @RequestMapping("/MyBlog")
    public String myBlog(HttpServletRequest request,Model model){
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        List<Article> list = articleService.queryAllArticle(admin.getId());
        model.addAttribute("myblog",list);
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "myblog";
    }


}
