package com.zking.crm.biz.sujin.impl;

import com.zking.crm.biz.sujin.ISysTreeNodeBiz;
import com.zking.crm.mapper.SysTreeNodeMapper;
import com.zking.crm.model.SysTreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SysTreeNodeBizImpl implements ISysTreeNodeBiz {


    @Autowired
    private SysTreeNodeMapper sysTreeNodeMapper;

    @Override
    public List<SysTreeNode> listSysTreeNode(SysTreeNode record) {
        return sysTreeNodeMapper.listSysTreeNode(record);
    }


}
