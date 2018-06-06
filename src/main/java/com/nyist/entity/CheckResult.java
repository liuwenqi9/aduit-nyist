package com.nyist.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/5/29/029.
 */
public class CheckResult {
    private String rid;
    private String roomName;
    private Integer groud;
    private Integer roomCount;
    private Date uploadTime;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Integer getGroud() {
        return groud;
    }

    public void setGroud(Integer groud) {
        this.groud = groud;
    }

    public Integer getRoomCount() {
        return roomCount;
    }

    public void setRoomCount(Integer roomCount) {
        this.roomCount = roomCount;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }
}
