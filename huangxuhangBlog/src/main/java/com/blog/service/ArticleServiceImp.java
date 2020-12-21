package com.blog.service;

import com.blog.dao.ArticleMapper;
import com.blog.pojo.Admin;
import com.blog.pojo.Article;
import com.blog.pojo.Comment;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class ArticleServiceImp implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;





    @Override
    public int addArticle(String title, String uid, String content,Date createDate) {
        return articleMapper.insterArticle(title,uid,content,createDate);
    }

    @Override
    public List<Article> queryAllArticle(String uid) {
        return articleMapper.queryAllArticle(uid);
    }

    @Override
    public int deleteBlog(int id) {
        return articleMapper.deleteBlog(id);
    }

    @Override
    public Article queryArticle(int id) {
        return articleMapper.queryArticle(id);
    }

    @Override
    public int updateBlog(String title, String content, int id) {
        return articleMapper.updateBlog(title,content,id);
    }

    @Override
    public List<Article> querryHotBlog() {
        return articleMapper.querryHotBlog();
    }

    @Override
    public int addClick(int click, int id) {
        return articleMapper.addClick(click,id);
    }

    @Override
    public Admin querryAdminByUid(String uid) {
        return articleMapper.querryAdminByUid(uid);
    }

    @Override
    public int comment(String content, int bid, String adminName,Date createTime) {
        return articleMapper.comment(content,bid,adminName,createTime);
    }

    @Override
    public List<Comment> queryCommentByBid(int bid) {
        return articleMapper.queryCommentByBid(bid);
    }





}
