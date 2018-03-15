<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp"%>
	<title>jb-aptech毕业设计项目</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="script/common.js"></script>
</head>
<body>
<div class="page_title">客户服务管理 &gt; 服务归档</div>
<form id="ff" method="post">
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td>${cs.svrId}</td>
		<th>服务类型</th>
		<td>
			${cs.svrType}
		</td>
	</tr>
	<tr>
		<th>概要</th>
		<td colspan="3">${cs.svrTitle}</td>
	</tr>	
	<tr>
		<th>客户</th>
		<td>${cs.svrCustName}</td>
		<th>状态</th>
		<td>${cs.svrStatus}</td>
	</tr>	
	<tr>
		<th>服务请求</th>
		<td colspan="3">${cs.svrRequest}<br>
　</td>
	</tr>
	<tr>
		<th>创建人</th>
		<td>${cs.svrCreateBy}</td>
		<th>创建时间</th>
		<td>
			<fmt:formatDate value="${cs.svrCreateDate}" pattern="yyyy年MM月dd日 hh:mm:ss"/>
		</td>
	</tr>
	</table>
<br />
<table class="query_form_table" id="table3">
	<tr>
		<th>分配给</th>
		<td>
			${cs.svrDueTo}</td>
		<th>分配时间</th>
		<td>
			<fmt:formatDate value="${cs.svrDueDate}" pattern="yyyy年MM月dd日 hh:mm:ss" />
		</td>
	</tr>
</table>
<br />	
<table class="query_form_table" id="table1">
	<tr>
		<th>服务处理</th>
		<td colspan="3">回电话给刘经理：<br>
			${cs.svrDeal}</td>
	</tr>
	<tr>
		<th>处理人</th>
		<td>${cs.svrDealBy}</td>
		<th>处理时间</th>
		<td>
			<fmt:formatDate value="${cs.svrDealDate}" pattern="yyyy年MM月dd日 hh:mm:ss"/>
		</td>
	</tr>
</table>
<br />
<table class="query_form_table" id="table2">
	<tr>
		<th>处理结果</th>
		<td>${cs.svrResult}</td>
		<th>满意度</th>
		<td>
			<c:if test="${cs.svrSatisfy==1}">
				<img src="images/star.jpg" class="star_pic" />
			</c:if>
			<c:if test="${cs.svrSatisfy==2}">
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
			</c:if>
			<c:if test="${cs.svrSatisfy==3}">
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
			</c:if>
			<c:if test="${cs.svrSatisfy==4}">
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
			</c:if>
			<c:if test="${cs.svrSatisfy==5}">
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
				<img src="images/star.jpg" class="star_pic" />
			</c:if>
		</td>
	</tr>
</table>
</form>

</body>
</html>