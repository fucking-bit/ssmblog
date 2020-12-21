package com.blog.service;

import com.blog.pojo.Admin;

import java.util.List;
public interface AdminService {

    int querrySign(String adminName);

    int updateSign(int sign,String id);

    List<Admin> querryActiveAdmin();
}
