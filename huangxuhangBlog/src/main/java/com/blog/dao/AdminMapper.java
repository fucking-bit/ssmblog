package com.blog.dao;

import com.blog.pojo.Admin;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface AdminMapper {

    //查询该用户有多少评论
    int querrySign(String adminName);

    //修改该用户得评论总数
    int updateSign(@Param("sign") int sign,@Param("id") String id);

    List<Admin> querryActiveAdmin();
}
