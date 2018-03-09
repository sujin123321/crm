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

<div class="easyui-panel" title="销售机会管理&nbsp; &gt; 新建销售机会" style="width:1000px;height: 500px;">
	<form id="ff" method="post">
		<br><br>
		<div style="margin-bottom:20px;">
			<input class="easyui-textbox" id="chcCustName" name="name" type="text"  style="width:30%;float: left;" data-options="label:'客户名称:'">
			<input class="easyui-textbox" id="chcSource" name="name" type="text" style="width:30%;float: right;padding-left: -100px;" data-options="label:'机会来源:'">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="chcRate" name="name" type="text" style="width:30%" data-options="label:'成功机率:'">
			<input class="easyui-textbox" id="chcLinkman" name="name" type="text" style="width:30%" data-options="label:'联系人:'">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="chcTitle" name="email" value="" style="width:30%" data-options="label:'概要:'">
			<input class="easyui-textbox" id="chcTel" name="email" value="" style="width:30%" data-options="label:'联系人电话:'">

		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" id="chcDesc" name="message" value="" style="width:50%;height:80px" data-options="label:'机会描述:'">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="name" style="width:30%" data-options="label:'创建人:'">
			<input class="easyui-textbox" name="name" style="width:30%" data-options="label:'创建时间:'">
		</div>
		<div style="margin-bottom:20px">
			<select class="easyui-combobox" name="language" label="指派给" style="width:30%">
				<option value="ar">Arabic</option>
				<option value="bg">Bulgarian</option>
			</select>
			<input class="easyui-datetimespinner" label="指派时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>

		</div>

		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
		</div>

	</form>

</div>
<script>
    //访问的地址
//    var url=
    //获取参数
//    var chcCustName =$("#chcCustName").val();
//    var chcTitle = $("#chcTitle").val();
//    var chcLinkman = $("#chcLinkman").val();
//    if(chcCustName!=null&&chcCustName.length!=0){
//        if(chcTitle!=null&&chcTitle.length!=0){
//            if(chcCustName!=null&&chcCustName.length!=0){
//                    url='sale/add?chcCustName='+chcCustName+"&chcTitle="+chcTitle;
//            }
//        }
//    }
//    if(chcCustName==null)

//	//参数
//    var formData = {
//
//        };
    function submitForm(){
        // 显示进度条
        $.messager.progress();
        $('#ff').form('submit', {
            url:'sale/add',
            queryParams:{
                chcCustName : $("#chcCustName").val(),
                chcTitle : $("#chcTitle").val(),
                chcLinkman : $("#chcLinkman").val()
            },
            onSubmit: function(){
        var isValid = $(this).form('validate');
        if (!isValid){
            $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
        }
        return isValid;	// 返回false终止表单提交
          },
            success: function(){
                $.messager.progress('close');	// 如果提交成功则隐藏进度条
                //关闭当前窗口
                parent.removePanel();
            }
        });
    }

    function clearForm(){
        $('#ff').form('clear');
    }
</script>

</body>
</html>