package com.example.demo.controller.back;

import com.example.demo.Manger.CompanyManger;
import com.example.demo.entity.Company;
import com.example.demo.service.CompanyService;
import com.example.demo.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * 后台公司Controller
 *
 * @author xxx
 */
@Controller
@RequestMapping("/backCompany")
public class BackCompanyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private CompanyManger companyManger;




    /**
     * 注册公司页面跳转
     *
     * @return
     */
    @RequestMapping("/toRegister")
    public String toRegister() {
        return "/background/Register";
    }

    /**
     * 注册公司
     *
     * @return
     */
    @RequestMapping("/doRegister")
    public String doRegister(Company company,Model model) {
        try {
            Company queryResult = companyManger.findCompanyByCompanyNum(company.getCompanyNum());
            if(Objects.nonNull(queryResult)){
                model.addAttribute("message", "该账号已经被注册过！");
                return "/toRegister";
            }
            companyManger.addCompany(company);
            return "redirect:/backUser/toBackLogin";
        } catch (Exception e) {
            return "404";
        }
    }


    /**
     * 公司列表
     *
     * @return
     */
    @RequestMapping("/companyList")
    public String getCompanyList(String companyName, Model model, String currentPage, HttpSession session) {
        String condition = " 1=1 ";
        int currentpage = 0;
        if (currentPage == null || currentPage.trim().equals("")) {
            currentpage = 1;
        } else {
            currentpage = Integer.parseInt(currentPage);
        }
        Map<String, Object> map = new HashMap<String, Object>();

        if (companyName != null) {
            condition += " and companyName like '%" + companyName + "%' ";
        }
        Company company = (Company) session.getAttribute("company");
        if (company.getStatus() == 0) {
            condition += " and companyId =" + company.getCompanyId();
        }
        int count = companyService.getPageCount(condition);
        int pageSize = 6;
        PageUtil<Company> param = new PageUtil<Company>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow = param.getStartRow();

        List<Company> companyList = companyService.getCompanyList(startRow, pageSize, condition);
        param.setList(companyList);
        model.addAttribute("companyList", companyList);
        model.addAttribute("util", param);
        model.addAttribute("companyName", companyName);
        model.addAttribute("currentPage", currentpage);
        return "/background/ListCompany";
    }

    /**
     * 修改公司信息
     *
     * @param model
     * @param companyId
     * @return
     */
    @RequestMapping("/{companyId}/toModifyCompany")
    public String toModifyBook(Model model, @PathVariable("companyId") String companyId) {
        int id = Integer.parseInt(companyId);
        Company company = companyService.queryByCompanyId(id);
        model.addAttribute("company", company);
        return "/background/modifyCompany";
    }


    @RequestMapping("/doModifyCompany")
    public String doModifyBook(Company company,
                               @RequestParam("companyPhoto1") MultipartFile file,
                               HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{

        if (!file.isEmpty()) {
            String path = request.getRealPath("/resource/uploads/") + File.separator
                    + System.currentTimeMillis() + file.getOriginalFilename();
            File newFile = new File(path);
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            if (suffix.equalsIgnoreCase(".jpg") || suffix.equalsIgnoreCase(".jpeg")) {
                Random random = new Random();
                file.transferTo(newFile);
                //截取掉根路径
                path=path.substring(path.lastIndexOf("/resource"));

                company.setCompanyPhoto(path);
                companyService.update(company);
                model.addAttribute("companyName", company.getCompanyName());
                return "forward:/backCompany/companyList";
            } else {
                request.setAttribute("msg", "修改成功");
                return "forward:/backCompany/companyList";
            }
        } else {
            return "forward:/backCompany/companyList";
        }
    }


    public static void main(String[] args) {
        String path = "forward:/backCompany/companyList";
        String substring = path.substring(path.lastIndexOf("/back"));
        System.out.println(substring);

    }
}
