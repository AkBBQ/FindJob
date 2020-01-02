package com.example.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.entity.*;
import com.example.demo.service.DeliverService;
import com.example.demo.service.PositionService;
import com.example.demo.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RequestMapping("/backDeliver")
@Controller
public class BackDeliverController {

    @Autowired
    private DeliverService deliverService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private ResumeService resumeService;

    @RequestMapping("addDeliver")
    @ResponseBody
    public Object addDeliver(String positionId, HttpSession session, Model model){
        int id=Integer.parseInt(positionId);
        User user=(User)session.getAttribute("user");
        //List<Deliver> deliverList = deliverService.queryByPositionId(id);
        Position position = positionService.getById(id);
        Resume resume = resumeService.queryByUserId(user.getUserId());


        String msg="";
        if(null == user) {
            msg="no";
            HashMap<String,String> maps=new HashMap<String, String>();
            maps.put("result", msg);
            return JSONArray.toJSONString(maps);
        }
        Deliver deliver = new Deliver();
        deliver.setPositionId(id);
        deliver.setUserId(user.getUserId());
        deliver.setCompanyId(position.getCompanyId());
        deliver.setResumeId(resume.getResumeId());

        deliverService.addDeliver(deliver);

        msg="true";

        HashMap<String,String> maps=new HashMap<String, String>();
        maps.put("result", msg);
        return JSONArray.toJSONString(maps);
    }

    @RequestMapping("updateDeliver")
    @ResponseBody
    public Object updateDeliver(String deliverId, HttpSession session, String state){
        int id=Integer.parseInt(deliverId);
//        Company company = (Company)session.getAttribute("company");
//        if (null == company) {
//            return "/backUser/toBackLogin";
//        }

        int stateId = Integer.parseInt(state);

        String msg="";
        deliverService.updateDeliver(id, stateId);
        msg="true";

        HashMap<String,String> maps=new HashMap<String, String>();
        maps.put("result", msg);
        return JSONArray.toJSONString(maps);
    }
}
