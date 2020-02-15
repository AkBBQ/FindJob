package com.example.demo.controller;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.service.DeliverService;
import com.example.demo.service.PositionService;
import com.example.demo.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 职位Controller
 * @author xxx
 */
@Controller
@RequestMapping("/job")
public class PositionController {

    @Autowired
    private PositionService positionService;

    @Autowired
    private DeliverService deliverService;

    /**
     * 职位列表
     */
    @RequestMapping("/jobList")
    public String getCompanyList(String positionName, String position, Model model, String currentPage){
        String condition=" 1=1 ";
        int currentpage=0;
        if(currentPage==null || currentPage.trim().equals("")){
            currentpage=1;
        }else{
            currentpage=Integer.parseInt(currentPage);
        }
        Map<String,Object> map=new HashMap<String, Object>();

        if (positionName!=null){
            condition += " and positionName like '%"+positionName+"%' ";
        }
        if (position!=null){
            condition += " and positionAddr like '%"+position+"%' ";
        }

        int count=positionService.getPageCount(condition);
        int pageSize=8;
        PageUtil<PositionDTO> param=new PageUtil<PositionDTO>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow=param.getStartRow();

        List<PositionDTO> positionList=positionService.getPositionList(startRow, pageSize, condition);
        param.setList(positionList);
        model.addAttribute("positionList", positionList);
        model.addAttribute("util", param);
        model.addAttribute("positionName", positionName);
        model.addAttribute("position",position);
        model.addAttribute("currentPage",currentpage);
        return "job-listing";
    }

    /**
     * 职位详情
     */
    @RequestMapping("/positionDetail")
    public String positionDetail(String positionId, Model model, HttpSession session){
        int id=Integer.parseInt(positionId);
        PositionDTO positionDTO=positionService.getDetail(id);
        User user = (User)session.getAttribute("user");
        if (null != user) {
            List<Deliver> deliverList = deliverService.queryByPositionId(id, user.getUserId());
            if(deliverList.size() !=0){
                int state = deliverList.get(0).getState();
                if(state == 1){
                    model.addAttribute("state", "已同意");
                } else if(state == 2){
                    model.addAttribute("state", "已拒绝");
                }else {
                    model.addAttribute("state", "已投递");
                }
                model.addAttribute("status", 0);
            } else {
                model.addAttribute("status", 1);
            }
        } else {
            model.addAttribute("status", 1);
        }


        model.addAttribute("positionDTO", positionDTO);
        model.addAttribute("positionId", id);
        return "job-details";
    }



}




