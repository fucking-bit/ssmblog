package com.blog.service;

import com.blog.dao.AdminMapper;
import com.blog.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    AdminMapper adminMapper;



    @Override
    public int querrySign(String adminName) {
        return adminMapper.querrySign(adminName);
    }

    @Override
    public int updateSign(int sign, String id) {
        return adminMapper.updateSign(sign,id);
    }

    @Override
    public List<Admin> querryActiveAdmin() {
        return adminMapper.querryActiveAdmin();
    }
}
