package com.example.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.FavoriteManger;
import com.example.demo.entity.Company;
import com.example.demo.entity.Favorite;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.dto.UserDTO;
import com.example.demo.entity.query.PositionCommand;
import com.example.demo.service.PositionService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 我的收藏Controller
 *
 * @author xxx
 */

@Controller
@RequestMapping("/favorite")
public class FavoriteController {

    @Autowired
    private FavoriteManger favoriteManger;

    @Autowired
    private PositionService positionService;

    @Autowired
    private UserService userService;

    /**
     * 用户收藏职业
     */
    @RequestMapping("/addMyFavorite")
    @ResponseBody
    public String myFavorite(String positionId, HttpSession session) {
        //职位id
        int id = Integer.parseInt(positionId);
        User user = (User) session.getAttribute("user");
        Favorite favorite = Favorite.builder().userId(user.getUserId()).positionId(id).status(1).build();
        favoriteManger.addFavourite(favorite);
        HashMap<String, String> maps = new HashMap<String, String>();
        maps.put("result", "true");
        return JSONArray.toJSONString(maps);
    }

    /**
     * 公司收藏个人
     */
    @RequestMapping("/{userId}/addTalentPool")
    public String addTalentPool(@PathVariable String userId, HttpSession session, Model model) {
        Company company = (Company) session.getAttribute("company");
        Favorite favorite = Favorite.builder().userId(Integer.parseInt(userId)).companyId(company.getCompanyId()).status(1).build();
        List<Favorite> favourite = favoriteManger.findFavourite(favorite);
        if (CollectionUtils.isEmpty(favourite)) {
            favoriteManger.addFavourite(favorite);

        }
        return "redirect:/favorite/showTalentPool";
    }

    /**
     * 展示人才库
     */
    @RequestMapping("/showTalentPool")
    public String showTalentPool(HttpSession session, Model model) {
        Company company = (Company) session.getAttribute("company");
        Favorite favorite = Favorite.builder().companyId(company.getCompanyId()).status(1).build();
        List<Favorite> favourite = favoriteManger.findFavourite(favorite);

        List<UserDTO> userDTOS = new ArrayList<>(favourite.size());
        if(!CollectionUtils.isEmpty(favourite)){
            List<Integer> userIds = favourite.stream().map(Favorite::getUserId).collect(Collectors.toList());
            userIds.forEach(userId->{
                UserDTO userDTO = userService.findResumeByUser(userId);
                userDTOS.add(userDTO);
            });
        }
        model.addAttribute("userDTO", userDTOS);
        return "/background/ListTalentPool";
    }


    /**
     * 展示我的收藏
     */
    @RequestMapping("/showMyFavorite")
    public String showMyFavorite(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Favorite favorite = Favorite.builder().build();

        favorite.setUserId(user.getUserId());
        favorite.setStatus(1);
        List<Favorite> favouriteList = favoriteManger.findFavourite(favorite);
        if (!CollectionUtils.isEmpty(favouriteList)) {
            List<Integer> positionIds = favouriteList.stream().map(Favorite::getPositionId).collect(Collectors.toList());

            PositionCommand positionCommand = new PositionCommand();
            positionCommand.setPositionId(positionIds);
            List<PositionDTO> positionDTOS = positionService.queryPositionList(1, positionCommand);
             model.addAttribute("positionList",positionDTOS);
            model.addAttribute("currentPage", 1);
        }


        return "favorite";
    }


}
