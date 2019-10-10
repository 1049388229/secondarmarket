package com.ambow.pojo;

public class Needs {

    private Integer nid;
    private String nmessage;
    private String uid;

    private String pubdate;

    private User user;


    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getNmessage() {
        return nmessage;
    }

    public void setNmessage(String nmessage) {
        this.nmessage = nmessage;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
