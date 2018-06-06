package com.nyist.entity;

import javax.persistence.*;

@Entity
public class Power {
    private String id;
    private String powername;
    private Integer type;
    private String url;
    private String percode;
    private Integer showsort;
    private Integer isOk;
    private Power powerByParentid;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "powername")
    public String getPowername() {
        return powername;
    }

    public void setPowername(String powername) {
        this.powername = powername;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Basic
    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Basic
    @Column(name = "percode")
    public String getPercode() {
        return percode;
    }

    public void setPercode(String percode) {
        this.percode = percode;
    }

    @Basic
    @Column(name = "showsort")
    public Integer getShowsort() {
        return showsort;
    }

    public void setShowsort(Integer showsort) {
        this.showsort = showsort;
    }

    @Basic
    @Column(name = "isOk")
    public Integer getIsOk() {
        return isOk;
    }

    public void setIsOk(Integer isOk) {
        this.isOk = isOk;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Power power = (Power) o;

        if (id != null ? !id.equals(power.id) : power.id != null) return false;
        if (powername != null ? !powername.equals(power.powername) : power.powername != null) return false;
        if (type != null ? !type.equals(power.type) : power.type != null) return false;
        if (url != null ? !url.equals(power.url) : power.url != null) return false;
        if (percode != null ? !percode.equals(power.percode) : power.percode != null) return false;
        if (showsort != null ? !showsort.equals(power.showsort) : power.showsort != null) return false;
        if (isOk != null ? !isOk.equals(power.isOk) : power.isOk != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (powername != null ? powername.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (percode != null ? percode.hashCode() : 0);
        result = 31 * result + (showsort != null ? showsort.hashCode() : 0);
        result = 31 * result + (isOk != null ? isOk.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "parentid", referencedColumnName = "id")
    public Power getPowerByParentid() {
        return powerByParentid;
    }

    public void setPowerByParentid(Power powerByParentid) {
        this.powerByParentid = powerByParentid;
    }
}
