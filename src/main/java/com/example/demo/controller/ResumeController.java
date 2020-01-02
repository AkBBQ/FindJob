package com.example.demo.controller;

import com.example.demo.entity.Company;
import com.example.demo.entity.Resume;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.service.DeliverService;
import com.example.demo.service.ResumeService;
import com.example.demo.service.UserService;
import com.example.demo.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private DeliverService deliverService;

    @Autowired
    private UserService userService;

    @RequestMapping("/toAddResume")
    public String toAddResume(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        User u = userService.getById(user.getUserId());
        session.setAttribute("user",u);
        model.addAttribute("user",u);
        Resume resume = resumeService.queryByUserId(user.getUserId());

        model.addAttribute("resume",resume);

        return "add-resume";
    }

    @RequestMapping("/resumeList")
    public String getCompanyList(String resumeName, Model model, String currentPage, HttpSession session){
        Company company = (Company)session.getAttribute("company");
        if (null == company) {
            return "/backUser/toBackLogin";
        }
        String condition=" 1=1 ";
        int currentpage=0;
        if(currentPage==null || currentPage.trim().equals("")){
            currentpage=1;
        }else{
            currentpage=Integer.parseInt(currentPage);
        }
        Map<String,Object> map=new HashMap<String, Object>();

        if (resumeName!=null){
            condition += " and resumeName like '%"+resumeName+"%' ";
        }
        if(company.getStatus() == 1){
            int count=resumeService.getPageCount(condition);
            int pageSize=6;
            PageUtil<Resume> param=new PageUtil<Resume>();
            param.setTotalCount(count);
            param.setPageSize(pageSize);
            param.setCurrentPage(currentpage);
            int startRow=param.getStartRow();

            List<Resume> resumeList=resumeService.getResumeList(startRow, pageSize, condition);
            param.setList(resumeList);
            model.addAttribute("resumeList", resumeList);
            model.addAttribute("util", param);
            model.addAttribute("resumeName", resumeName);
            model.addAttribute("currentPage",currentpage);
            return "/background/ListResume";
        } else {
            condition +=" and companyId="+company.getCompanyId();
            int count=deliverService.getPageCount(condition);
            int pageSize=6;
            PageUtil<DeliverDTO> param=new PageUtil<DeliverDTO>();
            param.setTotalCount(count);
            param.setPageSize(pageSize);
            param.setCurrentPage(currentpage);
            int startRow=param.getStartRow();

            List<DeliverDTO> resumeList=deliverService.getDeliverList(startRow, pageSize, condition);
            param.setList(resumeList);
            model.addAttribute("resumeList", resumeList);
            model.addAttribute("util", param);
            model.addAttribute("resumeName", resumeName);
            model.addAttribute("currentPage",currentpage);
            return "/background/ListResume";
        }

    }

    @RequestMapping("/{resumeId}/resumeDetail")
    public String toModifyBook(Model model,@PathVariable("resumeId")String resumeId, HttpSession session){
        Company company = (Company)session.getAttribute("company");
        int id=Integer.parseInt(resumeId);
        if (company.getStatus() == 1){
            Resume resume=resumeService.queryByResumeId(id);
            model.addAttribute("resume", resume);
        } else {
            DeliverDTO deliverDTO = deliverService.getById(id);
            model.addAttribute("resume", deliverDTO);
        }
        return "/background/resumeDetail";
    }



}
