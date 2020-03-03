package com.example.demo.Manger.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.Manger.EvaluateManger;
import com.example.demo.entity.Evaluate;
import com.example.demo.entity.Position;
import com.example.demo.mapper.MpMapper.EvaluateMapper;
import com.example.demo.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 评论实现类 mp
 * @author xxx
 */
@Service
public class EvaluateMangerImpl implements EvaluateManger {
    @Autowired
    private EvaluateMapper evaluateMapper;

    @Autowired
    private PositionService positionService;

    @Override
    public Evaluate queryOneEvaluate(Evaluate evaluate) {
        QueryWrapper<Evaluate> wrapper = new QueryWrapper<>();
        wrapper.eq("userId",evaluate.getUserId());
        wrapper.eq("positionId",evaluate.getPositionId());
        return evaluateMapper.selectOne(wrapper);
    }

    @Override
    public List<Evaluate> queryOneCompanyEvaluate(Evaluate evaluate) {
        QueryWrapper<Evaluate> wrapper = new QueryWrapper<>();
        wrapper.eq("companyId",evaluate.getCompanyId());
        return evaluateMapper.selectList(wrapper);
    }

    @Override
    public void addEvaluate(Evaluate evaluate) {
        try {
            QueryWrapper<Evaluate> wrapper = new QueryWrapper<>();
            wrapper.eq("userId",evaluate.getUserId());
            wrapper.eq("positionId",evaluate.getPositionId());
            Evaluate evaluate1 = evaluateMapper.selectOne(wrapper);
            if(Objects.isNull(evaluate1)){
                evaluate.setCreateTime(new Date());
                Position position = positionService.getById(evaluate.getPositionId());
                evaluate.setCompanyId(position.getCompanyId());
                evaluateMapper.insert(evaluate);
            }else {
                evaluate.setCompanyId(evaluate1.getCompanyId());
                evaluate.setCreateTime(new Date());
                evaluate.setComplaintId(evaluate1.getComplaintId());
                QueryWrapper<Evaluate> wrapper3 = new QueryWrapper<>();
                wrapper.eq("complaintId",evaluate1.getCompanyId());
                evaluateMapper.update(evaluate,wrapper3);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}