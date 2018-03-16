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
<%--<c:import url="sale/loadSalChancePlan">
	<c:param name="chcId"><%=request.getParameter("chcId")%></c:param>
</c:import>--%>
<div class="easyui-panel" title="客户开发计划&nbsp; &gt; 制定计划" style="width:1000px;height: 700px;">
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
			<td colspan="3">${s.chcTitle}</td>
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
	<table class="query_form_table" id="jhx">
		<tr>
			<th width="50px">日期</th>
			<th height="31">计划项</th>
		</tr>
		<c:forEach var="p" items="${s.salPlans}">
			<tr id="${p.plaId}">
				<td class="list_data_text" height="24">
					<fmt:formatDate value="${p.plaDate}" pattern="yyyy年MM月dd日" />
				</td>
				<td class="list_data_ltext" height="24">
					<input size="50" id="p${p.plaId}" value="${p.plaTodo}" />
					<button class="common_button" onclick="save(${p.plaId});">保存</button>
					<button class="common_button" onclick="del(${p.plaId},this);">删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form id="ff" method="post">
		<div style="margin-bottom:20px;">
			<input class="easyui-datetimespinner" id="plaDate" name="p" label="日期:" labelPosition="left" value="6/24/2015" style="width:30%;" >
			<input class="easyui-textbox" id="dd" name="plaTodo" type="text" style="width:30%;float: right;padding-left: -100px;" data-options="label:'计划项:',required:true">
		</div>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormAjax(${s.chcId})" style="width:80px">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
		</div>
	</form>

</div>

<script type="text/javascript">
    //加载表单
    <%--$('#ff').form('load','sale/loadSalChancePlan?chcId=<%=request.getParameter("chcId")%>');--%>
	//提交
    function submitFormAjax(chcId){
        //alert(chcId);
		//alert($("#plaDate").val());
            // 显示进度条
            $.messager.progress();
            $('#ff').form('submit', {
                url:'sale/addSalPlan',
                queryParams:{
//                    plaDates : $("#plaDates").val()
                    plaChcId:chcId,
                    plaDates : $("#plaDate").val(),
                    plaTodo : $("#plaTodo").val()
                },
                onSubmit: function(){
                    var isValid = $(this).form('validate');
                    if (!isValid){
                        $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
                    }
                    return isValid;	// 返回false终止表单提交
                },
                success: function(data){
                    $.messager.progress('close');	// 如果提交成功则隐藏进度条
                    parent.refreshByTitile('制定计划');
//					if(0==data.code){
//					    //alert(data.message);
//                        parent.refreshByTitile('制定计划');
//					}
                    //更新父类显示所有的选项卡
//                    parent.refreshByTitile('客户开发管理');
//                    //关闭当前窗口
//                    parent.removePanel();
                }
            });
    }
    function clearForm(){
        $('#ff').form('clear');
    }

    //删除指定的行
    function deleteRow(obj) {
        var i=obj.parentNode.parentNode.rowIndex;
        document.getElementById('jhx').deleteRow(i);
    }
    //删除
    function del(plaId,obj){
        var del=window.confirm("您确定要删除吗？");
        if(del){
            //ajax加载
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "sale/delSalPlan?plaId="+plaId ,//url
                success: function (result) {
                    //更新父类显示所有的选项卡
//                    parent.refresh();
					if  (result.code == 0) {
						//alert(result.message);
                        //删除指定行
                        deleteRow(obj);
					};
                },
                error : function() {
                    alert("服务器响应异常！");
                }
            });
        }
    }

	//保存
	function save(plaId) {
		//获得指定文本框
		var plaTodo = document.getElementById("p"+plaId).value;
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
			data: {
                    plaId:plaId,
                    plaTodo:plaTodo
			},
            url: "sale/editSalPlan" ,//url
            success: function (result) {
                //更新父类显示所有的选项卡
//                    parent.refresh();
                if  (result.code == 0) {
                    alert("保存成功");
                    //修改（保存）
                };
            },
            error : function() {
                alert("服务器响应异常！");
            }
        });
    }

</script>
</body>
</html>