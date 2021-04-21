package com.yasin.controller.root;

import com.yasin.model.Root;
import com.yasin.model.Student;
import com.yasin.model.Teacher;
import com.yasin.service.CourseService;
import com.yasin.service.PageService;
import com.yasin.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

@Controller
@RequestMapping("root")
public class RootController {

    @Resource
    private UserService userService;
    @Resource
    private CourseService courseService;
    @Resource
    private PageService pageService;

    @RequestMapping("/rootIndex")
    public String studentIndex(){
        return "root/rootIndex";
    }

    @RequestMapping("/rootInfo")
    public String studentInfo(@RequestParam("rootid") int id, Model model){
        model.addAttribute("root",userService.getRootInfoById(id));
        return "root/rootInfo";
    }

    @RequestMapping("/editRootPass")
    public String editRootPass(){
        return "root/editRootPass";
    }

    @RequestMapping("/changeRootPass")
    public String changPass(@RequestParam("prepass") String prepass, @RequestParam("nowpass") String nowpass, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("rootid");
        if(userService.checkAccount(id,prepass)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return "root/editRootPass";
        }
        else{
            Root root=new Root();
            root.setRootId(id);
            root.setRootPass(nowpass);
            userService.changeRootPass(root);
            model.addAttribute("root",userService.getRootInfoById(id));
            return "root/rootInfo";
        }
    }
    @RequestMapping("/changeStuPass")
    public String changStuPass(@RequestParam("prepass") String prepass, @RequestParam("nowpass") String nowpass, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("stuid");
        if(userService.checkAccount(id,prepass)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return "student/editStuPass";
        }
        else{
            Student student=new Student();
            student.setStuId(id);
            student.setStuPass(nowpass);
            userService.changeStuPass(student);
            model.addAttribute("paging",pageService.subList(1,userService.queryAllStudent()));
            return "root/studentList";
        }
    }

    @RequestMapping("/changeTeaPass")
    public String changeTeaPass(@RequestParam("prepass") String prepass, @RequestParam("nowpass") String nowpass, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("teaid");
        if(userService.checkAccount(id,prepass)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return "root/editTeaPass";
        }
        else{
            Teacher teacher=new Teacher();
            teacher.setTeaId(id);
            teacher.setTeaPass(nowpass);
            userService.changeTeaPass(teacher);
            model.addAttribute("paging",pageService.subList(1,userService.queryAllTeacher()));
            return "root/teacherList";
        }
    }

