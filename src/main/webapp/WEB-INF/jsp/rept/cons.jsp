<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp" %>
	<title>jb-aptech毕业设计项目</title>

</head>
<body>

<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="reload();">查询</button> 
	</div>
<table class="query_form_table">
	<tr>
		<th>报表方式</th>
		<td>
			<select>
				<option>按等级</option>
				<option>按信用度</option>
				<option>按满意度</option>
			</select>
		</td>

	<th>&nbsp;</th>
		<td>
			&nbsp;
		</td>
			</tr>
	</table>
<br />
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>等级</th>
		<th>客户数量</th>
	</tr>
	<tr>
		<td class="list_data_number">1</td>
		<td class="list_data_text">战略合作伙伴</td>
		<td class="list_data_number">12</td>
	</tr>
	<tr>
		<td class="list_data_number">2</td>
		<td class="list_data_text">合作伙伴</td>
		<td class="list_data_number">26</td>
	</tr>
	<tr>
		<td class="list_data_number">3</td>
		<td class="list_data_text">大客户</td>
		<td class="list_data_number">38</td>
	</tr>
	<tr>
		<td class="list_data_number">4</td>
		<td class="list_data_text">重点开发客户</td>
		<td class="list_data_number">6</td>
	</tr>
	<tr>
		<td class="list_data_number">5</td>
		<td class="list_data_text">普通客户</td>
		<td class="list_data_number">72</td>
	</tr>
	</table>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script/common.js"></script>
</body>
</html>