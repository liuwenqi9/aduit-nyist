package com.nyist.service;

import com.nyist.entity.Power;
import com.nyist.repository.PowerRepository;
import com.nyist.result.NyistResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/5/27/027.
 */
@Service
public class PowerServiceImpl implements PowerService {

    @Autowired
    private PowerRepository powerRepository;
//    @Override
//    public NyistResult findPowerByRole(Integer role) {
//        List<Power> powerList= powerRepository.findPowerByRole(role);
//        return NyistResult.ok(powerList);
//    }
}
