package com.nyist.repository;

import com.nyist.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/5/26/026.
 */
public interface UserRepository extends JpaRepository<User,String> {
    User findUserByUsernameAndPassword(String username, String password);
    User findUserById(String id);
    @Query(value="select * from user where role=?1",nativeQuery=true)
    List<User> findUserByRoleIs(Integer role);
    @Query("select u from User u where id not in (:array) and role=2 and groupd=1")
    List<User> findUserElse(@Param("array") String[] array);
    @Query("select u from User u where id not in (:array) and role=2 and groupd=2")
    List<User> findUserElse2(@Param("array") String[] array);
    List<User> findUserByRoleAndGroupd(Integer role,Integer group);

}
