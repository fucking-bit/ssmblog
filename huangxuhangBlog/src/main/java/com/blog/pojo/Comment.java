package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int id;
    private String content;
    private int bid;
    private String adminName;
    private Date createTime;

    public Comment(String content, int bid, String adminName, Date createTime) {
        this.content = content;
        this.bid = bid;
        this.adminName = adminName;
        this.createTime = createTime;
    }
}
