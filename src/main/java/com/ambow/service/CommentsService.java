package com.ambow.service;

import com.ambow.pojo.Comments;

import java.util.List;

public interface CommentsService {


    void addComments(Comments comments);

    List<Comments> getProductComments(int pid);
}
