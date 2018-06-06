package com.nyist.service;

import com.nyist.entity.DocMoudle;
import com.nyist.entity.Document;
import com.nyist.entity.User;
import com.nyist.result.NyistResult;

/**
 * Created by Administrator on 2018/5/27/027.
 */
public interface DocMoudleService {
    NyistResult getResult();
    NyistResult findDocMoudelByDid(Integer did);
    NyistResult findDocMoudelByDidAndUid(Integer did,String uid);

    NyistResult review(User user, DocMoudle docMoudle, Integer ddid);

    void startDocument(Integer did);

    void UserStart(String uid);
}
