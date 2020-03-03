package com.example.demo.Manger;

import com.example.demo.entity.Evaluate;
import java.util.List;

/**
 * 评论服务 mp
 * @author xxx
 */
public interface EvaluateManger {


    /**
     * 查询用户的评价
     */
    Evaluate queryOneEvaluate(Evaluate evaluate);


    /**
     * 查看公司收到的评论
     */
    List<Evaluate> queryOneCompanyEvaluate(Evaluate evaluate);


    /**
     * 评论
     * @param evaluate
     */
   void addEvaluate(Evaluate evaluate);

}
