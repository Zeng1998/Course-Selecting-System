
# Course-Selecting-System
基于ssm框架的简单选课系统

## 基本功能
### 学生部分
#### 登录、修改密码
#### 查询个人信息
#### 查询排课情况、根据老师姓名/学院筛选、进行选课、查询个人选课情况、查询成绩

### 教师部分
#### 登录、修改密码
#### 查询个人信息
#### 查询个人开课情况、添加、修改、删除课程
#### 查看课程选课情况、删除学生、评分

### 超级管理员部分
#### 登录、修改密码
#### 增删改查学生信息
#### 增删改查教师信息
#### 增删改查课程信息
#### 修改学生课程评分

## 开发环境
### 后台基于maven使用SSM框架整合(Spring、SpringMVC、Mybatis)
### 前端jsp页面样式基于layui框架，bootstrap和jquery
### ide：Intellij IDEA 2017.2.4
### java版本：jdk1.8.0_152
### 数据库版本：mysql 5.7.18-1

## 数据库设计
有学生、教师、管理员、学院、课程、课程的学院限制、课程选择7张表

## 简单展示
学生
### 登录
数据表中有10个学生账号（2018000001--2018000010）和4个教师账号（2018100001--2018100004），密码和账号一样
![登录](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/1.png)
### 首页
![首页](https://images.gitee.com/uploads/images/2020/0604/164558_cad53170_6579152.png)
### 个人信息
![个人信息](https://images.gitee.com/uploads/images/2020/0604/164559_e9faffd5_6579152.png)
### 修改密码
![修改密码](https://images.gitee.com/uploads/images/2020/0604/164559_c2add273_6579152.png)
### 开课列表
![开课列表](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/5.png)
### 课程详情
![课程详情](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/6.png)
### 选课确认
![选课确认](https://images.gitee.com/uploads/images/2020/0604/164559_6d22e60d_6579152.png)
### 已选列表
![已选列表](https://images.gitee.com/uploads/images/2020/0604/164559_e1899878_6579152.png)
### 退课
![退课](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/9.png)

教师
### 开课列表
![开课列表](https://images.gitee.com/uploads/images/2020/0604/164843_d0ddfea3_6579152.png)
### 添加新课程
![添加新课程](https://images.gitee.com/uploads/images/2020/0604/164843_b3ff3512_6579152.png)
### 修改课程
![修改课程](https://images.gitee.com/uploads/images/2020/0604/164602_bca45ca9_6579152.png)
### 删除课程
![删除课程](https://images.gitee.com/uploads/images/2020/0604/164600_1f9d7371_6579152.png)
### 课程管理
![课程管理](https://images.gitee.com/uploads/images/2020/0604/164843_a4e593e2_6579152.png)
### 评分
![评分](https://images.gitee.com/uploads/images/2020/0604/164603_78969b3e_6579152.png)
### 删除学生
![删除学生](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/16.png)
原本有个朋友帮忙做个选课系统，我在github上找了个大兄弟写的他的链接是： https://github.com/Zeng1998/Course-Selecting-System

本身他的这个系统跑不起来，可能是我太菜了，外加我朋友有个superRoot的需求，我就给他大改了一下。
目前自己运行正常
