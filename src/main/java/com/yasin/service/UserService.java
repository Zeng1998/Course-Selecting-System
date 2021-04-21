package com.yasin.service;

import com.yasin.model.Root;
import com.yasin.model.Student;
import com.yasin.model.Teacher;

import java.util.List;

public interface UserService {
    public int checkAccount(int id,String pass);
    public String getStuNameById(int id);
    public String getTeaNameById(int id);
    public String getRootNameById(int id);
    public Student getStuInfoById(int id);
    public Teacher getTeaInfoById(int id);
    public Root getRootInfoById(int id);
    public void changeStuPass(Student student);
    public void changeTeaPass(Teacher teacher);
    public void changeRootPass(Root root);
    public List<Teacher> queryAllTeacher();
    public List<Student> queryAllStudent();

    public int insertStudent(int id,String name,String pass,int ins);
    public int insertTeacher(int id,String name,String pass);

    public void deleteStudent(int id);
    public void deleteTeacher(int id);

    public void updataStudent(int id,String name,String pass,int ins);
    public void updateTeacher(int id,String name,String pass);
}
