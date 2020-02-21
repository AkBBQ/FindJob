package com.example.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.Manger.FavoriteManger;
import com.example.demo.entity.Favorite;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * 我的收藏Controller
 * @author xxx
 */

@Controller
@RequestMapping("/favorite")
public class FavoriteController {

    @Autowired
    private FavoriteManger favoriteManger;

    /**
     * 加入我的收藏
     */
    @RequestMapping("/addMyFavorite")
    @ResponseBody
    public String myFavorite(String positionId,HttpSession session){
        //职位id
        int id=Integer.parseInt(positionId);
        User user=(User)session.getAttribute("user");
        Favorite favorite =Favorite.builder().userId(user.getUserId()).positionId(id).status(1).build();
        favoriteManger.addFavourite(favorite);
        HashMap<String,String> maps=new HashMap<String, String>();
        maps.put("result", "true");
        return JSONArray.toJSONString(maps);
    }
}
