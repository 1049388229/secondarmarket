package com.ambow.service;

import com.ambow.pojo.Concern;
import com.ambow.pojo.Product;

import java.util.List;

public interface ConcernService {

    void addMyconert(int id, String uid);

    Concern getMyproduct(int id, String uid);
    List<Product> getMyConcern(String uid);

    void deleteMyConcern(Integer mid);
}
