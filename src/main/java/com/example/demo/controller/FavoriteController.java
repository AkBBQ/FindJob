package com.example.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.entity.Deliver;
import com.example.demo.entity.User;
import com.example.demo.service.DeliverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * 我的收藏Controller
 * @author xxx
 */

@Controller
@RequestMapping("/favorite")
public class FavoriteController {

    @Autowired
    private DeliverService deliverService;

    /**
     * 加入我的收藏
     */
    @RequestMapping("/myFavorite")
    @ResponseBody
    public String myFavorite(String positionId,HttpSession session){
        String msg ="false";
        //职位id
        int id=Integer.parseInt(positionId);
        User user=(User)session.getAttribute("user");
        List<Deliver> delivers = deliverService.queryByPositionId(id, user.getUserId());
        if(!CollectionUtils.isEmpty(delivers)){
            //收藏职业
            deliverService.updateFavorite(delivers.get(0).getDeliverId(),1);
            msg="true";
        }
        HashMap<String,String> maps=new HashMap<String, String>();
        maps.put("result", msg);
        return JSONArray.toJSONString(maps);
    }
}
