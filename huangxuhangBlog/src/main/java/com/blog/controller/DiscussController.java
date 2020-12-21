package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.pojo.Discuss;
import com.blog.pojo.DiscussComment;
import com.blog.service.AdminService;
import com.blog.service.DiscussService;
import com.blog.utils.IDUtil;
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
@RequestMapping("/discuss")
public class DiscussController {
    @Autowired
    @Qualifier("adminServiceImp")
    AdminService adminService;
    @Autowired
    @Qualifier("discussServiceImp")
    DiscussService discussService;

    @RequestMapping("/ToDiscussPage")
    public String toDiscussPage(Model model){
        model.addAttribute("talk","layui-this");
        model.addAttribute("discuss",discussService.querryAllDiscuss());
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "discusspage";
    }
    @RequestMapping("/PublishTalk")
    @ResponseBody
    public String publishTalk(HttpServletRequest request){
        String content = request.getParameter("content");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin!=null){
            discussService.addTalk(new Discuss(content,admin.getName(),new Date()));
            return "200";
        }else if (admin==null){
            discussService.addTalk(new Discuss(content,"游客"+ IDUtil.genId(),new Date()));
            return "200";
        }else {
            return "500";
        }
    }

    @RequestMapping("/ScanDiscuss")
    public String canDiscuss(String id,Model model){
        model.addAttribute("talk","layui-this");
        List<DiscussComment> discussComments = discussService.querryDiscussCommentByDid(Integer.valueOf(id));
        model.addAttribute("discussComments",discussComments);
        Discuss discuss = discussService.querryDiscussById(Integer.valueOf(id));
        model.addAttribute("discuss",discuss);
        //活跃榜
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "discusspage2";
    }

    @RequestMapping("/addTalkComment")
    @ResponseBody
    public String addTalkComment(HttpServletRequest request,Model model){
        int did = Integer.valueOf(request.getParameter("did"));
        String content = request.getParameter("content");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin!=null){
            discussService.addTalkComment(new DiscussComment(content,did,admin.getName(),new Date()));
            return "200";
        }else if (admin==null){
            discussService.addTalkComment(new DiscussComment(content,did,"游客"+IDUtil.genId(),new Date()));
            return "200";
        }else {
            return "500";
        }
    }
}
