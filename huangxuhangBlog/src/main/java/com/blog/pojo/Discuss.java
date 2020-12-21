package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Discuss {
    private int id;
    private String content;
    private String adminName;
    private Date createTime;

    public Discuss(String content, String adminName, Date createTime) {
        this.content = content;
        this.adminName = adminName;
        this.createTime = createTime;
    }
}
