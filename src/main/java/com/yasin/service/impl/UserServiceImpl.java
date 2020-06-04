package com.yasin.service.impl;

import com.yasin.dao.UserDao;
import com.yasin.model.Root;
import com.yasin.model.Student;
import com.yasin.model.Teacher;
import com.yasin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public int checkAccount(int id, String pass) {
        if(Integer.toString(id).charAt(4)=='1'){
            if(userDao.selectTeaById(id).getTeaPass().equals(pass)) {
                return 2;
            } else {
                return 0;
            }
        }
        else if (Integer.toString(id).charAt(4)=='0'){
            if(userDao.selectStuById(id).getStuPass().equals(pass)) {
                return 1;
            } else {
                return 0;
            }
        }else if (Integer.toString(id).charAt(4)=='9'){

            if(userDao.selectRootById(id).getRootPass().equals(pass)) {
                return 9;
            } else {
                return 0;
            }
        }else {
            return 0;
        }
    }

    @Override
    public String getStuNameById(int id) {
        return userDao.selectStuById(id).getStuName();
    }

    @Override
    public String getTeaNameById(int id) {
        return userDao.selectTeaById(id).getTeaName();
    }

    @Override
    public String getRootNameById(int id) {
        return userDao.selectRootById(id).getRootName();
    }

    @Override
    public Student getStuInfoById(int id) {
        return userDao.selectStuById(id);
    }

    @Override
    public Teacher getTeaInfoById(int id) {
        return userDao.selectTeaById(id);
    }

    @Override
    public Root getRootInfoById(int id) {
        return userDao.selectRootById(id);
    }

    @Override
    public void changeStuPass(Student student) {
        userDao.updateStuPass(student);
    }

    @Override
    public void changeTeaPass(Teacher teacher) {
        userDao.updateTeaPass(teacher);
    }

    @Override
    public void changeRootPass(Root root) {
        userDao.updateRootPass(root);
    }

    @Override
    public List<Teacher> queryAllTeacher() {
        return userDao.queryAllTeacher();
    }

    @Override
    public List<Student> queryAllStudent() {
        return userDao.queryAllStudent();
    }

    @Override
    public int insertStudent(int id, String name, String pass, int ins) {
        Student stu = new Student();
        stu.setStuId(id);
        stu.setStuName(name);
        stu.setStuPass(pass);
        stu.setInsId(ins);
        if (ins == 1001) {
            stu.setInsName("信息科学技术学院");
        }else if (ins == 1002){
            stu.setInsName("医学院");
        }else if (ins == 1004){
            stu.setInsName("管理学院");
        }else if (ins == 1005){
            stu.setInsName("经济学院");
        }

        return userDao.insertStudent(stu);
    }

    @Override
    public int insertTeacher(int id, String name, String pass) {

        Teacher teacher = new Teacher();
        teacher.setTeaId(id);
        teacher.setTeaName(name);
        teacher.setTeaPass(pass);
        return userDao.insertTeacher(teacher);
    }

    @Override
    public void deleteStudent(int id) {
        userDao.deleteStudentById(id);
        userDao.deleteStudentInScoreById(id);
    }

    @Override
    public void deleteTeacher(int id) {
        userDao.deleteTeacherById(id);
        userDao.deleteTeacherInScoreById(id);
    }

    @Override
    public void updataStudent(int id, String name, String pass, int ins) {
        Student stu = new Student();
        stu.setStuId(id);
        stu.setStuName(name);
        stu.setStuPass(pass);
        stu.setInsId(ins);
        if (ins == 1001) {
            stu.setInsName("信息科学技术学院");
        }else if (ins == 1002){
            stu.setInsName("医学院");
        }else if (ins == 1004){
            stu.setInsName("管理学院");
        }else if (ins == 1005){
            stu.setInsName("经济学院");
        }
        userDao.updateStu(stu);
    }

    @Override
    public void updateTeacher(int id, String name, String pass) {

        Teacher teacher = new Teacher();
        teacher.setTeaPass(pass);
        teacher.setTeaName(name);
        teacher.setTeaId(id);

        userDao.updateTea(teacher);
    }

}
