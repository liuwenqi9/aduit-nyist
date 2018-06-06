package com.nyist.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "doc_moudle", schema = "aduit", catalog = "")
public class DocMoudle {
    private int id;
    private Integer score;
    private Date createtime;
    private String content;
    private User userByUid;
    private Module moduleByMid;
    private Document documentByDid;
    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "score")
    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }



    @Basic
    @Column(name = "createtime")
    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DocMoudle docMoudle = (DocMoudle) o;

        if (id != docMoudle.id) return false;
        if (score != null ? !score.equals(docMoudle.score) : docMoudle.score != null) return false;
        if (createtime != null ? !createtime.equals(docMoudle.createtime) : docMoudle.createtime != null) return false;
        if (content != null ? !content.equals(docMoudle.content) : docMoudle.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (score != null ? score.hashCode() : 0);
        result = 31 * result + (createtime != null ? createtime.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }
    @ManyToOne
    @JoinColumn(name = "uid", referencedColumnName = "id")
    public User getUserByUid() {
        return userByUid;
    }

    public void setUserByUid(User userByUid) {
        this.userByUid = userByUid;
    }
    @ManyToOne
    @JoinColumn(name = "mid", referencedColumnName = "id")
    public Module getModuleByMid() {
        return moduleByMid;
    }

    public void setModuleByMid(Module moduleByMid) {
        this.moduleByMid = moduleByMid;
    }
    @ManyToOne
    @JoinColumn(name = "did", referencedColumnName = "id")
    public Document getDocumentByDid() {
        return documentByDid;
    }

    public void setDocumentByDid(Document documentByDid) {
        this.documentByDid = documentByDid;
    }
}
