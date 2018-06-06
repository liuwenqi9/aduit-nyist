package com.nyist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/6/2/002.
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    @RequestMapping("/index")
    public String index(){
        return "home";
    }
    @RequestMapping("/top")
    public String top(){
        return "top";
    }
    @RequestMapping("/bottom")
    public String bottom(){
        return "bottom";
    }
    @RequestMapping("/right")
    public String right(){
        return "right";
    }
    @RequestMapping("/left")
    public String left(){
        return "left";
    }
}
