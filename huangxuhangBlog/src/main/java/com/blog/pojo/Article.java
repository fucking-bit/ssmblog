package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article {
    private int id;
    private String title;
    private int click;
    private String uid;
    private String content;
    private Date creatDate;

    public Article(String title, String uid, String content, Date creatDate) {
        this.title = title;
        this.uid = uid;
        this.content = content;
        this.creatDate = creatDate;
    }
}
