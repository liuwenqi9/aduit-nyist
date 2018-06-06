package com.nyist.interceptor;

import com.nyist.entity.Power;
import com.nyist.entity.RolePower;
import com.nyist.entity.User;
import com.nyist.repository.PowerRepository;
import com.nyist.repository.RolePowerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2018/5/26/026.
 */
public class InterceptorConfig implements HandlerInterceptor {
    @Autowired
    private PowerRepository powerRepository;
    @Autowired
    private RolePowerRepository rolePowerRepository;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user=(User)request.getSession().getAttribute("user");
        if(user!=null){

//            List<RolePower> list=rolePowerRepository.findPidByRole(user.getRole());
//            String[] pids=new String[list.size()];
//            for(int i=0;i<list.size();i++){
//                pids[i]=list.get(i).getPowerByPid().getId();
//            }
//            List<Power> powerList=powerRepository.findPowerByRole(pids);
//            request.setAttribute("powerList",powerList);
            return true;
        }else{
            response.sendRedirect(request.getContextPath()+"/user/index");
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        User user=(User)request.getSession().getAttribute("user");
//        if(user!=null) {
//            List<RolePower> list = rolePowerRepository.findPidByRole(user.getRole());
//            String[] pids = new String[list.size()];
//            for (int i = 0; i < list.size(); i++) {
//                pids[i] = list.get(i).getPowerByPid().getId();
//            }
//            List<Power> powerList = powerRepository.findPowerByRole(pids);
//            request.setAttribute("powerList", powerList);
//        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
