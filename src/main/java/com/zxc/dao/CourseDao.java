package com.zxc.dao;

import com.zxc.model.Course;
import com.zxc.model.Course_choose;
import com.zxc.model.Course_limit;
import com.zxc.model.Institution;

import java.util.List;

public interface CourseDao {
    public List<Course> queryCourseById(int id);
    public List<Integer> queryInsIdByCourseId(int id);
    public String selectNameByInsId(int id);
    public List<Institution> queryAllIns();
    public void insertCourse(Course course);
    public void insertInsLimit(Course_limit course_limit);
    public Course queryCourseInfoById(int id);
    public List<Integer> selectCourseLimit(int classId);
    public void updateCourse(Course course);
    public int selectMaxCourseId();
    public void updateInsLimit(Course_limit course_limit);
    public void deleteInsLimit(int id);
    public void deleteCourseById(int id);
    public void deleteStuByClassId(int id);
    public void deleteLimitByClassId(int id);
    public List<Course_choose> queryStuIdByCourseId(int id);
    public void updateScore(Course_choose course_choose);
    public List<Course> queryAllCourse();
    public List<Integer> selectInsIdByClassId(int classId);
    public String selectTeaNameByTeaId(int id);
    public Course selectCourseByClassId(int id);
    public void addChooseNum(int id);
    public void addCourseChoose(Course_choose course_choose);
    public List<Integer> queryCourseIdByStuId(int id);
    public void downChooseNum(int id);
    public void deleteCourseChoose(Course_choose course_choose);
    public int selectScore(Course_choose course_choose);
}
