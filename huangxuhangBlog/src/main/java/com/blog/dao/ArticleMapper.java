package com.blog.dao;


import com.blog.pojo.Admin;
import com.blog.pojo.Article;
import com.blog.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
public interface ArticleMapper {

    int insterArticle(@Param("title") String title, @Param("uid")String uid, @Param("content")String content, @Param("createDate")Date createDate);

    List<Article> queryAllArticle(@Param("uid")String uid);

    int deleteBlog(int id);

    Article queryArticle(int id);

    int updateBlog(@Param("title")String title,@Param("content") String content,@Param("id") int id);

    //点击量最高得
    List<Article> querryHotBlog();

    //增加点击量
    int addClick(@Param("click") int click,@Param("id") int id);

    Admin querryAdminByUid(String uid);

    //评论
    int comment(@Param("content") String content, @Param("bid")int bid, @Param("adminName")String adminName, @Param("createTime") Date createTime);

    List<Comment> queryCommentByBid(int bid);


    List<Article> queryAllArticles();

    Article querryArticlesByTitle(String title);
}
