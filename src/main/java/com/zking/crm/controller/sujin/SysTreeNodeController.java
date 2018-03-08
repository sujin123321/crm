package com.zking.crm.controller.sujin;

import com.zking.crm.biz.sujin.ISysTreeNodeBiz;
import com.zking.crm.model.SysTreeNode;
import com.zking.crm.util.JsonUtils;
import com.zking.crm.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tree")
public class SysTreeNodeController {

    @Autowired
    private ISysTreeNodeBiz sysTreeNodeBiz;

    @RequestMapping("/get")
    public void get(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        //System.out.println("getgetgetgetget");
        String method = request.getParameter("method");
        // 判断是哪种方法
        if ("list".equals(method)) {
            list(request, response);
            System.out.println("list");
        } else {
            listByParentNodeId(request, response);
            System.out.println("listByParentNodeId");
        }
        //return "index";
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SysTreeNode treeNode = new SysTreeNode();
        treeNode.setParentNodeId(-1);// 如果ParentNodeId = null 或者为-1 就查询一级节点
        List<SysTreeNode> SysTreeNodeList = sysTreeNodeBiz.listSysTreeNode(treeNode);
        for(SysTreeNode s:SysTreeNodeList)  {
            System.out.println("list"+s);
        }
        request.setAttribute("treeNodeList", SysTreeNodeList);
    }

    @RequestMapping("/mylist")
    public String mylist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SysTreeNode treeNode = new SysTreeNode();
        treeNode.setParentNodeId(-1);// 如果ParentNodeId = null 或者为-1 就查询一级节点
        List<SysTreeNode> SysTreeNodeList = sysTreeNodeBiz.listSysTreeNode(treeNode);
        for(SysTreeNode s:SysTreeNodeList)  {
            System.out.println("mylist== "+s);
        }
        request.setAttribute("treeNodeList", SysTreeNodeList);
        return  "forward:/input/hello";
//        return  null;
    }




    // 查询指定父节点下的子节点
   // @ResponseBody
    //List<Map<String, Object>>
    @RequestMapping("/list")
    public void  listByParentNodeId(HttpServletRequest request,
                                   HttpServletResponse response) throws ServletException, IOException {
        // 接收父节点id
        String parentNodeId = request.getParameter("parentNodeId");
        SysTreeNode treeNode = new SysTreeNode();
        treeNode.setParentNodeId(parentNodeId);

        List<SysTreeNode> list = sysTreeNodeBiz.listSysTreeNode(treeNode);

        //转换成easyui 树节点的所需数据格式
        List<Map<String, Object>> treeNodeList = new ArrayList<Map<String,Object>>();
        Map<String, Object> m = null;
        Map<String, Object> attributes = null;
        for (SysTreeNode tn : list) {
            System.out.println("listByParentNodeId== "+tn);
            m = new HashMap<String, Object>();
            //前三是节点的标准数字属性
            m.put("id", tn.getTreeNodeId());
            m.put("text", tn.getTreeNodeName());
            //如果是枝节点 就设置可以打开
            m.put("state", tn.isLeaf()?"open":"closed");

            //添加自定义属性
            attributes = new HashMap<String, Object>();
            attributes.put("url", StringUtils.trimToBlank(tn.getUrl()));
            m.put("attributes", attributes);

            treeNodeList.add(m);
        }

        response.setContentType("text/plain;charset=utf-8");
        OutputStream os = response.getOutputStream();
        JsonUtils.writeValue(os, treeNodeList);
       // return  treeNodeList;
    }
}