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
 * 用户Controller中心
 *
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

    /**
     * 跳转登陆页面
     * @return
     */
    @RequestMapping("/tologin")
    public String tologin() {
        return "login";
    }

    /**
     * 登陆
     * @param userTel
     * @param userPwd
     * @param session
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(String userTel, String userPwd, HttpSession session) {

        User user = userService.login(userTel, userPwd);
        if (user != null) {
            //将用户信息放入session中
            session.setAttribute("user", user);
            return "redirect:/user/index";
        } else {
            return "login";
        }
    }


    /**
     * 注册页面跳转
     *
     * @return
     */
    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    /**
     * 注册用户
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/doRegister")
    public String doRegister(User user, Model model) {
        User users = userService.findByTel(user.getUserTel());
        if (null != users) {
            model.addAttribute("message", "该电话已经被注册过！");
            model.addAttribute("userName", user.getUserName());
            return "register";
        } else {
            userService.register(user);
            User newUser = userService.findByTel(user.getUserTel());
            int id = newUser.getUserId();
            //新用户id关联一条简历信息
            Resume resume = new Resume();
            resume.setUserId(id);
            resumeService.addResume(resume);
            return "login";
        }

    }

    /**
     * 网站首页
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        //最新发布的9个职业
        List<PositionDTO> positionDTOList = positionService.FindTopPosition();
        //展示十二家公司
        List<Company> companyList = companyService.showCompany();
        model.addAttribute("companyList", companyList);
        model.addAttribute("positionDTOList", positionDTOList);

        return "index";
    }


    /**
     * 注销
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/logOut")
    public String doLogOut(HttpSession session) throws Exception {
        //session过期
        session.invalidate();
        return "redirect:/user/index";
    }

    /**
     * 展示用户信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/personal")
    public String personal(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        UserDTO userDTO = userService.findResumeByUser(user.getUserId());
        model.addAttribute("userDTO", userDTO);
        return "resume";
    }

    /**
     * 更新个人基本信息
     */
    @RequestMapping("/editUser")
    public String editUser(HttpServletRequest request, MultipartFile userPhoto1, User user, HttpSession session) throws IOException {
        User user1 = (User) session.getAttribute("user");
        user.setUserId(user1.getUserId());
        //上传图片
        if (userPhoto1.getSize() != 0) {
            String newFileName = uploadFile(request, userPhoto1);
            user.setUserPhoto(newFileName);
        }
        userService.updateUser(user);
        return "redirect:/resume/toAddResume";
    }

    /**
     * 修改简历
     * @throws IOException
     */
    @RequestMapping("/editResume")
    public String editResume(HttpServletRequest request, MultipartFile resumePhoto1, Resume resume, HttpSession session) throws IOException {
        User user1 = (User) session.getAttribute("user");
        resume.setUserId(user1.getUserId());
        if (resumePhoto1.getSize() != 0) {
            String newFileName = uploadFile(request, resumePhoto1);
            resume.setResumePhoto(newFileName);
        }
        resumeService.updateResume(resume);
        return "redirect:/resume/toAddResume";
    }

    /**
     * 上传文件
     */
    public String uploadFile(HttpServletRequest request, MultipartFile uploadFile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());
        //uploads文件夹位置
        String rootPath = request.getServletContext().getRealPath("/resource/uploads/");
        //原始名称
        String originalFilename = uploadFile.getOriginalFilename();
        //新的文件名称
        String newFileName = Math.random() + res + originalFilename.substring(originalFilename.lastIndexOf("."));
        //创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR)
                + File.separator + (date.get(Calendar.MONTH) + 1));
        //新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        //判断目标文件所在的目录是否存在
        if (!newFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        //将内存中的数据写入磁盘
        uploadFile.transferTo(newFile);
        //完整的url
        String fileUrl = "/resource/uploads/" + date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + newFileName;
        return fileUrl;
    }

}
