package com.zking.crm.biz.sujin.impl;

import com.zking.crm.biz.sujin.ICstServiceBiz;
import com.zking.crm.mapper.CstServiceMapper;
import com.zking.crm.model.CstService;
import com.zking.crm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CstServiceBizImpl implements ICstServiceBiz {

    @Autowired
    private CstServiceMapper cstServiceMapper;

    @Override
    public CstService loadCstService(CstService cstService) {
        return cstServiceMapper.selectByPrimaryKey(cstService.getSvrId());
    }

    @Override
    public void addCstService(CstService cstService) {
        cstServiceMapper.insertSelective(cstService);
    }

    @Override
    public void editCstService(CstService cstService) {
        cstServiceMapper.updateByPrimaryKeySelective(cstService);
    }

    @Override
    public void delCstService(CstService cstService) {
        cstServiceMapper.deleteByPrimaryKey(cstService.getSvrId());
    }

    @Override
    public List<CstService> listCstService(CstService cstService, PageBean pageBean) {
        return cstServiceMapper.listCstService(cstService);
    }


}
