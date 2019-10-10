package com.ambow.dao;

import com.ambow.pojo.Purse;

public interface PuresDao {
    Purse getPurseByUserId(String user_id);

    void updatePurse(Purse purse);

    Purse selectPurseByuid(String user_id);

    void addPurse(Purse purse);
}
