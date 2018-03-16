<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp"%>
	<title>jb-aptech毕业设计项目</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/insdep/easyui.css" rel="stylesheet" type="text/css">
	<link href="css/insdep/easyui_animation.css" rel="stylesheet" type="text/css">
	<script src="script/common.js"></script>
	<%@include file="/common/easyui_style.jsp"%>
</head>
<body>
<div class="easyui-panel" title="客户开发计划&nbsp; &gt; 查看" style="width:1000px;height: 500px;">
	<table class="query_form_table">
		<tr>
			<th>编号</th>
			<td>${s.chcId}</td>
			<th>机会来源</th>
			<td>${s.chcSource}</td>
		</tr>
		<tr>
			<th>客户名称</th>
			<td>${s.chcCustName}</td>
			<th>成功机率（%）</th>
			<td>&nbsp;${s.chcRate}</td>
		</tr>
		<tr>
			<th>概要</th>
				<td>${s.chcTitle}</td>
			<th>状态</th>
			<c:if test="${s.chcStatus==3}">
				<td>开发成功</td>
			</c:if>
			<c:if test="${s.chcStatus==4}">
				<td style="color:red;">开发失败</td>
			</c:if>
		</tr>

		<tr>
			<th>联系人</th>
			<td>${s.chcLinkman}</td>
			<th>联系人电话</th>
			<td>${s.chcTel}</td>
		</tr>
		<tr>
			<th>机会描述</th>
			<td colspan="3">${s.chcDesc}</td>
		</tr>
		<tr>
			<th>创建人</th>
			<td>${s.chcCreateBy}</td>
			<th>创建时间</th>
			<td>
				<fmt:formatDate value="${s.chcCreateDate}" pattern="yyyy年MM月dd日" />
			</td>

		</tr>
		<tr>
			<th>指派给</th>
			<td>
				${s.chcDueTo}
			</td>
			<th>指派时间</th>
			<td>
				<fmt:formatDate value="${s.chcDueDate}" pattern="yyyy年MM月dd日" />
			</td>
		</tr>
	</table>
	<br />
	<!-- 显示计划项 -->
	<table class="data_list_table" id="jhx">
		<tr>
			<th>日期</th>
			<th>计划</th>
			<th>执行效果</th>
		</tr>
		<c:forEach var="p" items="${s.salPlans}">
			<tr id="${p.plaId}">
				<td class="list_data_text">
					<fmt:formatDate value="${p.plaDate}" pattern="yyyy年MM月dd日" />
				</td>
				<td class="list_data_ltext">
						${p.plaTodo}
				</td>
				<td class="list_data_ltext" height="24">
					${p.plaResult}
				</td>
			</tr>
		</c:forEach>
	</table>

</div>
</body>
</html>