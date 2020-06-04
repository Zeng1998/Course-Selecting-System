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
@@ -21,7 +28,7 @@
### 数据库版本：mysql 5.7.18-1

## 数据库设计
有学生、教师、学院、课程、课程的学院限制、课程选择六张表
有学生、教师、管理员、学院、课程、课程的学院限制、课程选择7张表

## 简单展示
学生
@@ -29,19 +36,19 @@
数据表中有10个学生账号（2018000001--2018000010）和4个教师账号（2018100001--2018100004），密码和账号一样
![登录](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/1.png)
### 首页
![首页](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/2.png)
![首页](https://images.gitee.com/uploads/images/2020/0604/164558_cad53170_6579152.png)
### 个人信息
![个人信息](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/3.png)
![个人信息](https://images.gitee.com/uploads/images/2020/0604/164559_e9faffd5_6579152.png)
### 修改密码
![修改密码](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/4.png)
![修改密码](https://images.gitee.com/uploads/images/2020/0604/164559_c2add273_6579152.png)
### 开课列表
![开课列表](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/5.png)
### 课程详情
![课程详情](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/6.png)
### 选课确认
![选课确认](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/7.png)
![选课确认](https://images.gitee.com/uploads/images/2020/0604/164559_6d22e60d_6579152.png)
### 已选列表
![已选列表](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/8.png)
![已选列表](https://images.gitee.com/uploads/images/2020/0604/164559_e1899878_6579152.png)
### 退课
![退课](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/9.png)

@@ -51,13 +58,12 @@
### 添加新课程
![添加新课程](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/11.png)
### 修改课程
![修改课程](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/12.png)
![修改课程](https://images.gitee.com/uploads/images/2020/0604/164602_bca45ca9_6579152.png)
### 删除课程
![删除课程](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/13.png)
![删除课程](https://images.gitee.com/uploads/images/2020/0604/164600_1f9d7371_6579152.png)
### 课程管理
![课程管理](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/14.png)
### 评分
![评分](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/15.png)
![评分](https://images.gitee.com/uploads/images/2020/0604/164603_78969b3e_6579152.png)
### 删除学生
![删除学生](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/16.png)
![删除学生](https://github.com/Zeng1998/Course-Selecting-System/raw/master/Screenshots/16.png)
\ No newline at end of file

原本有个朋友帮忙做个选课系统，我在github上找了个大兄弟写的他的链接是： https://github.com/Zeng1998/Course-Selecting-System
本身他的这个系统跑不起来，可能是我太菜了，外加我朋友有个superRoot的需求，我就给他大改了一下。
目前自己运行正常
