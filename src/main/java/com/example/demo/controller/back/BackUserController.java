package com.example.demo.controller.back;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.CompanyManger;
import com.example.demo.entity.Company;
import com.example.demo.entity.User;
import com.example.demo.service.CompanyService;
import com.example.demo.service.UserService;
import com.example.demo.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backUser")
public class BackUserController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyManger companyManger;


    /**
     * 后台登陆页面
     */
    @RequestMapping("/toBackLogin")
    public String toBackLogin(){
        return "/background/login";
    }

    /**
     * 后台登录
     */
    @RequestMapping("/doBackLogin")
    @ResponseBody
    public String doBackLogin(String companyNum, String companyPwd, HttpSession session, Model model){
        Company company=companyService.backLogin(companyNum, companyPwd);
        String msg="";
        if(company!=null){
            session.setAttribute("company", company);
            msg="true";
        }else{
            msg="false";
        }
        HashMap<String,String> maps=new HashMap<String,String>();
        maps.put("result",msg);
        return JSONArray.toJSONString(maps);
    }

    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/toBackIndex")
    public String toIndex(){
        return "/background/index";
    }

    @RequestMapping("/welcome")
    public String welcome(){
        return "/background/welcome";
    }


    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session){
        session.invalidate();
        return "/background/login";
    }

    @RequestMapping("/toModifyPwd")
    public String toModifyPwd(){
        return "/background/pass";
    }

    @RequestMapping("queryPwd")
    @ResponseBody
    public Object queryPwd(String oldupassword,HttpSession session,Model model){
        Company com = (Company)session.getAttribute("company");
        Company company =companyService.backLogin(com.getCompanyNum(), oldupassword);
        session.setAttribute("oldupassword", oldupassword);
        String msg="";
        if(company!=null){
            msg="true";
        }else{
            msg="false";
        }
        HashMap<String,String> maps=new HashMap<String,String>();
        maps.put("result",msg);
        model.addAttribute("oldupassword", oldupassword);
        return JSONArray.toJSONString(maps);
    }

    @RequestMapping("updatePwd")
    @ResponseBody
    public Object updatePwd(String upassword, HttpSession session){
        Company com = (Company)session.getAttribute("company");
        com.setCompanyPwd(upassword);
        companyManger.updateCompany(com);
        HashMap<String,String> maps=new HashMap<String,String>();
        maps.put("result","true");

        return JSONArray.toJSONString(maps);
    }

    /**
     * 用户列表
     */
    @RequestMapping("/userList")
    public String getCompanyList(String userName, Model model, String currentPage, HttpServletRequest request){
        String condition=" 1=1 ";
        int currentpage=0;
        if(currentPage==null || currentPage.trim().equals("")){
            currentpage=1;
        }else{
            currentpage=Integer.parseInt(currentPage);
        }
        Map<String,Object> map=new HashMap<String, Object>();

        if (userName!=null){
            condition += " and userName like '%"+userName+"%' ";
        }
        int count=userService.getPageCount(condition);
        int pageSize=6;
        PageUtil<User> param=new PageUtil<User>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow=param.getStartRow();

        List<User> userList=userService.getUserList(startRow, pageSize, condition);
        param.setList(userList);
        model.addAttribute("userList", userList);
        model.addAttribute("util", param);
        model.addAttribute("userName", userName);
        model.addAttribute("currentPage",currentpage);
        return "/background/ListUser";
    }


}
