package com.yasin.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("index")
public class IndexController {


    @RequestMapping("/deal")
    public String deal(){

        return "login";
    }
}
