<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%@include file="/common/head.jsp"%>
    <title>hello</title>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/icon.css">
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body  class="easyui-layout">
<%--
<div data-options="region:'north',title:'North Title',split:true" style="height:100px;">
</div>
<div class="easyui-accordion" data-options="region:'west',split:true" style="width:30%;">
    <c:import url="tree/get">
        <c:param name="method">list</c:param>
    </c:import>
    <c:forEach var="v" items="${treeNodeList}">

        <div title="${v.treeNodeName}" >
            <ul id="${v.treeNodeId}" class="myTree"></ul>
        </div>
    </c:forEach>
</div>
<div data-options="region:'center'" style="background:#eee;">
    <div id="tt" class="easyui-tabs" style="width:600px;height:500px;">
        <div title="Tab1" data-options="closable:true" style="padding:20px;display:none;">
            tab1
        </div>
    </div>
</div>
--%>
<%--<ul id="tt" class="easyui-tree">
    <li>
        <span>Folder</span>
        <ul>
            <li>
                <span>Sub Folder 1</span>
                <ul>
                    <li>
                        <span><a href="#">File 11</a></span>
                    </li>
                    <li>
                        <span>File 12</span>
                    </li>
                    <li>
                        <span>File 13</span>
                    </li>
                </ul>
            </li>
            <li>
                <span>File 2</span>
            </li>
            <li>
                <span>File 3</span>
            </li>
        </ul>
    </li>
    <li>
        <span>File21</span>
    </li>
</ul>--%>



</body>
</html>
