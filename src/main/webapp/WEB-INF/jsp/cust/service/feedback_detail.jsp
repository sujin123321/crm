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
<div class="easyui-panel" title="客户服务管理&nbsp;&gt; 服务处理" style="width:1200px;height: 1000px;">
	<form id="ff" method="post">
		<br><br>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrId" style="width:30%" data-options="label:'编号:'" readonly>
			<input class="easyui-textbox"  name="svrType" style="width:30%" data-options="label:'服务类型:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrTitle" style="width:30%" data-options="label:'概要:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrCustName" style="width:30%" data-options="label:'客户:'" readonly>
			<input class="easyui-textbox"  name="svrStatus" style="width:30%" data-options="label:'状态:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrRequest" style="width:30%" data-options="label:'服务请求:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrCreateBy" style="width:30%" data-options="label:'创建人:'" readonly>
			<input class="easyui-datetimespinner" name="svrCreateDate" label="创建时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrDueTo" style="width:30%" data-options="label:'分配给:'" readonly>
			<input class="easyui-datetimespinner" name="svrDueDate" label="分配时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrDeal" style="width:30%" data-options="label:'服务处理:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  value="sj" name="svrDealBy" style="width:30%" data-options="label:'处理人:'" readonly>
			<input class="easyui-datetimespinner"  label="处理时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox"  name="svrResult" style="width:30%" data-options="label:'处理结果:'" >
			<select id="test" class="easyui-combobox" name="svrSatisfy" label="满意度" style="width:30%">
				<option>请选择...</option>
				<option value="5">☆☆☆☆☆</option>
				<option value="4">☆☆☆☆</option>
				<option value="3">☆☆☆</option>
				<option value="2">☆☆</option>
				<option value="1">☆</option>
			</select>
		</div>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormAjax()" style="width:80px">保存</a>
		</div>
	</form>
</div>
<script>
    $('#ff').form('load','service/loadService?svrId=<%=request.getParameter("svrId")%>');

    function submitFormAjax() {
        var options=$("#test option:selected");
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                svrId : $("input[name='svrId']").val(),
                svrResult : $("input[name='svrResult']").val(),
                svrSatisfy : options.val()
            },
            url:'service/editServiceFeedBack',//url
            success: function (result) {
                //更新指定的选项卡
                parent.refreshByFeed();
                //关闭当前窗口
                parent.removePanel();
            }
        });
    }
</script>
</body>
</html>