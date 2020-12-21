package com.blog.dao;

import com.blog.pojo.Discuss;
import com.blog.pojo.DiscussComment;
import org.springframework.stereotype.Repository;

import java.util.List;
public interface DiscussMapper {

    Discuss querryDiscussById(int id);

    List<Discuss> querryAllDiscuss();

    int addTalk(Discuss discuss);

    List<DiscussComment> querryDiscussCommentByDid(int did);

    int addTalkComment(DiscussComment discussComment);
}
