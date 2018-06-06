package com.nyist.controller;

import com.nyist.result.NyistResult;
import com.nyist.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/5/27/027.
 */
@Controller
@RequestMapping("/power")
public class PowerController {
    @Autowired
    private PowerService powerService;

//    @RequestMapping("/show/{role}")
//    public ModelAndView showPower(@PathVariable Integer role, Model model){
//        ModelAndView view=new ModelAndView();
//        NyistResult result =powerService.findPowerByRole(role);
//        view.addObject("powerList",result.getData());
//        view.setViewName("show");
//        return view;
//    }

}
