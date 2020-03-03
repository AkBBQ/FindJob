package com.example.demo.controller;

import com.example.demo.entity.Category;
import com.example.demo.service.CategoryService;
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
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * 后台分类Controller
 * @author xxx
 */
@Controller
@RequestMapping("/backCategory")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/categoryList")
    public String getCompanyList(String categoryName, Model model, String currentPage, HttpServletRequest request){
        String condition=" 1=1 ";
        int currentpage=0;
        if(currentPage==null || currentPage.trim().equals("")){
            currentpage=1;
        }else{
            currentpage=Integer.parseInt(currentPage);
        }
        Map<String,Object> map=new HashMap<String, Object>();

        if (categoryName!=null){
            condition += " and categoryName like '%"+categoryName+"%' ";
        }
        int count=categoryService.getPageCount(condition);
        int pageSize=6;
        PageUtil<Category> param=new PageUtil<Category>();
        param.setTotalCount(count);
        param.setPageSize(pageSize);
        param.setCurrentPage(currentpage);
        int startRow=param.getStartRow();

        List<Category> categoryList=categoryService.getCategoryList(startRow, pageSize, condition);
        param.setList(categoryList);
        System.out.println(categoryList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("util", param);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("currentPage",currentpage);
        return "/background/ListCategory";
    }

    @RequestMapping("/{categoryId}/toModifyCategory")
    public String toModifyBook(Model model,@PathVariable("categoryId")String categoryId){
        int id=Integer.parseInt(categoryId);
        Category category=categoryService.queryByCategoryId(id);
        model.addAttribute("category", category);
        return "/background/modifyCategory";
    }


    @RequestMapping("/doModifyCategory")
    public String doModifyBook(Category category,
                               @RequestParam("categoryPhoto1") MultipartFile file,
                               HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{

        if (!file.isEmpty()) {
            String path = request.getRealPath("/resource/uploads") + File.separator
                    + System.currentTimeMillis() + file.getOriginalFilename();
            File newFile = new File(path);
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            if (suffix.equalsIgnoreCase(".jpg") || suffix.equalsIgnoreCase(".jpeg")) {
                Random random = new Random();
                int result = random.nextInt();
                file.transferTo(newFile);
                path=path.substring(path.lastIndexOf("/resource"));
                category.setCategoryPhoto(path);
                categoryService.update(category);
                return "forward:/backCategory/categoryList";
            } else {
                request.setAttribute("msg", "修改成功");
                return "forward:/backCategory/categoryList";
            }
        } else {
            return "forward:/backCategory/categoryList";
        }
    }

}
