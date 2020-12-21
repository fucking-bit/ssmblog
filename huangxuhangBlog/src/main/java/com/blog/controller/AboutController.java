package com.blog.controller;

import com.blog.pojo.Admin;
import com.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/about")
public class AboutController {
    @Autowired
    @Qualifier("adminServiceImp")
    AdminService adminService;

    @RequestMapping("/ToAbout")
    public String toAbout(Model model){
        model.addAttribute("about","layui-this");
        List<Admin> admins = adminService.querryActiveAdmin();
        model.addAttribute("admins",admins);
        return "about";
    }
}
