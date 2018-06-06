package com.nyist.repository;

import com.nyist.entity.Module;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Administrator on 2018/5/29/029.
 */
public interface ModuleRepository extends JpaRepository<Module,String>{

    Module findModuleById(String id);
}
