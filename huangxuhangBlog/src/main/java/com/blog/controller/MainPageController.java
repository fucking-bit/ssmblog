package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.pojo.Article;
import com.blog.pojo.Comment;
import com.blog.service.AdminService;
import com.blog.service.ArticleService;
import com.blog.service.SerachService;
import com.blog.utils.IDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/main")
public class MainPageController {

    @Autowired
    @Qualifier("articleServiceImp")
    ArticleService articleService;
    @Autowired
    @Qualifier("adminServiceImp")
    AdminService adminService;

    @Autowired
    @Qualifier("searchServiceImp")
    SerachService serachService;
    //去主页
    @RequestMapping("/ToMain")
    public String returnMain(Model model){
        model.addAttribute("main","layui-this");
        List<Article> list = articleService.querryHotBlog();
        model.addAttribute("hotblog",list);
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "main";
    }

    //退出
    @RequestMapping("/Cancel")
    @ResponseBody
    public String cancel(String name, HttpSession session){
        System.out.println(name);
        Admin admin = (Admin) session.getAttribute("admin");
        String msg = "";
        if (name.equals(admin.getName())){
           msg = "OK";
           session.removeAttribute("admin");
        }else {
            msg = "NO";
        }
        return msg;
    }

    //退出刷新
    @RequestMapping("RefreshMain")
    public String refreshMain(){
        return "main";
    }

    //查看博客
    @RequestMapping("/ScanBlog")
    public String scanBlog(String id,Model model){
        Article article = articleService.queryArticle(Integer.valueOf(id));
        model.addAttribute("article",article);
        //获取评论
        Admin admin = articleService.querryAdminByUid(article.getUid());
        List<Comment> comments = articleService.queryCommentByBid(Integer.valueOf(id));
        model.addAttribute("article",article);
        model.addAttribute("name",admin.getName());
        model.addAttribute("comments",comments);
        //点击率
        articleService.addClick(article.getClick()+1,Integer.valueOf(id));
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "scanblog";
    }

    //评论
    @RequestMapping("/Comment")
    @ResponseBody
    public String comment(HttpServletRequest request){
        int bid = Integer.valueOf(request.getParameter("bid"));
        String content = request.getParameter("content");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String name="";
        if (admin==null){
             name = "游客"+IDUtil.genId();
        }else {
            name = admin.getName();
            //评论sign+1
            int i = adminService.querrySign(admin.getName());
            adminService.updateSign(i+1,admin.getId());
        }
        int i = articleService.comment(content, bid, name, new Date());
        if (i!=0){
            return "200";
        }else {
            return "500";
        }
    }

    //查询博客
    @RequestMapping("/Search")
    public String search(String title,Model model) throws IOException {
        List<Article> articles = serachService.FuzzyQuery(title);
        model.addAttribute("articles",articles);
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "blog";
    }

}
