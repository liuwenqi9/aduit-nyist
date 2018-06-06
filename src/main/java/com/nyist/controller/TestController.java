package com.nyist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/5/26/026.
 */
@Controller
public class TestController {
    @RequestMapping("/index")
    public String testF2F() {
        return "index";
    }
}
