<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp"%>
	<title>jb-aptech毕业设计项目</title>
	<link href="css/insdep/easyui.css" rel="stylesheet" type="text/css">
	<link href="css/insdep/easyui_animation.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="script/common.js"></script>
	<%@include file="/common/easyui_style.jsp"%>
</head>
<body>
<br>
<div class="easyui-panel" title="客户服务管理&nbsp;&gt; 服务创建" style="width:1200px;height: 1000px;">
	<form id="ff" method="post" style="padding-left:20px;">
		<br><br>
		<div style="margin-bottom:20px;">
			客户：<input class="easyui-textbox"  id="sname" name="svrCustName" type="text"  style="width:30%;float: left;" data-options="label:'客户:',required:true">
			<select class="easyui-combobox" id="ty" name="svrType" label="服务类型" style="width:100%">
				<option value="咨询">咨询</option>
				<option value="投诉">投诉</option>
				<option value="建议">建议</option>
			</select>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  id="stit" name="svrTitle" value="" style="width:50%;height:80px" data-options="label:'概要:'">
			状态：新创建
		</div>
		<div style="margin-bottom:20px">
			<textarea class="easyui-textbox" name="svrRequest" type="text" style="width:30%" data-options="label:'服务请求:'"></textarea>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" value="sjj" name="svrCreateBy" style="width:30%" data-options="label:'创建人:'" readonly>
			<input class="easyui-datetimespinner" id="svrCreateDate"  label="创建时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="margin-bottom:20px">
			<select class="easyui-combobox"  name="svrDueTo" label="分配给：" style="width:30%">
				<option value="小明">小明</option>
				<option value="旺财">旺财</option>
				<option value="球球">球球</option>
			</select>
			<input class="easyui-datetimespinner" name="svrDueDate" label="分配时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>

		</div>

		<div style="margin-bottom:20px">
			<textarea class="easyui-textbox" name="svrDeal" type="text" style="width:30%" data-options="label:'服务处理:'"></textarea>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" value="sjj" name="svrDealBy" style="width:30%" data-options="label:'处理人:'" readonly>

			<input class="easyui-datetimespinner" name="svrDealDate" label="处理时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>

		</div>

		<div style="margin-bottom:20px">
			<input class="easyui-textbox" value="sjj" name="svrResult" style="width:30%" data-options="label:'处理结果:'" readonly>
			<select class="easyui-combobox" id="svrSatisfy" name="language" label="满意度" style="width:30%">
				<option>请选择...</option>
				<option value="5">☆☆☆☆☆</option>
				<option value="4">☆☆☆☆</option>
				<option value="3">☆☆☆</option>
				<option value="2">☆☆</option>
				<option value="1">☆</option>
			</select>
		</div>

		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()" style="width:80px">Submit</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
		</div>
	</form>
</div>
<%--<script>
function add() {
    $.messager.progress();
    $('#ff').form('submit', {
        url: 'service/addService',
        onSubmit: function () {
            var isValid = $(this).form('validate');
            if (!isValid) {
                $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
            }
            return isValid;	// 返回false终止表单提交
        },
        success: function (data) {
            $.messager.progress('close');	// 如果提交成功则隐藏进度条
			//重置表单
			$("#ff").form('reset');
        }
    });
}
</script>--%>
</body>
</html>