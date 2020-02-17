package com.example.demo.controller;

import com.example.demo.entity.Company;
import com.example.demo.service.CompanyService;
import com.example.demo.utils.MapRemoveNullUtil;
import com.example.demo.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/selectByName")
    public void indexShowCompay(String name,String type,Model model){
        String condition=" where 1=1 ";
        HashMap<String, String> map = new HashMap<String,String>();
        if (name!=null){
           map.put("companyName",name);
       }
       if (type!=null){
           map.put("companyType",type);
       }

       MapRemoveNullUtil.removeNullEntry(map);
       Iterator it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            Object key = entry.getKey();
            Object value = entry.getValue();
            System.out.println("key=" + key + " value=" + value);
            condition = condition +" And "+key+" like '%"+value+"%'";
        }

       List<Company> companyList = companyService.selectByContion(condition);
       System.out.println(companyList.get(0));



    }

    @RequestMapping("/companyList")
    public String getCompanyList(String companyName, String companyType, Model model, String currentPage, HttpServletRequest request){
        String condition=" 1=1 ";
        int currentpage=0;
        if(currentPage==null || currentPage.trim().equals("")){
            currentpage=1;
        }else{
            currentpage=Integer.parseInt(currentPage);
        }
        Map<String,Object> map=new HashMap<String, Object>();

        if (companyName!=null){
            condition += " and companyName like '%"+companyName+"%' ";
        }
        if (companyType!=null){
            condition += " and companyType like '%"+companyType+"%' ";
        }

        int count=companyService.getPageCount(condition);
        int pageSize=12;
        PageUtil<Company> param=new PageUtil<Company>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow=param.getStartRow();

        List<Company> companyList=companyService.getCompanyList(startRow, pageSize, condition);
        param.setList(companyList);
        model.addAttribute("companyList", companyList);
        model.addAttribute("util", param);
        model.addAttribute("companyName", companyName);
        model.addAttribute("companyType",companyType);
        model.addAttribute("currentPage",currentpage);
        return "companies";
    }

    /**
     * 公司详情
     * @param companyId
     * @param model
     * @return
     */
    @RequestMapping("/companyDetail")
    public String positionDetail(String companyId, Model model){
        int id=Integer.parseInt(companyId);
        Company company=companyService.getDetail(id);
        model.addAttribute("company", company);
        model.addAttribute("companyId", id);
        return "company-details";
    }


}
