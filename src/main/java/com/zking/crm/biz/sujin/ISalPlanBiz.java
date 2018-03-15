package com.zking.crm.biz.sujin;

import com.zking.crm.model.SalPlan;

import java.util.List;

public interface ISalPlanBiz {

    void addSalPlan(SalPlan salPlan);

    void delSalPlan(SalPlan salPlan);

    void editSalPlan(SalPlan salPlan);

    List<SalPlan> listSalPlan(SalPlan salPlan);

}
