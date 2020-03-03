package com.example.demo.controller;

import com.example.demo.Manger.EvaluateManger;
import com.example.demo.entity.Company;
import com.example.demo.entity.Evaluate;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.EvaluateDTO;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.service.PositionService;
import com.example.demo.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户Controller中心
 *
 * @author xxx
 */

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {

    @Autowired
    private EvaluateManger evaluateManger;

    @Autowired
    private PositionService positionService;

    @Autowired
    private UserService userService;

    /**
     * 跳转评价页面
     */
    @RequestMapping("/{positionId}/toEvaluate")
    public String toEvaluate(@PathVariable("positionId") String positionId, Model model,HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("positionId",positionId);
        //跳转页面带上之前评论
        Evaluate evaluate = new Evaluate();
        evaluate.setUserId(user.getUserId());
        evaluate.setPositionId(Integer.parseInt(positionId));
        model.addAttribute("evaluate",evaluateManger.queryOneEvaluate(evaluate));
        return "evaluate";
    }

    /**
     * 评论
     */
    @RequestMapping("/doEvaluate")
    public String doEvaluate(Evaluate evaluate, HttpSession session) {
        User user = (User)session.getAttribute("user");
        evaluate.setUserId(user.getUserId());
        evaluateManger.addEvaluate(evaluate);
        return "redirect:/backDeliver/deliverHistory";
    }


    /**
     * 公司查看用户评论
     */
    @RequestMapping("/showEvaluate")
    public String showEvaluate(HttpSession session,Model model) {
        Company company = (Company)session.getAttribute("company");
        Evaluate queryEvaluate = new Evaluate();
        queryEvaluate.setCompanyId(company.getCompanyId());
        List<Evaluate> evaluates = evaluateManger.queryOneCompanyEvaluate(queryEvaluate);
        //参数拼装
        List<EvaluateDTO> evaluateDTOS = new ArrayList<>(evaluates.size());
        evaluates.forEach(item->{
            EvaluateDTO dto = new EvaluateDTO();
            BeanUtils.copyProperties(item,dto);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
            dto.setCreateTime(simpleDateFormat.format(item.getCreateTime()));
            PositionDTO detail = positionService.getDetail(item.getPositionId());
            dto.setPositionName(detail.getPositionName());
            User user = userService.getById(item.getUserId());
            dto.setUserName(user.getUserName());
            evaluateDTOS.add(dto);
        });
        model.addAttribute("evaluateDTOS",evaluateDTOS);
        return "/background/ListEvaluate";
    }

}
