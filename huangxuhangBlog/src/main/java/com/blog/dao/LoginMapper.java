package com.blog.dao;

import com.blog.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

public interface LoginMapper {


    Admin querryAdminByName(@Param("name") String name);
    Admin querryAdminByNameAndPwd(@Param("name")String name,@Param("pwd")String pwd);
    int addAdmin(Admin admin);

}
