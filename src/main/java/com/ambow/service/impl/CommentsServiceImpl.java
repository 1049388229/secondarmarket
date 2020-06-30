package com.ambow.service.impl;

import com.ambow.dao.CommentsDao;
import com.ambow.pojo.Comments;
import com.ambow.service.CommentsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
    @Resource
    private CommentsDao commentsDao;

    @Override
    public List<Comments> getProductComments(int pid) {
        return commentsDao.getProductComments(pid);
    }

    @Override
    public void deleteComments(int id) {
        commentsDao.deleteComments(id);
    }

    @Override
    public  void addComments(Comments comments){
        commentsDao.addComments(comments);
    }





}
