package com.ambow.pojo;

public class Category {

    private int cid;
    private String cname;
    private int state;

    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
