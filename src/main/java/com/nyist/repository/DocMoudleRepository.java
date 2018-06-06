package com.nyist.repository;

import com.nyist.entity.DocMoudle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Administrator on 2018/5/26/026.
 */
public interface DocMoudleRepository extends JpaRepository<DocMoudle,Integer>{
    @Query(value="select * from doc_moudle where did=?1",nativeQuery=true)
    List<DocMoudle> findDocMoudleByDid(Integer did);
    @Query(value="select * from doc_moudle where did=?1 and uid=?2",nativeQuery=true)
    DocMoudle findDocMoudleByDidAndUid(Integer did, String uid);
    @Query(value="select count(*) from doc_moudle where did=?1",nativeQuery=true)
    Integer findCountDocMoudle(Integer ddid);
}
