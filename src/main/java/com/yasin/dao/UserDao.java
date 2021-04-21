package com.yasin.dao;

import com.yasin.model.Root;
import com.yasin.model.Student;
import com.yasin.model.Teacher;

import java.util.List;

public interface UserDao {
    public Student selectStuById(int id);
    public Teacher selectTeaById(int id);
    public Root selectRootById(int id);
    public void updateStuPass(Student student);
    public void updateTeaPass(Teacher teacher);
    public void updateRootPass(Root root);
    public List<Teacher> queryAllTeacher();
    public List<Student> queryAllStudent();

    public int insertStudent(Student student);
    public int insertTeacher(Teacher teacher);

    public void deleteStudentById(int id);
    public void deleteStudentInScoreById(int id);

    public void deleteTeacherById(int id);
    public void deleteTeacherInScoreById(int id);

    public void updateStu(Student student);
    public void updateTea(Teacher teacher);
}
