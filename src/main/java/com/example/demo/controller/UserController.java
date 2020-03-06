package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.Manger.FavoriteManger;
import com.example.demo.entity.*;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.dto.UserDTO;
import com.example.demo.entity.redis.RedisCompanyDTO;
import com.example.demo.entity.redis.RedisPositionDTO;
import com.example.demo.service.*;
import com.example.demo.service.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @Autowired
    private FavoriteManger favoriteManger;

    @Autowired
    private DeliverService deliverService;

    @Autowired
    private RedisService redisService;

    /**
     * 跳转登陆页面
     *
     * @return
     */
    @RequestMapping("/tologin")
    public String tologin() {
        return "login";
    }

    /**
     * 登陆
     *
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
            //将简历id插入用户表中
            Resume resume1 = resumeService.queryByUserId(id);
            newUser.setResumeId(resume1.getResumeId());
            userService.updateUser(newUser);
            return "login";
        }

    }

    /**
     * 网站首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        //展示十二家公司
        List<Company> companyList = new ArrayList<>();
        //最新发布的9个职业
        List<PositionDTO> positionDTOList = new ArrayList<>();


        //先根据key去查一下是否有缓存 有就用缓存 无则 查看
        String company = redisService.getString("companyList");
        if(StringUtils.isEmpty(company)){
            companyList = companyService.showCompany();

            //写入redis 过期一小时
            RedisCompanyDTO redisCompanyDTO = new RedisCompanyDTO();
            redisCompanyDTO.setCompanyList(companyList);
            redisService.setNX("companyList", JSON.toJSONString(redisCompanyDTO),3600);
        }else {
            RedisCompanyDTO redisCompanyDTO = JSON.parseObject(company, RedisCompanyDTO.class);
            companyList = redisCompanyDTO.getCompanyList();
        }

        String position = redisService.getString("positionList");

        if(StringUtils.isEmpty(position)){
            positionDTOList = positionService.FindTopPosition();
            //写入redis 过期一小时
            RedisPositionDTO redisPositionDTO = new RedisPositionDTO();
            redisPositionDTO.setPositionList(positionDTOList);
            redisService.setNX("positionList",JSON.toJSONString(redisPositionDTO),3600);
        }else {
            RedisPositionDTO redisPositionDTO = JSON.parseObject(position, RedisPositionDTO.class);
            positionDTOList = redisPositionDTO.getPositionList();
        }

        model.addAttribute("companyList", companyList);
        model.addAttribute("positionDTOList", positionDTOList);

        return "index";
    }


    /**
     * 注销
     *
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
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/personal")
    public String personal(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (Objects.isNull(user)) {
            return "redirect:/user/tologin";

        }
        UserDTO userDTO = userService.findResumeByUser(user.getUserId());
        if (Objects.nonNull(userDTO)) {
            //我的收藏以及投递过的简历数量
            List<Favorite> favourite = favoriteManger.findFavourite(Favorite.builder().userId(user.getUserId()).build());
            if (!CollectionUtils.isEmpty(favourite)) {
                userDTO.setMyFavourites(favourite.size());
            } else {
                userDTO.setMyFavourites(0);
            }
            List<Deliver> delivers = deliverService.queryUserDeliverHistory(user.getUserId());
            if (!CollectionUtils.isEmpty(delivers)) {
                userDTO.setDelivers(delivers.size());
            } else {
                userDTO.setDelivers(0);
            }
        } else {
            UserDTO userDTO1 = new UserDTO();
            userDTO1.setDelivers(0);
            userDTO1.setMyFavourites(0);
            model.addAttribute("userDTO", userDTO1);
            return "resume";
        }
        model.addAttribute("userDTO", userDTO);
        return "resume";
    }

    /**
     * 更新个人基本信息
     */
    @RequestMapping("/editUser")
    public String editUser(HttpServletRequest request, MultipartFile userPhoto1, User user, HttpSession session) throws IOException {
        User user1 = (User) session.getAttribute("user");
        if (Objects.isNull(user1)) {
            return "redirect:/user/tologin";

        }
        user.setUserId(user1.getUserId());
        user.setResumeId(user1.getResumeId());
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
     *
     * @throws IOException
     */
    @RequestMapping("/editResume")
    public String editResume(HttpServletRequest request, MultipartFile resumePhoto1, Resume resume, HttpSession session) throws IOException {
        User user1 = (User) session.getAttribute("user");
        if (Objects.isNull(user1)) {
            return "redirect:/user/tologin";

        }
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
