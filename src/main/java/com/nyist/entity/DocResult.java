package com.nyist.entity;

/**
 * Created by Administrator on 2018/5/27/027.
 */
public class DocResult {
    private Integer id;
    private Integer sumScore;
    private Integer selfScore;
    private String roomName;
    private Integer groupd;
    private String userName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSumScore() {
        return sumScore;
    }

    public void setSumScore(Integer sumScore) {
        this.sumScore = sumScore;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Integer getSelfScore() {
        return selfScore;
    }

    public void setSelfScore(Integer selfScore) {
        this.selfScore = selfScore;
    }

    public Integer getGroupd() {
        return groupd;
    }

    public void setGroupd(Integer groupd) {
        this.groupd = groupd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
