package com.nyist.repository;

import com.nyist.entity.RolePower;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Administrator on 2018/6/2/002.
 */
public interface RolePowerRepository extends JpaRepository<RolePower,Integer> {
    @Query(value = "SELECT * from role_power where role =?1",nativeQuery=true)
    List<RolePower> findPidByRole(Integer role);
}
