package com.blog.service;

import com.blog.dao.DiscussMapper;
import com.blog.pojo.Discuss;
import com.blog.pojo.DiscussComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscussServiceImp implements DiscussService {
    @Autowired
    DiscussMapper discussMapper;



    @Override
    public Discuss querryDiscussById(int id) {
        return discussMapper.querryDiscussById(id);
    }

    @Override
    public List<Discuss> querryAllDiscuss() {
        return discussMapper.querryAllDiscuss();
    }

    @Override
    public int addTalk(Discuss discuss) {
        return discussMapper.addTalk(discuss);
    }

    @Override
    public List<DiscussComment> querryDiscussCommentByDid(int did) {
        return discussMapper.querryDiscussCommentByDid(did);
    }

    @Override
    public int addTalkComment(DiscussComment discussComment) {
        return discussMapper.addTalkComment(discussComment);
    }

}
