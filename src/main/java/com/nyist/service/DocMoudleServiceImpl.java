package com.nyist.service;

import com.nyist.entity.DocMoudle;
import com.nyist.entity.DocResult;
import com.nyist.entity.Document;
import com.nyist.entity.User;
import com.nyist.repository.DocMoudleRepository;
import com.nyist.repository.DocumentRepository;
import com.nyist.result.NyistResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Administrator on 2018/5/27/027.
 */
@Service
@Transactional
public class DocMoudleServiceImpl implements DocMoudleService {
    @Autowired
    private DocMoudleRepository docMoudleRepository;
    @Autowired
    private DocumentRepository documentRepository;

    public Integer SumScore(Integer did) {
        Integer sum=0;
        List<DocMoudle> moudles=docMoudleRepository.findDocMoudleByDid(did);
        for(DocMoudle doc:moudles){
            sum+=doc.getScore();
        }
        return sum;
    }
    @Override
    public NyistResult getResult(){
        Integer sum;
        List<DocResult> list=new ArrayList<DocResult>();
        DocResult result=new DocResult();
        List<Document> documentList=documentRepository.findDocumentByIsSelect(1);
        for(int i=0;i<documentList.size();i++){
            sum=0;
            result.setSelfScore(documentList.get(i).getSelfscore());
            sum=SumScore(documentList.get(i).getId());
            documentRepository.updateScore(documentList.get(i).getId(),sum);
            result.setSumScore(sum);
            result.setRoomName(documentList.get(i).getRoomname());
            result.setGroupd(documentList.get(i).getGroupd());
            result.setUserName(documentList.get(i).getUser().getUsername());
            result.setId(documentList.get(i).getId());
            list.add(result);
        }
        Collections.sort(list, new Comparator<DocResult>() {

            public int compare(DocResult r1, DocResult r2) {
                Integer sum1 = r1.getSumScore();
                Integer sum2=r2.getSumScore();
                //可以按User对象的其他属性排序，只要属性支持compareTo方法
                return sum2.compareTo(sum1);
            }
        });
        return NyistResult.ok(list);
    }

    @Override
    public NyistResult findDocMoudelByDid(Integer did) {
        List<DocMoudle> list=docMoudleRepository.findDocMoudleByDid(did);
        return NyistResult.ok(list);
    }
    @Override
    public NyistResult findDocMoudelByDidAndUid(Integer did,String uid) {
        DocMoudle docMoudle=docMoudleRepository.findDocMoudleByDidAndUid(did,uid);
        return NyistResult.ok(docMoudle);
    }

    @Override
    public NyistResult review(User user, DocMoudle docMoudle, Integer ddid) {
        docMoudle.setCreatetime(new Date());
        docMoudle.setUserByUid(user);
        docMoudle.setModuleByMid(user.getModuleByMid());
        Document document=documentRepository.findDocumentById(ddid);
        documentRepository.userStarteded(user.getId());
        docMoudle.setDocumentByDid(document);
        docMoudleRepository.save(docMoudle);
        Integer count=docMoudleRepository.findCountDocMoudle(ddid);
        if(count==9){   //如果已经有九个模块评审完成
            documentRepository.isover(ddid);
        }
        return NyistResult.ok();
    }

    @Override
    public void startDocument(Integer did) {
        documentRepository.starteded(did);
    }

    @Override
    public void UserStart(String uid) {
        documentRepository.userStarteded(uid);
    }


}
