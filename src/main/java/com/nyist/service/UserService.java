package com.nyist.service;

import com.nyist.entity.MuList;
import com.nyist.entity.User;
import com.nyist.result.NyistResult;

import java.util.List;

/**
 * Created by Administrator on 2018/5/26/026.
 */
public interface UserService {
    List<User> findAll();
    User login(String username, String password);
    NyistResult findUserBy(String id);

    List<User> findOtherCUsers(String[] array);
    List<User> findOtherMUsers(String[] array);
     void giveModel(MuList muList) ;
    NyistResult getApproveMessgae(String uid);


    NyistResult setUserPower(User user);
}
