package com.zking.crm.biz.sujin;

import com.zking.crm.model.SalChance;
import com.zking.crm.util.PageBean;

import java.util.List;

public interface ISalChanceBiz {

    //显示所有+模糊查询+分页
    List<SalChance> listSalChance(SalChance record, PageBean pageBean);

    //根据id删除
    void delSalChanceById(SalChance record);

    //根据id修改
    void editSalChanceById(SalChance record);

    /**
     * 根据id查询单个
     * @param record
     * @return
     */
    SalChance loadSalChance(SalChance record);

    //增加
    void addSalChance(SalChance record);

}
