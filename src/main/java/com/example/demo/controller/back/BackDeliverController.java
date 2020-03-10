package com.example.demo.controller.back;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.DeliverManger;
import com.example.demo.entity.Deliver;
import com.example.demo.entity.Position;
import com.example.demo.entity.Resume;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.mail.MessageCommand;
import com.example.demo.service.DeliverService;
import com.example.demo.service.PositionService;
import com.example.demo.service.ResumeService;
import com.example.demo.service.mail.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;

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

    @Autowired
    private MailService mailService;

    /**
     * 投递简历
     * @param positionId
     * @param session
     * @param model
     * @return
     */
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

    /**
     * 同意(拒绝)简历
     * @param deliverId
     * @param state
     * @return
     */
    @RequestMapping("updateDeliver")
    @ResponseBody
    public Object updateDeliver(String deliverId, String state) {
        int id = Integer.parseInt(deliverId);
        int stateId = Integer.parseInt(state);


        MessageCommand messageCommand = MessageCommand.builder().build();
        messageCommand.setSendAccount("1446547537@qq.com");

        DeliverDTO dto = deliverService.getById(id);
        String[] receivers = new String[1];
        if (Objects.nonNull(dto)) {
            receivers[0] = dto.getUserEmail();
        } else {
            receivers[0] = "1362690157@qq.com";
        }
        messageCommand.setRecieveAccount(receivers);
        if (1 == stateId) {
            //同意简历
            messageCommand.setTopic("恭喜 您的简历已经通过!");
            messageCommand.setTxt("请等待我司HR与您联系");
        } else {
            //拒绝简历
            messageCommand.setTopic("抱歉");
            messageCommand.setTxt("您的简历未通过,请继续保持努力");
        }
        //异步发送邮件通知
        CompletableFuture.runAsync(() -> mailService.sendResultToJobSeeker(messageCommand));

        String msg = "";
        deliverService.updateDeliver(id, stateId);
        msg = "true";
        HashMap<String, String> maps = new HashMap<String, String>();
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
