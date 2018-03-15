package com.zking.crm.controller.sujin;

import com.zking.crm.biz.sujin.ICstServiceBiz;
import com.zking.crm.model.CstService;
import com.zking.crm.util.PageBean;
import com.zking.crm.util.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 服务管理模块
 */
@Controller
@RequestMapping("/service")
public class ServiceController {

    @Autowired
    private ICstServiceBiz cstServiceBiz;
    private CstService cstService;
    private PageBean pageBean;

    @RequestMapping("/addService")
    @ResponseBody
    public ResponseData addService(CstService cstService){
        System.out.println(cstService);
        cstServiceBiz.addCstService(cstService);

        ResponseData responseData = new ResponseData();
        responseData.setCode(0);//正常
//        return "redirect:/input/cust/service/add";
        return  responseData;
    }

    /**
     * 显示界面:服务分配
     * @param cstService
     * @param request
     * @return
     */
    @RequestMapping("/listServiceCreate")
    @ResponseBody
    public ResponseData listServiceCreate(CstService cstService, HttpServletRequest request){
        pageBean = new PageBean();
        pageBean.setRequest(request);

        cstService.setSvrStatus("新创建");
        List<CstService> cstServices = cstServiceBiz.listCstService(cstService, pageBean);

        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(cstServices);
        return responseData;
    }

    /**
     * 服务处理
     * @param cstService
     * @param request
     * @return
     */
    @RequestMapping("/listServiceDeal")
    @ResponseBody
    public ResponseData listServiceDeal(CstService cstService, HttpServletRequest request){
        pageBean = new PageBean();
        pageBean.setRequest(request);

        cstService.setSvrStatus("已分配");
        List<CstService> cstServices = cstServiceBiz.listCstService(cstService, pageBean);

        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(cstServices);
        return responseData;
    }

    /**
     * 服务反馈
     * @param cstService
     * @param request
     * @return
     */
    @RequestMapping("/listServiceFeedback")
    @ResponseBody
    public ResponseData listServiceFeedback(CstService cstService, HttpServletRequest request){
        pageBean = new PageBean();
        pageBean.setRequest(request);

        cstService.setSvrStatus("已处理");
        List<CstService> cstServices = cstServiceBiz.listCstService(cstService, pageBean);

        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(cstServices);
        return responseData;
    }

    /**
     * 服务归档
     * @param cstService
     * @param request
     * @return
     */
    @RequestMapping("/listServiceFile")
    @ResponseBody
    public ResponseData listServiceFile(CstService cstService, HttpServletRequest request){
        pageBean = new PageBean();
        pageBean.setRequest(request);

        List<CstService> cstServices = cstServiceBiz.listCstService(cstService, pageBean);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(cstServices);
        return responseData;
    }

    //删除
    @RequestMapping("/delServiceCreate")
    @ResponseBody
    public ResponseData delServiceCreate(CstService cstService){
        //调用删除的方法
        cstServiceBiz.delCstService(cstService);

        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setMessage("删除成功");
        responseData.setCode(0);

        return responseData;
    }

    //分配
    @RequestMapping("/editServiceFP")
    @ResponseBody
    public ResponseData editServiceFP(CstService cstService){
        //获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        java.util.Date time=null;
        try {//转换 java.util.Date格式
            time= df.parse(df.format(new Date()));
        } catch (Exception   e) {
            e.printStackTrace();
        }
        //设值
        cstService.setSvrStatus("已分配");
        cstService.setSvrDueDate(time);
        //调用修改的方法
        cstServiceBiz.editCstService(cstService);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setMessage("修改成功");
        responseData.setCode(0);
        return responseData;
    }


    //根据id查询单个
    @RequestMapping("/loadService")
    @ResponseBody
    public CstService loadService(CstService cstService){
        CstService cs = cstServiceBiz.loadCstService(cstService);
        return cs;
    }

    //服务处理
    @RequestMapping("/editServiceDeal")
    @ResponseBody
    public ResponseData editServiceDeal(CstService cstService){
        //获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        java.util.Date time=null;
        try {//转换 java.util.Date格式
            time= df.parse(df.format(new Date()));
        } catch (Exception   e) {
            e.printStackTrace();
        }
        //设值
        cstService.setSvrDealBy("sj");//处理人
        cstService.setSvrStatus("已处理");//状态
        cstService.setSvrDealDate(time);//处理时间
        //调用修改的方法
        cstServiceBiz.editCstService(cstService);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setCode(0);
        return responseData;
    }

    //服务反馈处理
    @RequestMapping("/editServiceFeedBack")
    @ResponseBody
    public ResponseData editServiceFeedBack(CstService cstService){

        System.out.println("====== "+cstService+" =======");
        //设值
        if(cstService.getSvrSatisfy()>=3){
            cstService.setSvrStatus("已归档");//状态
        }else if(cstService.getSvrSatisfy()<3){
            cstService.setSvrStatus("已分配");//状态
        }
        //调用修改的方法
        cstServiceBiz.editCstService(cstService);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setCode(0);
        return responseData;
    }



    //根据id查询单个
    @RequestMapping("/loadServiceEl")
    public String loadServiceEl(CstService cstService,HttpServletRequest request){
        CstService cs = cstServiceBiz.loadCstService(cstService);

        request.setAttribute("cs",cs);
        return "forward:/input/cust/service/detail";
    }


}
