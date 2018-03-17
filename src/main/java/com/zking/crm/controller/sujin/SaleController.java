package com.zking.crm.controller.sujin;

import com.zking.crm.biz.sujin.ISalChanceBiz;
import com.zking.crm.biz.sujin.ISalPlanBiz;
import com.zking.crm.model.SalChance;
import com.zking.crm.model.SalPlan;
import com.zking.crm.util.JsonUtils;
import com.zking.crm.util.PageBean;
import com.zking.crm.util.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 营销管理模块
 *
 * 1.销售机会管理：SalChance
 * 2.客户开发计划：SalPlan
 */
@Controller
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private ISalChanceBiz salChanceBiz;
    @Autowired
    private ISalPlanBiz salPlanBiz;
    private SalChance salChance = new SalChance();
//    private PageBean pageBean;

    //初始化
//    @ModelAttribute
//    public void init(Model model, SalChance salChance){//初始化
//        System.out.println("init");
//        salChance = new SalChance();
//        pageBean= new PageBean();
//        model.addAttribute("salChance",salChance);
//    }

    /**
     *  状态：1 ==》显示所有未指派的销售机会
     */
    @RequestMapping("/listSalChance")
    @ResponseBody
    public ResponseData listSalChance(SalChance salChance,HttpServletRequest request,PageBean pageBean) {//显示所有的销售机会列表
        //分页
//        pageBean = new PageBean();
        pageBean.setRequest(request);
        //显示所有
        List<SalChance> salChances = salChanceBiz.listSalChance(salChance, pageBean);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(salChances);
        return responseData;
    }

    /**
     *  状态：2 ==》显示所有已指派（开发中）的销售机会
     */
    @RequestMapping("/listSalChance2")
    @ResponseBody
    public ResponseData listSalChance2(SalChance salChance,HttpServletRequest request,PageBean pageBean) {//显示所有的销售机会列表
        //分页
//        pageBean = new PageBean();
        pageBean.setRequest(request);

        List<SalChance> salChances = salChanceBiz.listSalChance2(salChance, pageBean);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(salChances);

        return responseData;
    }

    @RequestMapping("/doDel")
    //根据id删除
    public void doDel(HttpServletRequest request, HttpServletResponse response,PageBean pageBean)
            throws ServletException, IOException {
        String chcId = request.getParameter("chcId");
        SalChance salChance = new SalChance();
        salChance.setChcId(chcId);

//        pageBean = new PageBean();
        pageBean.setRequest(request);
        request.setAttribute("pageBean",pageBean);
        salChanceBiz.delSalChanceById(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setMessage("删除成功");
        responseData.setCode(0);

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, responseData);
    }

    //根据id查询单个
    @RequestMapping("/loadSalChance")
    @ResponseBody
    public SalChance loadSalChance(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        //参数
        String chcId = request.getParameter("chcId");
        //初始化
        SalChance salChance = new SalChance();
        //赋值
        salChance.setChcId(chcId);
        //对象
        SalChance s = salChanceBiz.loadSalChance(salChance);
        return  s;
    }

    //增加
    @RequestMapping("/add")
    public void add(HttpServletRequest request, SalChance salChance,HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println(salChance);

        salChance.setChcCreateId(1L);
        salChance.setChcCreateBy("sj");
        salChanceBiz.addSalChance(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setMessage("销售机会添加成功");
        responseData.setCode(0);

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, responseData);
    }


    //根据id修改销售机会
    @RequestMapping("/edit")
    @ResponseBody
    public void edit(SalChance salChance,HttpServletResponse response)
            throws ServletException, IOException {
        salChance.setChcCreateId(1L);
        salChance.setChcCreateBy("sj");
        salChanceBiz.editSalChanceById(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setMessage("销售机会修改成功");
        responseData.setCode(0);

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, responseData);
    }

    //根据id 进行指派
    @RequestMapping("/editZp")
    @ResponseBody
    public ResponseData editZp(SalChance salChance,HttpServletResponse response)
            throws ServletException, IOException {
        //获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        java.util.Date time=null;
        try {//转换 java.util.Date格式
            time= df.parse(df.format(new Date()));
        } catch (Exception   e) {
            e.printStackTrace();
        }

        salChance.setChcStatus("2");//已指派
        salChance.setChcDueDate(time);//设置指派时间
        //调用修改的方法
        salChanceBiz.editSalChanceById(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setCode(0);
        return  responseData;
    }

    /**
     * 两边联查
     * 根据id查询单个
     * ****制定计划***
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/loadSalChancePlan")
    //@ResponseBody
    public String loadSalChancePlan(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        //参数
        String chcId = request.getParameter("chcId");
        System.out.println(chcId+"chcId");
        //初始化
        SalChance salChance = new SalChance();
        //赋值
        salChance.setChcId(chcId);
        //对象
        SalChance s = salChanceBiz.loadSalChancePlan(salChance);

        request.setAttribute("s",s);
        return "forward:/input/sale/dev_plan";
    }

    /**
     * 两边联查
     * 根据id查询单个
     * ****执行计划***
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/loadSalChancePlanDo")
    public String loadSalChancePlanDo(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        //参数
        String chcId = request.getParameter("chcId");
        System.out.println(chcId+"chcId");
        //初始化
        SalChance salChance = new SalChance();
        //赋值
        salChance.setChcId(chcId);
        //对象
        SalChance s = salChanceBiz.loadSalChancePlan(salChance);

        request.setAttribute("s",s);
        return "forward:/input/sale/dev_execute";
    }

    /**
     * 两边联查
     * 根据id查询单个
     * ****查看***
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/loadSalChancePlanLook")
    public String loadSalChancePlanLook(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        //参数
        String chcId = request.getParameter("chcId");
        //System.out.println(chcId+"chcId");
        //初始化
        SalChance salChance = new SalChance();
        //赋值
        salChance.setChcId(chcId);
        //对象
        SalChance s = salChanceBiz.loadSalChancePlan(salChance);

        request.setAttribute("s",s);
        return "forward:/input/sale/dev_detail";
    }

    //根据id删除计划项
    @RequestMapping("/delSalPlan")
    @ResponseBody
    //根据id删除
    public ResponseData delSalPlan(SalPlan salPlan)
            throws ServletException, IOException {
        //调用删除的方法
        salPlanBiz.delSalPlan(salPlan);
        //转换easyui支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setMessage("删除成功");
        responseData.setCode(0);

        return  responseData;
    }

    //根据id修改计划项
    @RequestMapping("/editSalPlan")
    @ResponseBody
    public ResponseData editSalPlan(SalPlan salPlan)
            throws ServletException, IOException {
        //调用修改的方法
        salPlanBiz.editSalPlan(salPlan);
        //转换easyui支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setMessage("保存成功");
        responseData.setCode(0);

        return  responseData;
    }

    //增加计划项（获取指定的销售机会）
    @RequestMapping("/addSalPlan")
//    @ResponseBody
    public String addSalPlan(SalPlan salPlan,HttpServletRequest request){
        String plaDates = request.getParameter("plaDates");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date=null;
        try{
            date = sdf.parse(plaDates);
        }catch (Exception e){
            e.printStackTrace();
        }
        salPlan.setPlaDate(date);

        //调用增加的方法
        salPlanBiz.addSalPlan(salPlan);

        salChance.setChcId(salPlan.getPlaChcId());
        SalChance s = salChanceBiz.loadSalChancePlan(salChance);
        //System.out.println("sssssssssss"+s+"ssssssssssssss");
//        //转换easyui支持的格式
//        ResponseData responseData = new ResponseData();
//        responseData.setMessage("新建成功");
//        responseData.setCode(0);
//        return responseData;
        request.setAttribute("s",s);
        return "forward:/input/sale/dev_plan";
    }

    //开发
    @RequestMapping("/kf")
    @ResponseBody
    public ResponseData kf(SalPlan salPlan,HttpServletRequest request){

        salChance.setChcStatus(3+"");
        salChanceBiz.editSalChanceById(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setMessage("开发成功");
        responseData.setCode(0);
        return  null;
    }

    //流失
    @RequestMapping("/row")
    @ResponseBody
    public ResponseData row(SalPlan salPlan,HttpServletRequest request){

        salChance.setChcStatus(4+"");
        salChanceBiz.editSalChanceById(salChance);

        ResponseData responseData = new ResponseData();
        responseData.setMessage("开发失败");
        responseData.setCode(0);
        return  null;
    }


}
