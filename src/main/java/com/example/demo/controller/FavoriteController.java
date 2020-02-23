package com.example.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.FavoriteManger;
import com.example.demo.entity.Favorite;
import com.example.demo.entity.User;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.query.PositionCommand;
import com.example.demo.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    /**
     * 加入我的收藏
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
