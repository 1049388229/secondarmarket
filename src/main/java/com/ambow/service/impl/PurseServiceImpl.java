package com.ambow.service.impl;

import com.ambow.dao.PuresDao;
import com.ambow.pojo.Purse;
import com.ambow.service.PurseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("purseService")
public class PurseServiceImpl implements PurseService {


    @Resource
    private PuresDao puresDao;

    @Override
    public Purse getPurseByUserId(String user_id) {
        return puresDao.getPurseByUserId(user_id);
    }

    @Override
    public Purse selectPurseByuid(String user_id) {
        return puresDao.selectPurseByuid(user_id);
    }

    @Override
    public void addPurse(Purse purse) {
        puresDao.addPurse(purse);
    }

    @Override
    public void updatePurse(Purse purse) {

        puresDao.updatePurse(purse);


    }
}
