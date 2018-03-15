package com.zking.crm.biz.sujin.impl;

import com.zking.crm.biz.sujin.ISalPlanBiz;
import com.zking.crm.mapper.SalPlanMapper;
import com.zking.crm.model.SalPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalPlanBizImpl implements ISalPlanBiz {

    @Autowired
    private SalPlanMapper salPlanMapper;

    @Override
    public void addSalPlan(SalPlan salPlan) {
        salPlanMapper.insertSelective(salPlan);
    }

    @Override
    public void delSalPlan(SalPlan salPlan) {
        salPlanMapper.deleteByPrimaryKey(salPlan.getPlaId());
    }

    @Override
    public void editSalPlan(SalPlan salPlan) {
        salPlanMapper.updateByPrimaryKeySelective(salPlan);
    }

    @Override
    public List<SalPlan> listSalPlan(SalPlan salPlan) {
        return salPlanMapper.listSalPlan(salPlan);
    }
}
