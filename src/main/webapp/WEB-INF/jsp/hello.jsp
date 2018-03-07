<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%@include file="/common/head.jsp" %>
    <title>hello</title>
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body  class="easyui-layout">
sdss
<div class="easyui-accordion" data-options="region:'west',split:true" style="width:30%;">
    <c:import url="tree/get">
        <c:param name="method">list</c:param>
    </c:import>
    <c:forEach var="v" items="${treeNodeList}">
        <div title="${v.treeNodeName}" >
            <ul id="${v.treeNodeId}" class="myTree"></ul>
        </div>

    </c:forEach>
    <c:if test="${treeNodeList!=null}">
        aaaaaaa
    </c:if>

</div>
<div data-options="region:'center'" style="background:#eee;">
    <div id="tt" class="easyui-tabs" style="width:600px;height:500px;">
        <div title="Tab1" data-options="closable:true" style="padding:20px;display:none;">
            tab1
        </div>
    </div>
</div>
</div>



</body>
</html>
