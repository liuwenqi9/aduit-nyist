package com.nyist.repository;

import com.nyist.entity.Power;
import org.hibernate.annotations.Parameter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/5/27/027.
 */
public interface PowerRepository extends JpaRepository<Power,String> {

    @Query(value = "select * from power  where id in (:pids)", nativeQuery=true)
     List<Power> findPowerByRole(@Param("pids") String[] pids);
}
