package com.zxc.dao;

import com.zxc.model.Student;
import com.zxc.model.Teacher;

import java.util.List;

public interface UserDao {
    public Student selectStuById(int id);
    public Teacher selectTeaById(int id);
    public void updateStuPass(Student student);
    public void updateTeaPass(Teacher teacher);
    public List<Teacher> queryAllTeacher();
}
