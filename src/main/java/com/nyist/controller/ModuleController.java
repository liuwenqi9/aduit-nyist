package com.nyist.controller;

import com.nyist.entity.Module;
import com.nyist.entity.ReModelResult;
import com.nyist.entity.User;
import com.nyist.repository.ModuleRepository;
import com.nyist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/5/29/029.
 */
@Controller
@RequestMapping("/module")
public class ModuleController {
    @Autowired
    private ModuleRepository moduleRepository;
    @Autowired
    private UserRepository userRepository;
    @RequestMapping("/toChineseGive")
    public ModelAndView toCGive(){
        ModelAndView modelAndView=new ModelAndView();
        List<Module>  modules=moduleRepository.findAll();
        List<User> users=userRepository.findUserByRoleAndGroupd(2,1);
        List<ReModelResult> reList=new ArrayList<>();
        for(User user:users){
                Module mou=user.getModuleByMid();
            if(mou!=null){   //如果该用户分配过模块，这放入对应类中
                ReModelResult reModelResult=new ReModelResult();
                reModelResult.setModule(mou);
                reModelResult.setUser(user);
                reList.add(reModelResult);
            }
        }
        modelAndView.addObject("moduleList",modules);
        modelAndView.addObject("userList",users);
        modelAndView.addObject("reList",reList);
        modelAndView.setViewName("/chineseGive");
        return modelAndView;
    }
    @RequestMapping("/toMatchGive")
    public ModelAndView toMGive(){
        ModelAndView modelAndView=new ModelAndView();
        List<Module>  modules=moduleRepository.findAll();
        List<User> users=userRepository.findUserByRoleAndGroupd(2,2);
        List<ReModelResult> reList=new ArrayList<>();
        for(User user:users){
            Module mou=user.getModuleByMid();
            if(mou!=null){   //如果该用户分配过模块，这放入对应类中
                ReModelResult reModelResult=new ReModelResult();
                reModelResult.setModule(mou);
                reModelResult.setUser(user);
                reList.add(reModelResult);
            }
        }
        modelAndView.addObject("moduleList",modules);
        modelAndView.addObject("userList",users);
        modelAndView.addObject("reList",reList);
        modelAndView.setViewName("/matchGive");
        return modelAndView;
    }
}
