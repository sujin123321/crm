package com.zking.crm.biz.sujin.impl;

import com.zking.crm.biz.sujin.ISalChanceBiz;
import com.zking.crm.mapper.SalChanceMapper;
import com.zking.crm.model.SalChance;
import com.zking.crm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalChanceBizImpl implements ISalChanceBiz {

    @Autowired
    private SalChanceMapper salChanceMapper;

    @Override
    public List<SalChance> listSalChance(SalChance record, PageBean pageBean) {
        return salChanceMapper.listSalChance(record);
    }


    @Override
    public void delSalChanceById(SalChance record) {
        salChanceMapper.deleteByPrimaryKey(record.getChcId());
    }

    @Override
    public void editSalChanceById(SalChance record) {
        salChanceMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public SalChance loadSalChance(SalChance record) {
        return salChanceMapper.selectByPrimaryKey(record.getChcId());
    }

    @Override
    public List<SalChance> listSalChance2(SalChance record, PageBean pageBean) {
        return salChanceMapper.listSalChance2(record);
    }

    @Override
    public void addSalChance(SalChance record) {
        salChanceMapper.insertSelective(record);
    }

    @Override
    public SalChance loadSalChancePlan(SalChance record) {
        return salChanceMapper.loadSalChancePlan(record);
    }


}
