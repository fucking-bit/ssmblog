package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
    private String id;
    private String name;
    private String pwd;
    private String email;
    private String gender;
    private Date createDate;
    private int sign;

    public Admin(String name, String pwd) {
        this.name = name;
        this.pwd = pwd;
    }
}
