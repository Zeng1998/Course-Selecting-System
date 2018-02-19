package com.zxc.model;

public class Student {
    private int stuId;
    private String stuPass;
    private String stuName;
    private int insId;
    private String InsName;
    private int tempScore;

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public void setStuPass(String stuPass) {
        this.stuPass = stuPass;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public void setInsName(String insName) {
        InsName = insName;
    }

    public void setInsId(int insId) {
        this.insId = insId;
    }

    public void setTempScore(int tempScore) {
        this.tempScore = tempScore;
    }

    public int getStuId() {
        return stuId;
    }

    public String getStuPass() {
        return stuPass;
    }

    public String getStuName() {
        return stuName;
    }

    public String getInsName() {
        return InsName;
    }

    public int getInsId() {
        return insId;
    }

    public int getTempScore() {
        return tempScore;
    }
}
