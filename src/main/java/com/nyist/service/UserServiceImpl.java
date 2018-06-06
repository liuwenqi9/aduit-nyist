package com.nyist.service;

import com.nyist.entity.*;
import com.nyist.repository.*;
import com.nyist.result.NyistResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Administrator on 2018/5/26/026.
 */
@Service
@Transactional
public class UserServiceImpl implements  UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModuleRepository moduleRepository;
    @Autowired
    private DocumentRepository documentRepository;
    @Autowired
    private PowerRepository powerRepository;
    @Autowired
    private RolePowerRepository rolePowerRepository;
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

  public User login(String username, String password){
        return userRepository.findUserByUsernameAndPassword(username,password);
    }

    @Override
    public NyistResult findUserBy(String id) {
        User user=userRepository.findUserById(id);
        return NyistResult.ok(user);
    }

    @Override
    public List<User> findOtherCUsers(String[] array) {
        return userRepository.findUserElse(array);
    }

    @Override
    public List<User> findOtherMUsers(String[] array) {
        return userRepository.findUserElse2(array);
    }

    @Override
    public void giveModel(MuList muList) {
            List<ModelResult> modelResults=muList.getMuList();
            for(ModelResult modelResult:modelResults){
                String uid=modelResult.getUid();
                String mid=modelResult.getMid();
                User user=userRepository.findUserById(uid);
                Module module=moduleRepository.findModuleById(mid);
                user.setModuleByMid(module);
            }
    }

    @Override
    public NyistResult getApproveMessgae(String uid) {
        List<Approval> approvalList=new ArrayList<>();
        User user=userRepository.findUserById(uid);
        List<Document> documentList=documentRepository.findDocumentByIsSelectAndGroupd(1,user.getGroupd());
        if(documentList!=null) {
            for (int i = 0; i < documentList.size(); i++) {
                Approval approval = new Approval();
                Module module=user.getModuleByMid();
                if(module!=null) {
                    approval.setModelName(module.getModuleName());
                    approval.setRoomName(documentList.get(i).getRoomname());
                    approval.setUsername(documentList.get(i).getUser().getUsername());
                    approvalList.add(approval);
                }
                else{
                    return NyistResult.ok();
                }
            }
        }
        return NyistResult.ok(approvalList);
    }

    @Override
    public NyistResult setUserPower(User user) {
        List<RolePower> list=rolePowerRepository.findPidByRole(user.getRole());
        String[] pids=new String[list.size()];
        for(int i=0;i<list.size();i++){
            pids[i]=list.get(i).getPowerByPid().getId();
        }
        List<Power> powerList=powerRepository.findPowerByRole(pids);
        Collections.sort(powerList, new Comparator<Power>() {
            public int compare(Power arg0, Power arg1) {
                int sort0 = arg0.getShowsort();
                int sort1 = arg1.getShowsort();
                if (sort1 < sort0) {
                    return 1;
                } else if (sort1 == sort0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
        return NyistResult.ok(powerList);
    }


}
