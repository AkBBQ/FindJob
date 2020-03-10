package com.example.demo.controller.back;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.DeliverManger;
import com.example.demo.entity.*;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.service.DeliverService;
import com.example.demo.service.PositionService;
import com.example.demo.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequestMapping("/backDeliver")
@Controller
public class BackDeliverController {

    @Autowired
    private DeliverService deliverService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private DeliverManger deliverManger;

    @RequestMapping("addDeliver")
    @ResponseBody
    public Object addDeliver(String positionId, HttpSession session, Model model){
        int id=Integer.parseInt(positionId);
        User user=(User)session.getAttribute("user");
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
        int stateId = Integer.parseInt(state);
        String msg="";
        deliverService.updateDeliver(id, stateId);
        msg="true";
        HashMap<String,String> maps=new HashMap<String, String>();
        maps.put("result", msg);
        return JSONArray.toJSONString(maps);
    }

    @RequestMapping("deliverHistory")
    public Object updateDeliver(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        Deliver deliver = new Deliver();
        deliver.setUserId(user.getUserId());
        List<Deliver> delivers = deliverManger.queryUserDeliverHistory(deliver);
        List<DeliverDTO> deliverDTOS = new ArrayList<>();
        delivers.forEach(item->{
            DeliverDTO dto = new DeliverDTO();
            PositionDTO detail = positionService.getDetail(item.getPositionId());
            dto.setPositionId(detail.getPositionId());
            dto.setPositionName(detail.getPositionName());
            dto.setCompanyName(detail.getCompanyName());
            dto.setDeliverTime(item.getDeliverTime());
            dto.setState(item.getState());
            dto.setStateDesc(item.getState()==0?item.getState()==1?"已拒绝":"已投递":"已同意");
            deliverDTOS.add(dto);
        });

        model.addAttribute("delivers",deliverDTOS);
        return "/background/deliver-history";
    }
}