    @RequestMapping("/courseList")
    public String courseList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("paging",pageService.subList(page,courseService.queryAllCourseByRoot()));
        return "root/courseList";
    }

    @RequestMapping("/studentList")
    public String studentList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("paging",pageService.subList(page,userService.queryAllStudent()));
        return "root/studentList";
    }

    @RequestMapping("/teacherList")
    public String teacherList(@Param("page") int page, Model model, HttpServletRequest request){
        model.addAttribute("paging",pageService.subList(page,userService.queryAllTeacher()));
        return "root/teacherList";
    }

    @RequestMapping("/insertCourse")
    public String insertCourse(Model model){
        model.addAttribute("insList",courseService.queryAllIns());
        return "root/insertCourse";
    }
    @RequestMapping("/insertStudent")
    public String insertStudent(Model model){
        model.addAttribute("insList",courseService.queryAllIns());
        return "root/insertStudent";
    }
    @RequestMapping("/insertTeacher")
    public String insertTeacher(Model model){

        return "root/insertTeacher";
    }

    @RequestMapping("/editCourse")
    public String editCourse(@Param("courseid") int courseid, Model model){
        model.addAttribute("courseInfo",courseService.queryInfoById(courseid));
        model.addAttribute("checkIns",courseService.selectCourseLimit(courseid));
        model.addAttribute("insList",courseService.queryAllIns());
        return "root/editCourse";
    }
    @RequestMapping("/editStudent")
    public String editStudent(@Param("stuId") int stuId, Model model){
        model.addAttribute("stu",userService.getStuInfoById(stuId));
        return "root/editStudent";
    }
    @RequestMapping("/editTeacher")
    public String editTeacher(@Param("teaId") int teaId, Model model){
        model.addAttribute("tea",userService.getTeaInfoById(teaId));
        return "root/editTeacher";
    }



    @RequestMapping("/insertCourseSuccess")
    public String insertCourseSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        //获取插入后的课程编号
        int courseId=courseService.insertCourse(det[0],det[1],Integer.valueOf(det[3]));
        courseService.insertInsLimit(det[2],courseId);
        model.addAttribute("paging",pageService.subList(page,courseService.queryAllCourseByRoot()));
        return "root/courseList";
    }

    @RequestMapping("/insertStudentSuccess")
    public String insertStudentSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        //获取插入后的学生编号
        int studentId=userService.insertStudent(Integer.valueOf(det[0]),det[1],det[3],Integer.valueOf(det[2]));

        model.addAttribute("paging",pageService.subList(page,userService.queryAllStudent()));
        return "root/studentList";
    }
    @RequestMapping("/insertTeacherSuccess")
    public String insertTeacherSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException {
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        //获取插入后的教师编号
        int teacherId=userService.insertTeacher(Integer.valueOf(det[0]),det[1],det[2]);
        model.addAttribute("paging",pageService.subList(page,userService.queryAllTeacher()));
        return "root/teacherList";
    }

    @RequestMapping("/updateStudentSuccess")
    public String updateStudentSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]+" "+det[3]);
        userService.updataStudent(Integer.valueOf(det[0]),det[1],det[2],Integer.valueOf(det[3]));
        model.addAttribute("paging",pageService.subList(page,userService.queryAllStudent()));
        return "root/studentList";
    }

    @RequestMapping("/updateTeacherSuccess")
    public String updateTeacherSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");

        userService.updateTeacher(Integer.valueOf(det[0]),det[1],det[2]);

        model.addAttribute("paging",pageService.subList(page,userService.queryAllTeacher()));
        return "root/teacherList";
    }
    @RequestMapping("/updateCourseSuccess")
    public String updateCourseSuccess(@Param("content") String content,@Param("page") int page, Model model, HttpServletRequest request)throws UnsupportedEncodingException{
        String[] det= URLDecoder.decode(URLDecoder.decode(content,"utf-8"),"utf-8").split("\\|");
        System.out.println(det[0]+" "+det[1]+" "+det[2]+" "+det[3]);
        int courseId=courseService.updateCourse(det[0],det[1],Integer.valueOf(det[3]),Integer.valueOf(det[4]));
        System.out.println(det[2]);
        courseService.updateInsLimit(det[2],Integer.valueOf(det[4]));
        model.addAttribute("paging",pageService.subList(page,courseService.queryAllCourseByRoot()));
        return "root/courseList";
    }

    @RequestMapping("/deleteCourse")
    public String deleteCourse(@Param("courseid") int courseid, Model model){
        courseService.deleteCourse(courseid);

        model.addAttribute("paging",pageService.subList(1,courseService.queryAllCourseByRoot()));

        return "root/courseList";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(@Param("stuId") int stuId, Model model){
        System.out.println(stuId);
        userService.deleteStudent(stuId);

        model.addAttribute("paging",pageService.subList(1,userService.queryAllStudent()));

        return "root/studentList";
    }

    @RequestMapping("/deleteTeacher")
    public String deleteTeacher(@Param("teaId") int teaId, Model model){

        userService.deleteTeacher(teaId);

        model.addAttribute("paging",pageService.subList(1,userService.queryAllTeacher()));

        return "root/teacherList";
    }

    @RequestMapping("/detailCourse")
    public String detailCourse(@Param("courseid") int courseid,@Param("page") int page, Model model,HttpServletRequest request){
        model.addAttribute("paging",pageService.subList(page,courseService.queryStuByCourseId(courseid)));
        return "root/courseDetail";
    }

    @RequestMapping("/updateScore")
    public String updateScore(@Param("courseid") int courseid,@Param("stuId") int stuId,@Param("score") int score,@Param("page") Integer page,Model model){
        courseService.updateScore(courseid,stuId,score);
        model.addAttribute("paging",pageService.subList(page,courseService.queryStuByCourseId(courseid)));
        return "root/courseDetail";
    }

    @RequestMapping("/searchStu")
    public String searchStu(@Param("stuid") int stuid, @Param("courseid") int courseid, Model model){
        int page=1;
        model.addAttribute("paging",pageService.subList(page,courseService.queryStuByStuId(courseid,stuid)));
        return "root/courseDetail";
    }

    @RequestMapping("/deleteStuCourse")
    public String deleteStuCourse(@Param("stuid") int stuid,@Param("courseid") int courseid,Model model){
        courseService.deleteCourseChoose(stuid,courseid);
        model.addAttribute("paging",pageService.subList(1,courseService.queryStuByCourseId(courseid)));
        return "root/courseDetail";
    }

    @RequestMapping("/checkedCourseList")
    public String checkedCourseList(@Param("stuId") int stuId, Model model,HttpServletRequest request){
        model.addAttribute("courseList",courseService.queryStuCourse(stuId));
        model.addAttribute("stuId",stuId);
        return "root/checkedCourseList";
    }
    @RequestMapping("/removeCourse")
    public String removeCourse(@Param("courseid") int courseid,@Param("stuId") int stuId,Model model,HttpServletRequest request){
        courseService.deleteCourseChoose(stuId,courseid);
        model.addAttribute("courseList",courseService.queryStuCourse(stuId));
        model.addAttribute("stuId",stuId);
        return "root/checkedCourseList";
    }

    @RequestMapping("/courseTeaList")
    public String courseTeaList(@Param("page") int page, @Param("teaId") int teaId,Model model,HttpServletRequest request){
        model.addAttribute("paging",pageService.subList(page,courseService.queryAllById(teaId)));
        return "root/courseList";
    }
}
