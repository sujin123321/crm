package com.zking.crm.controller.sujin;

import com.zking.crm.biz.sujin.ISalChanceBiz;
import com.zking.crm.model.SalChance;
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
import java.util.List;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private ISalChanceBiz salChanceBiz;
    private SalChance salChance = new SalChance();
//    private SalChance salChance;
    private PageBean pageBean;

    //初始化
    @ModelAttribute
    public void init(Model model, SalChance salChance){//初始化
        System.out.println("init");
        salChance = new SalChance();
        pageBean= new PageBean();

        model.addAttribute("salChance",salChance);
    }

    @RequestMapping("/listSalChance")
//    @ResponseBody
    public void listSalChance(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {//显示所有的销售机会列表
        //分页
        pageBean = new PageBean();
        pageBean.setRequest(request);
        request.setAttribute("pageBean",pageBean);
        //模糊查询的值和参数
        String chcCustName=request.getParameter("chcCustName");
        String chcTitle=request.getParameter("chcTitle");
        String chcLinkman=request.getParameter("chcLinkman");
        if(null!=chcCustName){
            salChance.setChcCustName(chcCustName);
        }
        if(null!=chcTitle){
            salChance.setChcTitle(chcTitle);
        }
        if(null!=chcLinkman){
            salChance.setChcLinkman(chcLinkman);
        }
        //显示所有
        List<SalChance> salChances = salChanceBiz.listSalChance(salChance, pageBean);
        //转换成easyui所支持的格式
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageBean.getTotalRecord());
        responseData.setRows(salChances);

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, responseData);
    }

    @RequestMapping("/doDel")
    //根据id删除
    public void doDel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String chcId = request.getParameter("chcId");
        SalChance salChance = new SalChance();
        salChance.setChcId(chcId);

        pageBean = new PageBean();
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
//        //转换成easyui所支持的格式
//        ResponseData responseData = new ResponseData();
//        responseData.setRows(s);
//        response.setContentType("text/plain;charset=utf-8");
//        OutputStream os = response.getOutputStream();
//        JsonUtils.writeValue(os, responseData);
//        return  "/input/";
        return  s;
    }

    //增加
    @RequestMapping("/add")
    public void add(HttpServletRequest request, SalChance salChance,HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(salChance);

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
    public void edit(HttpServletRequest request, SalChance salChance,HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("edit...");
        System.out.println(salChance.getChcId()+" ==getChcId");
        System.out.println(salChance);
//        System.out.println("salChance== "+salChance);
//        System.out.println(salChance.getChcId()+" Id");
//
//        salChance.setChcCreateId(1L);
//        salChance.setChcCreateBy("sj");
//        salChanceBiz.editSalChanceById(salChance);
//
        ResponseData responseData = new ResponseData();
        responseData.setMessage("销售机会修改成功");
        responseData.setCode(0);

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, responseData);
    }

}
