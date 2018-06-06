package com.nyist.service;

import com.nyist.entity.Document;
import com.nyist.entity.DocumentList;
import com.nyist.result.NyistResult;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/5/27/027.
 */
public interface DocumentService  {
    NyistResult addDocument(Document document);
    NyistResult findAll();
    void save(Document document) ;
    NyistResult findDocumentByUid(String uid);
    NyistResult findCheckResultList();
    void addAllDocument(HttpServletRequest request, List<MultipartFile> files,DocumentList documentList) throws Exception;
    NyistResult findDocumentById(Integer did);
    NyistResult findApproveDocument(Integer Select);
    void checked(Integer did);
    void updateAll(Integer did);

    NyistResult getLiomitCount(String id);

    NyistResult findDocumentByYear(Integer year);
    NyistResult findCompleteDocument(Integer year);
}
