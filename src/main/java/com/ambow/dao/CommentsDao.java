package com.ambow.dao;

import com.ambow.pojo.Comments;

import java.util.List;

public interface CommentsDao {

    void addComments(Comments comments);

    List<Comments> getProductComments(int pid);
}
