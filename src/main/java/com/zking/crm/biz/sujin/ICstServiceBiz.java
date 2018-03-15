package com.zking.crm.biz.sujin;

import com.zking.crm.model.CstService;
import com.zking.crm.util.PageBean;

import java.util.List;

public interface ICstServiceBiz {

    void addCstService(CstService cstService);

    void editCstService(CstService cstService);

    void delCstService(CstService cstService);

    CstService loadCstService(CstService cstService);

    List<CstService> listCstService(CstService cstService, PageBean pageBean);



}
