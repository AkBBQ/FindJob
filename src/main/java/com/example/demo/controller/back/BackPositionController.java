package com.example.demo.controller.back;

import com.example.demo.entity.Category;
import com.example.demo.entity.Company;
import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.service.CategoryService;
import com.example.demo.service.PositionService;
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
@RequestMapping("/backPosition")
public class BackPositionController {

    @Autowired
    private PositionService positionService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/positionList")
    public String getCompanyList(String positionName, Model model, String currentPage, HttpSession session) {
        String condition = " 1=1 ";
        int currentpage = 0;
        if (currentPage == null || currentPage.trim().equals("")) {
            currentpage = 1;
        } else {
            currentpage = Integer.parseInt(currentPage);
        }
        Map<String, Object> map = new HashMap<>();

        if (positionName != null) {
            condition += " and positionName like '%" + positionName + "%' ";
        }
        Company company = (Company) session.getAttribute("company");
        if (company.getStatus() == 0) {
            condition += " and position.companyId =" + company.getCompanyId();
        }
        int count = positionService.getPageCount(condition);
        int pageSize = 6;
        PageUtil<PositionDTO> param = new PageUtil<PositionDTO>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow = param.getStartRow();

        List<PositionDTO> positionList = positionService.getPositionList(startRow, pageSize, condition);
        param.setList(positionList);
        model.addAttribute("positionList", positionList);
        model.addAttribute("util", param);
        model.addAttribute("positionName", positionName);
        model.addAttribute("currentPage", currentpage);
        return "/background/ListPosition";
    }

    @RequestMapping("/toAddPosition")
    public String addPosition(Model model, Position position) {
        List<Category> categoryList = categoryService.queryAll();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("position", position);
        return "/background/addPosition";
    }

    @RequestMapping("/doAddPosition")
    public String doAddPosition(Position position, HttpSession session) {
        Company company = (Company) session.getAttribute("company");
        position.setCompanyId(company.getCompanyId());
        positionService.addPosition(position);
        return "forward:/backPosition/positionList";
    }

    @RequestMapping("/{positionId}/toUpdatePosition")
    public String toUpdatePosition(Model model, @PathVariable("positionId") String positionId) {
        int id = Integer.parseInt(positionId);
        Position position = positionService.queryByPositionId(id);
        List<Category> categoryList = categoryService.queryAll();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("position", position);
        return "/background/updatePosition";
    }

    @RequestMapping("/doUpdatePosition")
    public String doUpdatePosition(Position position, HttpSession session) {
        Company company = (Company) session.getAttribute("company");
        position.setCompanyId(company.getCompanyId());
        System.out.println(position.getCompanyId());
        positionService.updatePosition(position);
        return "forward:/backPosition/positionList";
    }

    @RequestMapping("/doDeletePosition")
    public String doDeleteBook(String positionId) {
        int id = Integer.parseInt(positionId);
        positionService.deletePosition(id);
        return "forward:/backPosition/positionList";
    }

}
