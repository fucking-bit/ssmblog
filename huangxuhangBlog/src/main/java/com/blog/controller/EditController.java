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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/edit")
public class EditController {

    @Autowired
    @Qualifier("articleServiceImp")
    private ArticleService articleService;
    @Autowired
    @Qualifier("adminServiceImp")
    AdminService adminService;


    @RequestMapping("/ToEdit")
    public String toEdit(Model model){
        model.addAttribute("edit","layui-this");
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "edit";
    }
    //发布博客
    @RequestMapping("/Publish")
    @ResponseBody
    public String publish(String title,String content,HttpServletRequest request){
        System.out.println(title+content);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String uid = admin.getId();
        int i = articleService.addArticle(title, uid, content, new Date());
        if (i!=0){
            return "200";
        }else {
            return "500";
        }
    }

    //删除博客
    @RequestMapping("/DeleteBlog")
    @ResponseBody
    public String deleteBlog(HttpServletRequest request){
        String id1 = request.getParameter("id");
        Integer  id2= Integer.valueOf(id1);
        int i = articleService.deleteBlog(id2);
        if (i!=0){
            return "200";
        }else {
            return "500";
        }
    }

    //接收修改博客请求
    @RequestMapping("/WantUpdateeBlog")
    @ResponseBody
    public String wantUpdateBlog(HttpServletRequest request){
        String id1 = request.getParameter("id");
        Integer  id2= Integer.valueOf(id1);
        Article article = articleService.queryArticle(id2);
        if (article!=null){
            request.getSession().setAttribute("id",id2);
            return "200";
        }else {
            return "500";
        }
    }
    //跳转至修改博客
    @RequestMapping("/ToUpdateBlog")
    public String toUpdateBlog(HttpServletRequest request,Model model){
        int id = (int)request.getSession().getAttribute("id");
        Article article = articleService.queryArticle(id);
        model.addAttribute("article",article);
        return "updateblog";
    }

    @RequestMapping("UpdateBlog")
    @ResponseBody
    public String updateBlog(HttpServletRequest request) {
        String id1 = request.getParameter("id");
        int id2 = Integer.valueOf(id1);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int i = articleService.updateBlog(title, content, id2);
        if (i!=0){
            return "200";
        }else {
            return "500";
        }

    }
}
