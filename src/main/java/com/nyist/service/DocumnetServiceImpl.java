package com.nyist.service;


import antlr.collections.impl.LList;
import com.nyist.entity.*;
import com.nyist.repository.DocumentRepository;
import com.nyist.repository.UserRepository;
import com.nyist.result.NyistResult;
import com.nyist.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2018/5/27/027.
 */
@Service
@Transactional
public class DocumnetServiceImpl implements DocumentService {
    @Autowired
    private DocumentRepository documentRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public NyistResult addDocument(Document document) {
        documentRepository.save(document);
        return NyistResult.ok();
    }

    @Override
    public NyistResult findAll() {
        List<Document> documentList=documentRepository.findAll();
        return NyistResult.ok(documentList);
    }
    @Override
    public void save(Document document) {
        documentRepository.save(document);
    }

    @Override
    public NyistResult findDocumentByUid(String uid) {
        List<Document> documentList=documentRepository.findDocumentByUid(uid);
        return NyistResult.ok(documentList);
    }

    @Override
    public NyistResult findCheckResultList() {
        //找到所有学院
        List<User>users=userRepository.findUserByRoleIs(3);
        List<CheckResult> checkResultList=new ArrayList<>();
        for(User user:users){
            CheckResult checkResult=findCheckResult(user.getId());
            checkResultList.add(checkResult);
        }
        return NyistResult.ok(checkResultList);
    }


    public CheckResult findCheckResult(String uid) {
        CheckResult checkResult=new CheckResult();
        User user=userRepository.findUserById(uid);
        List<Document> documentList=documentRepository.findDocumentByUid(uid);
        checkResult.setRid(uid);
        checkResult.setRoomName(user.getUsername());
        checkResult.setGroud(user.getGroupd());
        checkResult.setRoomCount(documentRepository.getDocumentCount(uid));
        checkResult.setUploadTime(documentList.get(0).getUploadtime());
        return checkResult;
    }

    @Override
    public void addAllDocument(HttpServletRequest request, List<MultipartFile> files,DocumentList documentList) throws Exception {
        String filePath="F://ideaUpload//";
        MultipartFile file = null;
       // String pathName=null;
        List<Document> documents=documentList.getDocuments();
        for(int i=0;i<files.size();i++){
            Document document=documents.get(i);
            file=files.get(i);
            String fileName=file.getOriginalFilename();
            String pathName=FileUtils.uploadFile(file,filePath,fileName);
            document.setIsSelect(0);
            document.setIsOk(1);
            document.setFilename(fileName);
            document.setUploadtime(new Date());
            document.setFileurl(pathName);
            User user= (User) request.getSession().getAttribute("user");
            document.setUser(user);
            document.setGroupd(user.getGroupd());
            documentRepository.save(document);
        }
    }

    @Override
    public NyistResult findDocumentById(Integer did) {
        Document document=documentRepository.findDocumentById(did);
        return NyistResult.ok(document);
    }

    @Override
    public NyistResult findApproveDocument(Integer Select) {
        List<Document> documentList=documentRepository.findDocumentByIsSelect(1);
        return NyistResult.ok(documentList);
    }

    @Override
    public void checked(Integer did) {

       documentRepository.checked(did);
    }

    @Override
    public void updateAll(Integer did) {
        Document document= documentRepository.findDocumentById(did);
        User user=document.getUser();
        documentRepository.updateall(did,user.getId());
    }

    @Override
    public NyistResult getLiomitCount(String id) {
        Integer fileCount=documentRepository.getIsCount(id);
        return NyistResult.ok(fileCount);
    }

    @Override
    public NyistResult findDocumentByYear(Integer year) {
        List<Document> documentList=documentRepository.findDocumentByYear(year);
        return NyistResult.ok(documentList);
    }
    @Override
    public NyistResult findCompleteDocument(Integer year){
        List<Document> documentList=documentRepository.findDocumentByYearAndIsOk(year);
        if(documentList!=null&&documentList.size()>0) {
            Collections.sort(documentList, new Comparator<Document>() {
                public int compare(Document arg0, Document arg1) {
                    int sort0 = arg0.getLastScores();
                    int sort1 = arg1.getLastScores();
                    if (sort1 > sort0) {
                        return 1;
                    } else if (sort1 == sort0) {
                        return 0;
                    } else {
                        return -1;
                    }
                }
            });
        }
        return  NyistResult.ok(documentList);
    }
}
