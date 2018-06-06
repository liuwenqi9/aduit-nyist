package com.nyist.entity;

import javax.persistence.*;

@Entity
@Table(name = "role_power", schema = "aduit", catalog = "")
public class RolePower {
    private Integer id;
    private Integer role;
    private Integer isOk;
    private Power powerByPid;



    @Id
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "role")
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
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

        RolePower rolePower = (RolePower) o;

        if (id != rolePower.id) return false;
        if (role != null ? !role.equals(rolePower.role) : rolePower.role != null) return false;
        if (isOk != null ? !isOk.equals(rolePower.isOk) : rolePower.isOk != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (role != null ? role.hashCode() : 0);
        result = 31 * result + (isOk != null ? isOk.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "pid", referencedColumnName = "id")
    public Power getPowerByPid() {
        return powerByPid;
    }

    public void setPowerByPid(Power powerByPid) {
        this.powerByPid = powerByPid;
    }
}
