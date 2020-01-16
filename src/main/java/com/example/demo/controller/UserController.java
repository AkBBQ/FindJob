package com.example.demo.controller;

import com.example.demo.entity.Company;
import com.example.demo.entity.Resume;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.dto.UserDTO;
import com.example.demo.service.CompanyService;
import com.example.demo.service.PositionService;
import com.example.demo.service.ResumeService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 用户Controller
 * @author xxx
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private CompanyService companyService;


    @Autowired
    private ResumeService resumeService;

    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }


    @RequestMapping("/personal")
    public String personal(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");

        UserDTO userDTO = userService.findResumeByUser(user.getUserId());
        model.addAttribute("userDTO", userDTO);

        return "resume";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/doRegister")
    public String doRegister(User user, Model model){

        User users = userService.findByTel(user.getUserTel());
        if (null != users) {
            model.addAttribute("message", "该电话已经被注册过！");
            model.addAttribute("userName", user.getUserName());
            return "register";

        } else {

            userService.register(user);
            int id = userService.getLastId();
            Resume resume = new Resume();
            resume.setUserId(id);
            resumeService.addResume(resume);
            return "login";
        }

    }


    @RequestMapping("/index")
    public String index(Model model){
        List<PositionDTO> positionDTOList = positionService.FindTopPosition();
        List<Company> companyList = companyService.showCompany();
        model.addAttribute("companyList",companyList);
        model.addAttribute("positionDTOList",positionDTOList);

        return "index";
    }


    @RequestMapping("/doLogin")
    public String doLogin(String userTel, String userPwd, HttpSession session){

        User user=userService.login(userTel, userPwd);
        if(user!=null){
            session.setAttribute("user", user);
            return "redirect:/user/index";
        }else{
            return "login";
        }
    }

    @RequestMapping("/logOut")
    public String doLogOut(HttpSession session)throws Exception{
        session.invalidate();
        return "redirect:/user/index";
    }


    /**
     * 更新用户信息
     */
    @RequestMapping("/editUser")
    public String editUser(HttpServletRequest request, MultipartFile userPhoto1, User user,HttpSession session,MultipartFile resumePhoto1,Resume resume) throws  IOException {
        User user1 = (User)session.getAttribute("user");
        user.setUserId(user1.getUserId());
        //上传图片
        if(userPhoto1.getSize()!=0) {
            String newFileName = uploadFile(request,userPhoto1);
            user.setUserPhoto(newFileName);
        }
        userService.updateUser(user);
        return "redirect:/resume/toAddResume";
    }

    @RequestMapping("/editResume")
    public String editResume(HttpServletRequest request,MultipartFile resumePhoto1,Resume resume,HttpSession session) throws  IOException {
        User user1 = (User)session.getAttribute("user");
        resume.setUserId(user1.getUserId());
        if(resumePhoto1.getSize()!=0) {
            String newFileName = uploadFile(request,resumePhoto1);
            resume.setResumePhoto(newFileName);
        }
        resumeService.updateResume(resume);
        return "redirect:/resume/toAddResume";
    }

    //上传文件
    public String  uploadFile(HttpServletRequest request, MultipartFile uploadFile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());
        //uploads文件夹位置
        String rootPath =request.getServletContext().getRealPath("/resource/uploads/");
        //原始名称
        String originalFilename = uploadFile.getOriginalFilename();
        //新的文件名称
        String newFileName = Math.random()+res+originalFilename.substring(originalFilename.lastIndexOf("."));
        //创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR)
                + File.separator + (date.get(Calendar.MONTH)+1));
        //新文件
        File newFile = new File(rootPath+File.separator+dateDirs+File.separator+newFileName);
        //判断目标文件所在的目录是否存在
        if(!newFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        //将内存中的数据写入磁盘
        uploadFile.transferTo(newFile);
        //完整的url
        String fileUrl =  "/resource/uploads/"+date.get(Calendar.YEAR)+ "/"+(date.get(Calendar.MONTH)+1)+ "/"+ newFileName;
        return fileUrl;
    }

}
