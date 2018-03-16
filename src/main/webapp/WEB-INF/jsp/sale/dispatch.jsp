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
<div class="easyui-panel" title="销售机会管理&nbsp; &gt; 指派销售机会" style="width:1000px;height: 500px;">
	<form id="ff" method="post" style="padding: 20px;">
		<br>
		<div style="margin-bottom:20px;">
			<input class="easyui-textbox" id="CustName" name="chcCustName" type="text"  style="width:30%;float: left;" data-options="label:'客户名称:'" readonly>
			<input class="easyui-textbox" id="Source" name="chcSource" type="text" style="width:30%;float: right;padding-left: -100px;" data-options="label:'机会来源:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="Rate" name="chcRate" type="text" style="width:30%" data-options="label:'成功机率:',required:true" readonly>
			<input class="easyui-textbox" id="Linkman" name="chcLinkman" type="text" style="width:30%" data-options="label:'联系人:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="Title" name="chcTitle" value="" style="width:30%" data-options="label:'概要:'" readonly>
			<input class="easyui-textbox" id="Tel" name="chcTel" value="" style="width:30%" data-options="label:'联系人电话:'" readonly>

		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="Desc" name="chcDesc" value="" style="width:50%;height:80px" data-options="label:'机会描述:'" readonly>
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="CreateBy"   value="sjj" name="chcCreateBy" style="width:30%" data-options="label:'创建人:'" readonly>
			<input class="easyui-datetimespinner" id="CreateDate" name="chcCreateDate" label="创建时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="margin-bottom:20px">
			<select class="easyui-combobox" id="chcDueTo" name="zpg" label="指派给" style="width:30%">
				<option value="Arabic">Arabic</option>
				<option value="Bulgarian">Bulgarian</option>
			</select>
			<input class="easyui-datetimespinner" id="DueDate"  label="指派时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
		</div>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">指派</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
		</div>
	</form>

</div>
<%
	String chcId = request.getParameter("chcId");
%>
<script>
    //加载表单
    var chcId=<%=chcId%>;
    $('#ff').form('load','sale/loadSalChance?chcId=<%=chcId%>');
  	//初始化下拉框
//    $.ajax({
//        url:"rest/dict/selectdict",
//        dataType:"json",
//        type:"GET",
//        data:{
//            "type":"audit_state"
//        },
//        success:function(data){
//            //绑定第一个下拉框
//            $('#DueId').combobox({
//                data: data,
//                valueField: 'code',
//                textField: 'description'}
//            );
//        },
//        error:function(error){
//            alert("初始化下拉控件失败");
//        }
//    })

    //提交
    function submitForm(){
        var options=$("#chcDueTo option:selected");  //获取选中的项
        //alert(options.val());   //拿到选中项的值
        $.ajax({
            url: "sale/editZp",
            dataType: "json",
            type: "post",
            data: {
                chcId: chcId,
                chcDueTo : options.val()
            },
            success: function (data) {
                //更新父类显示所有的选项卡
                parent.refresh();
                //关闭当前窗口
                parent.removePanel();
            },
            error: function (error) {
                alert("服务器繁忙！！！");
            }
        })
	}
        //alert($('select[name=zpg]').val());
        // 显示进度条
//        $.messager.progress();
//        $('#ff').form('submit', {
////            url:'sale/edit?chcId='+chcId,
//            url:'sale/editZp',
//            queryParams:{
//                chcId:chcId,
//                //chcDueTo :   $('select[name=zpg]').val(),
//                DueDate : $("#DueDate").val()
//            },
//            onSubmit: function(){
//                var isValid = $(this).form('validate');
//                if (!isValid){
//                    $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
//                }
//                return isValid;	// 返回false终止表单提交
//            },
//            success: function(data){
//                $.messager.progress('close');	// 如果提交成功则隐藏进度条
////                if (0 == data.code) {
////                    $.messager.alert('提示', data.message);
////                }
//                //更新父类显示所有的选项卡
//                parent.refresh();
//                //关闭当前窗口
//                parent.removePanel();
//            }
//        });
//    }

    function clearForm(){
        $('#ff').form('clear');
    }


</script>
</body>
</html>