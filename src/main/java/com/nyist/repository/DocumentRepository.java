package com.nyist.repository;

import com.nyist.entity.Document;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.print.Doc;
import java.util.List;

/**
 * Created by Administrator on 2018/5/27/027.
 */
public interface DocumentRepository extends JpaRepository<Document,Integer> {
    @Query(value="select * from document where uid=?1",nativeQuery=true)
    List<Document> findDocumentByUid(String uid);
    List<Document> findDocumentByIsSelect(Integer isSelect);
    @Query(value = "insert into document (filename, fileurl, group, is_ok, is_select, last_scores, roomname, selfscore, uploadtime, uid) values (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)",nativeQuery = true)
    public void saveDocument(String name);
    @Query(value = "select YEAR(uploadtime)  from document GROUP BY YEAR(uploadtime)",nativeQuery = true)
    public List<Integer> getYears();
    @Query(value = "select * from document  where YEAR(uploadtime)=?1",nativeQuery = true)
    public List<Document> findDocumentByYear(Integer year);
    @Query(value = "select * from document  where YEAR(uploadtime)=?1 and is_ok=0",nativeQuery = true)
    public List<Document> findDocumentByYearAndIsOk(Integer year);
    @Query(value="SELECT count(*) from document where uid=?1",nativeQuery = true)
    public Integer getDocumentCount(String uid);
    public List<Document> findDocumentByIsSelectAndGroupd(Integer isSelect,Integer groupd);
    public Document findDocumentById(Integer id);
    List<Document> findDocumentByIsOk(Integer isOk);
    @Modifying
    @Query(value = "UPDATE document d set d.is_select=1 where d.id=?1",nativeQuery = true)
    public void checked(Integer id);
    @Modifying
    @Query(value = "UPDATE document d set is_select=0 where d.id!=?1 and d.uid=?2",nativeQuery = true)
    public void updateall(Integer did,String uid);
    @Modifying
    @Query(value = "UPDATE document d set d.is_ok=0 where d.id=?1",nativeQuery = true)
    public void isover(Integer did);
    @Modifying
    @Query(value = "UPDATE document d set d.is_ok=-1 where d.id=?1",nativeQuery = true)
    public void starteded(Integer id);
    @Modifying
    @Query(value = "UPDATE document d set d.last_scores=?2 where d.id=?1",nativeQuery = true)
    public void updateScore(Integer id,Integer score);
    @Modifying
    @Query(value = "UPDATE `user` u set u.is_ok=-1 where u.id=?1",nativeQuery = true)
    public void userStarteded(String uid);
    @Query(value="SELECT count(*) from document where uid=?1 and is_ok=-1",nativeQuery = true)
    public Integer getIsCount(String id);
}
