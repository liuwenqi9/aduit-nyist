package com.nyist.controller;

import com.nyist.entity.Document;
import com.nyist.entity.DocumentList;
import com.nyist.entity.Module;
import com.nyist.entity.User;
import com.nyist.result.NyistResult;
import com.nyist.service.DocMoudleService;
import com.nyist.service.DocumentService;
import com.nyist.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by Administrator on 2018/5/27/027.
 */

@Controller
@RequestMapping("/document")
public class DocumentController {

    @Autowired
    private DocumentService documentService;
    @Autowired
    private DocMoudleService docMoudleService;
    @RequestMapping("/findDocument")
    public ModelAndView findDocument(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        String yearString=sdf.format(date);
        int year = Integer.valueOf(yearString).intValue();
        NyistResult result =documentService.findDocumentByYear(year);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("documentList",result.getData());
        modelAndView.setViewName("/document_list");
        return modelAndView;
    }
    @RequestMapping(value="/save",method = RequestMethod.POST)
    public String saveDocument(Model model, Document document){
            document.setIsOk(1);
            document.setUploadtime(new Date());
            documentService.addDocument(document);
            return "redirect:/document/findDocument";
    }
    @RequestMapping("/toadd")
    public String toadd(HttpServletRequest request,Model model){
        User user= (User) request.getSession().getAttribute("user");
        NyistResult result=documentService.getLiomitCount(user.getId());
        Integer limtCount= (Integer) result.getData();
            model.addAttribute("count", limtCount);
        return "document_add";
    }
    @RequestMapping(value ="/add",method=RequestMethod.POST)
    public String addDocument(HttpServletRequest request,@RequestParam("file") MultipartFile file, Document document)throws Exception {
        //获取文件名称
        String fileName = file.getOriginalFilename();
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        String filePath="F://ideaUpload//";
        String pathName=FileUtils.uploadFile(file,filePath,fileName);
        document.setIsSelect(0);
        document.setIsOk(1);
        document.setFilename(fileName);
        document.setUploadtime(new Date());
        document.setFileurl(pathName);
        User user= (User) request.getSession().getAttribute("user");
        document.setUser(user);
        document.setGroupd(user.getGroupd());
        documentService.save(document);
        return "redirect:/document/findDocument";
    }
    //多文件上传
    @RequestMapping(value="/addall",method=RequestMethod.POST)
    public String addAllDocument(HttpServletRequest request, DocumentList documentList) throws Exception {
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("file");
            documentService.addAllDocument(request,files,documentList);
            return "redirect:/document/findDocument";
    }

    //到抽签页面
    @RequestMapping(value="/check",method=RequestMethod.GET)
    public ModelAndView toCheck(){
        NyistResult result=documentService.findCheckResultList();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("checkList",result.getData());
        modelAndView.setViewName("document_check");
        return modelAndView;
    }
    @RequestMapping(value="/choose",method=RequestMethod.POST)
    @ResponseBody
    public List<Document> choose(String uid){
        NyistResult result=documentService.findDocumentByUid(uid);
        List<Document> documentList= (List<Document>) result.getData();
        return documentList;
    }
    @RequestMapping(value="/checked",method=RequestMethod.POST)
    public String checked(Model model,Document document){

        Integer did=document.getId();
        documentService.updateAll(did);
        documentService.checked(did);
        return "success";
    }
    //再点击去打分按钮后进入链接
    @RequestMapping(value = "/toReview/{did}",method = RequestMethod.GET)
    public String toReview(Model model, @PathVariable Integer did,HttpServletRequest request){
        NyistResult result=documentService.findDocumentById(did);
        User user= (User) request.getSession().getAttribute("user");
        NyistResult result1=docMoudleService.findDocMoudelByDidAndUid(did,user.getId());
        model.addAttribute("document",result.getData());
        model.addAttribute("docmoudle",result1.getData());
        return "document_review";
    }
    @RequestMapping("/download/{did}")
    public String downloadFile(HttpServletRequest request, HttpServletResponse response,@PathVariable Integer did) throws Exception {
        NyistResult result=documentService.findDocumentById(did);
        Document document= (Document) result.getData();
        String fileName=document.getFilename();
        String filePath="F://ideaUpload//";
        File file = new File(filePath , fileName);
        response.setHeader("content-type", "application/octet-stream");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        byte[] buffer = new byte[1024];
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        fis = new FileInputStream(file);
        bis = new BufferedInputStream(fis);
        OutputStream os = response.getOutputStream();
        int i = bis.read(buffer);
        while (i != -1) {
            os.write(buffer, 0, i);
            i = bis.read(buffer);
        }
        return null;
    }
    @RequestMapping(value="/findYear",method = RequestMethod.POST)
    @ResponseBody
    public List<Document> findYear(Integer year){
        NyistResult result=documentService.findDocumentByYear(year);
        List<Document> documentList= (List<Document>) result.getData();
        return documentList;
    }
    @RequestMapping(value="/toraking")
    public String toRaking(Model model){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        String yearString=sdf.format(date);
        int year = Integer.valueOf(yearString).intValue();
        NyistResult result =documentService.findCompleteDocument(year);
        model.addAttribute("rankList",result.getData());
        return "rank";
    }
}
