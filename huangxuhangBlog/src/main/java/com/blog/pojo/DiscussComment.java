package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiscussComment {

    private int id;
    private String content;
    private int did;
    private String adminName;
    private Date createTime;

    public DiscussComment(String content, int did, String adminName, Date createTime) {
        this.content = content;
        this.did = did;
        this.adminName = adminName;
        this.createTime = createTime;
    }
}
