package com.record.model;

public class AdminUser {
    private String id;//主键
    private String loginName;//登录名
    private String name;//登录名
    private String password;//密码
    private String no;//身份证号，关联主键
    private String department;//所属系部
    private int isHead;//是否为班主任
    private String manageClass;//管理班级
    private String phone;//手机号

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getIsHead() {
        return isHead;
    }

    public void setIsHead(int isHead) {
        this.isHead = isHead;
    }

    public String getManageClass() {
        return manageClass;
    }

    public void setManageClass(String manageClass) {
        this.manageClass = manageClass;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
