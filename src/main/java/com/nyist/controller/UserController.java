package com.nyist.controller;

import com.nyist.entity.*;
import com.nyist.repository.PowerRepository;
import com.nyist.repository.RolePowerRepository;
import com.nyist.result.NyistResult;
import com.nyist.service.DocumentService;
import com.nyist.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


/**
 * Created by Administrator on 2018/5/26/026.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private DocumentService documentService;

    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }
    @RequestMapping(value="/login",method= RequestMethod.POST)
    public String login(Model model, HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       User user=userService.login(username,password);
       if(user!=null){
           request.getSession().setAttribute("user",user);
           NyistResult result=userService.setUserPower(user);
           request.getSession().setAttribute("powerList",result.getData());
           return "redirect:/home/index";
       }
        return "index";
    }
    @RequestMapping("/index")
    public String toFalse(){
        return "index";
    }
    @RequestMapping(value = "/message",method = RequestMethod.GET)
    public ModelAndView toMessage(){
        ModelAndView modelAndView=new ModelAndView();
//        NyistResult result=userService.findUserBy(id);
//        modelAndView.addObject("user",result.getData());
        modelAndView.setViewName("message");
        return modelAndView;
    }
    @RequestMapping("/success")
    public String toSuccess(){
        return "success";
    }
    @RequestMapping(value="/creduce",method = RequestMethod.POST)
    @ResponseBody
    public  List<User> giveCModel(String[] array){
        if(array==null || array.length ==0){
            array = new String[1];
            array[0] = "-1";
        }
        List<User> users=userService.findOtherCUsers(array);
        if(users==null){
            return null;
        }else{
            return users;
        }

    }
    @RequestMapping(value="/mreduce",method = RequestMethod.POST)
    @ResponseBody
    public  List<User> giveMModel(String[] array){
        if(array==null || array.length ==0){
            array = new String[1];
            array[0] = "-1";
        }
        List<User> users=userService.findOtherMUsers(array);
        if(users==null){
            return null;
        }else{
            return users;
        }

    }
    @RequestMapping("/chineseGive")
    public String giveUserModek(MuList muList){
        userService.giveModel(muList);
        return "success";
    }
    @RequestMapping(value = "/toapproval",method = RequestMethod.GET)
    public String toapproval(Model model){
        /*NyistResult result=userService.getApproveMessgae(uid);
        List<Approval> approvalList= (List<Approval>) result.getData();
        model.addAttribute("approvalList",approvalList);*/
        NyistResult result=documentService.findApproveDocument(1);
        List<Document> documentList= (List<Document>) result.getData();
        model.addAttribute("documentList",documentList);
        return "approval";
    }
}
