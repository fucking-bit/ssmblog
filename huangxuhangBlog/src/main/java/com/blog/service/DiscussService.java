package com.blog.service;

import com.blog.pojo.Discuss;
import com.blog.pojo.DiscussComment;

import java.util.List;

public interface DiscussService {
    Discuss querryDiscussById(int id);
    List<Discuss> querryAllDiscuss();
    int addTalk(Discuss discuss);
    List<DiscussComment> querryDiscussCommentByDid(int did);
    int addTalkComment(DiscussComment discussComment);
}
