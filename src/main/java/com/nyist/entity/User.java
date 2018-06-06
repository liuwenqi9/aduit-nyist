package com.nyist.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class User {
    private String id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private Timestamp loginTime;
    private Integer isOk;
    private Integer role;
    private Integer groupd;
    private Module moduleByMid;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "loginTime")
    public Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
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
    @Column(name = "role")
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }



    @Basic
    @Column(name = "groupd")
    public Integer getGroupd() {
        return groupd;
    }

    public void setGroupd(Integer groupd) {
        this.groupd = groupd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != null ? !id.equals(user.id) : user.id != null) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (phone != null ? !phone.equals(user.phone) : user.phone != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (loginTime != null ? !loginTime.equals(user.loginTime) : user.loginTime != null) return false;
        if (isOk != null ? !isOk.equals(user.isOk) : user.isOk != null) return false;
        if (role != null ? !role.equals(user.role) : user.role != null) return false;
        if (groupd != null ? !groupd.equals(user.groupd) : user.groupd != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (loginTime != null ? loginTime.hashCode() : 0);
        result = 31 * result + (isOk != null ? isOk.hashCode() : 0);
        result = 31 * result + (role != null ? role.hashCode() : 0);
        result = 31 * result + (groupd != null ? groupd.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "mid", referencedColumnName = "id")
    public Module getModuleByMid() {
        return moduleByMid;
    }

    public void setModuleByMid(Module moduleByMid) {
        this.moduleByMid = moduleByMid;
    }
}
