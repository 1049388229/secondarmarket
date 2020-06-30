package com.ambow.service;

import com.ambow.pojo.Needs;

import java.util.List;

public interface NeedsService {
    void addNeed(Needs needs);

    List<Needs> getNeedProduct();

    List<Needs> getAllNeeds();

    void deleteNeed(int nid);

    void deleteNeeds(int nid);
}
