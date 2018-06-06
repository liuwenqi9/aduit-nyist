package com.nyist.controller;

import com.nyist.entity.DocMoudle;
import com.nyist.entity.Document;
import com.nyist.entity.Module;
import com.nyist.entity.User;
import com.nyist.result.NyistResult;
import com.nyist.service.DocMoudleService;
import com.nyist.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by Administrator on 2018/5/27/027.
 */
@Controller
@RequestMapping("/docmoudle")
public class DocMoudleController {
    @Autowired
    private DocMoudleService docMoudleService;
    @Autowired
    private DocumentService documentService;
    @RequestMapping("/result")
    public ModelAndView DocumentResult(){
        NyistResult result=docMoudleService.getResult();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("resultList",result.getData());
        modelAndView.setViewName("result");
        return modelAndView;
    }
    @RequestMapping(value="/particular/{did}",method = RequestMethod.GET)
    public ModelAndView DocModelList(@PathVariable Integer did){
        ModelAndView modelAndView=new ModelAndView();
        NyistResult result =docMoudleService.findDocMoudelByDid(did);
        modelAndView.addObject("docModuleList",result);
        modelAndView.setViewName("particular");
        return modelAndView;
    }
    @RequestMapping(value="/review",method=RequestMethod.POST)
    public String review(DocMoudle docMoudle,Integer ddid, HttpServletRequest request){
        //ddid:对应文档的id
        User user= (User) request.getSession().getAttribute("user");
        NyistResult result=docMoudleService.review(user,docMoudle,ddid);
        return "redirect:/user/toapproval";
    }
    @RequestMapping(value="/begin/{did}",method = RequestMethod.GET)
    public String begin(Model model,@PathVariable Integer did){
        docMoudleService.startDocument(did);
        return "redirect:/user/toapproval";
    }
    @RequestMapping(value="/reReview/{did}",method =RequestMethod.GET)
    public String reReview(Model model,@PathVariable Integer did,HttpServletRequest request){
        NyistResult result=documentService.findDocumentById(did);
        model.addAttribute("document",result.getData());
        User user= (User) request.getSession().getAttribute("user");
        NyistResult result1=docMoudleService.findDocMoudelByDidAndUid(did,user.getId());
        model.addAttribute("docmoudle",result1.getData());
        return "document_review";
    }
}
