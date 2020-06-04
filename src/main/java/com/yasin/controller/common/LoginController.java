package com.yasin.controller.common;

import com.yasin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"username","teaid","stuid","rootid"})
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "check",method = RequestMethod.POST)
    public String checkAccount(@RequestParam("userid") int id,@RequestParam("userpass") String pass,Model model,HttpServletRequest request) {
        if (userService.checkAccount(id, pass) == 2) {
            model.addAttribute("username",userService.getTeaNameById(id));
            model.addAttribute("teaid",id);
            return "redirect:teacher/teacherIndex";
        }
        else if(userService.checkAccount(id, pass) == 1){
            model.addAttribute("username",userService.getStuNameById(id));
            model.addAttribute("stuid",id);
            return "redirect:student/studentIndex";
        }
        else if (userService.checkAccount(id, pass) == 9){
            model.addAttribute("username",userService.getRootNameById(id));
            model.addAttribute("rootid",id);
            return "redirect:root/rootIndex";
        }
        else{
            model.addAttribute("msg","密码错误");
            //这里不加redirect，否则前端el取不到值
            return "login";
        }
    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }
}
