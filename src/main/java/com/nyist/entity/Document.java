package com.nyist.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Document {
    private Integer id;
    private String roomname;
    private String filename;
    private Date uploadtime;
    private Integer selfscore;
    private Integer isSelect;
    private Integer lastScores;
    private Integer isOk;
    private String fileurl;
    private Integer groupd;
    private User user;



    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "roomname")
    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    @Basic
    @Column(name = "filename")
    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Basic
    @Column(name = "uploadtime")
    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    @Basic
    @Column(name = "selfscore")
    public Integer getSelfscore() {
        return selfscore;
    }

    public void setSelfscore(Integer selfscore) {
        this.selfscore = selfscore;
    }

    @Basic
    @Column(name = "isSelect")
    public Integer getIsSelect() {
        return isSelect;
    }

    public void setIsSelect(Integer isSelect) {
        this.isSelect = isSelect;
    }

    @Basic
    @Column(name = "lastScores")
    public Integer getLastScores() {
        return lastScores;
    }

    public void setLastScores(Integer lastScores) {
        this.lastScores = lastScores;
    }

    @Basic
    @Column(name = "isOk")
    public Integer getIsOk() {
        return isOk;
    }

    public void setIsOk(Integer isOk) {
        this.isOk = isOk;
    }

    @Basic
    @Column(name = "fileurl")
    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }



    @Basic
    @Column(name = "groupd")
    public Integer getGroupd() {
        return groupd;
    }

    public void setGroupd(Integer groupd) {
        this.groupd = groupd;
    }
    @ManyToOne
    @JoinColumn(name = "uid", referencedColumnName = "id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Document document = (Document) o;

        if (id != null ? !id.equals(document.id) : document.id != null) return false;
        if (roomname != null ? !roomname.equals(document.roomname) : document.roomname != null) return false;
        if (filename != null ? !filename.equals(document.filename) : document.filename != null) return false;
        if (uploadtime != null ? !uploadtime.equals(document.uploadtime) : document.uploadtime != null) return false;
        if (selfscore != null ? !selfscore.equals(document.selfscore) : document.selfscore != null) return false;
        if (isSelect != null ? !isSelect.equals(document.isSelect) : document.isSelect != null) return false;
        if (lastScores != null ? !lastScores.equals(document.lastScores) : document.lastScores != null) return false;
        if (isOk != null ? !isOk.equals(document.isOk) : document.isOk != null) return false;
        if (fileurl != null ? !fileurl.equals(document.fileurl) : document.fileurl != null) return false;
        if (groupd != null ? !groupd.equals(document.groupd) : document.groupd != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (roomname != null ? roomname.hashCode() : 0);
        result = 31 * result + (filename != null ? filename.hashCode() : 0);
        result = 31 * result + (uploadtime != null ? uploadtime.hashCode() : 0);
        result = 31 * result + (selfscore != null ? selfscore.hashCode() : 0);
        result = 31 * result + (isSelect != null ? isSelect.hashCode() : 0);
        result = 31 * result + (lastScores != null ? lastScores.hashCode() : 0);
        result = 31 * result + (isOk != null ? isOk.hashCode() : 0);
        result = 31 * result + (fileurl != null ? fileurl.hashCode() : 0);
        result = 31 * result + (groupd!= null ? groupd.hashCode() : 0);
        return result;
    }
}
