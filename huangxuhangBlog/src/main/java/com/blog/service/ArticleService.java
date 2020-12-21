package com.blog.service;

import com.blog.pojo.Admin;
import com.blog.pojo.Article;
import com.blog.pojo.Comment;
import org.apache.ibatis.annotations.Param;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

public interface ArticleService {

    int addArticle(String title, String uid, String content, Date createDate);

    List<Article> queryAllArticle(String uid);

    int deleteBlog(int id);

    Article queryArticle(int id);

    int updateBlog(String title, String content,int id);

    List<Article> querryHotBlog();

    int addClick(int click,int id);

    Admin querryAdminByUid(String uid);

    int comment( String content,int bid,String adminName,Date createTime);

    List<Comment> queryCommentByBid(int bid);




}
