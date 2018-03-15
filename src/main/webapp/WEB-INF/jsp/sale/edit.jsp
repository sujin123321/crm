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
		<div class="easyui-panel" title="销售机会管理&nbsp; &gt; 编辑销售机会" style="width:1000px;height: 500px;">
			<form id="ff" method="post" style="padding: 20px;">
				<br>
				<div style="margin-bottom:20px;">
					<input class="easyui-textbox" id="CustName" name="chcCustName" type="text"  style="width:30%;float: left;" data-options="label:'客户名称:',required:true">
					<input class="easyui-textbox" id="Source" name="chcSource" type="text" style="width:30%;float: right;padding-left: -100px;" data-options="label:'机会来源:'">
				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" id="Rate" name="chcRate" type="text" style="width:30%" data-options="label:'成功机率:',required:true">
					<input class="easyui-textbox" id="Linkman" name="chcLinkman" type="text" style="width:30%" data-options="label:'联系人:'">
				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" id="Title" name="chcTitle" value="" style="width:30%" data-options="label:'概要:',required:true">
					<input class="easyui-textbox" id="Tel" name="chcTel" value="" style="width:30%" data-options="label:'联系人电话:'">

				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" id="Desc" name="chcDesc" value="" style="width:50%;height:80px" data-options="label:'机会描述:',required:true">
				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" id="CreateBy"   value="sjj" name="chcCreateBy" style="width:30%" data-options="label:'创建人:'" readonly>
					<input class="easyui-datetimespinner" id="CreateDate" name="chcCreateDate" label="创建时间:" labelPosition="left" value="6/24/2015" style="width:30%;" readonly>
				</div>
				<div style="text-align:center;padding:5px 0">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormAjax()" style="width:80px">修改</a>
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
    //$('#f').form('load','sale/loadSalChance?chcId='+3);

    var formData={
        chcId : chcId,
//        chcCustName : $("#CustName").val(),
//		chcTitle : $("#Title").val(),
//		chcLinkman : $("#Linkman").val(),
//		chcSource : $("#Source").val(),
//		chcRate : $("#Rate").val(),
//		chcTel : $("#Tel").val(),
//		chcDesc : $("#Desc").val()
        chcCustName:$("input[name='chcCustName']").val(),
        chcTitle:$("input[name='chcTitle']").val(),
        chcLinkman:$("input[name='chcLinkman']").val(),
        chcSource:$("input[name='chcSource']").val(),
        chcRate:$("input[name='chcRate']").val(),
        chcTel:$("input[name='chcTel']").val(),
        chcDesc:$("input[name='chcDesc']").val()
    };
	function submitFormAjax(){
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                chcId:chcId,
                chcCustName:$("#CustName").val(),
                chcTitle : $("#Title").val(),
                chcLinkman : $("#Linkman").val(),
				chcSource : $("#Source").val(),
				chcRate : $("#Rate").val(),
				chcTel : $("#Tel").val(),
				chcDesc : $("#Desc").val()
			},
            url: "sale/edit" ,//url
//            data: formData,
           success: function (result) {
               //更新父类显示所有的选项卡
               parent.refresh();
               //关闭当前窗口
               parent.removePanel();
//                console.log(result);//打印服务端返回的数据(调试用)
//                if  (result.resultCode == 200) {
//                    alert("SUCCESS");
//                }
//                ;
            },
            error : function() {
                alert("异常！");
            }
        });
	}


	//提交
    function submitForm(){
        // 显示进度条
        var chcId=<%=chcId%>;
        ///$.messager.progress();
        $('#ff').form('submit', {
//            url:'sale/edit?chcId='+chcId,
            url:'sale/edit?chcId=<%=chcId%>',
            queryParams:{
//                chcId:chcId,
//                chcCustName : $("#CustName").val(),
//                chcTitle : $("#Title").val(),
//                chcLinkman : $("#Linkman").val(),
//                chcSource : $("#Source").val(),
//                chcRate : $("#Rate").val(),
//                chcTel : $("#Tel").val(),
//                chcDesc : $("#Desc").val()
                chcCustName:$("input[name='chcCustName']").val(),
                chcTitle:$("input[name='chcTitle']").val(),
                chcLinkman:$("input[name='chcLinkman']").val(),
                chcSource:$("input[name='chcSource']").val(),
                chcRate:$("input[name='chcRate']").val(),
                chcTel:$("input[name='chcTel']").val(),
                chcDesc:$("input[name='chcDesc']").val()
            },
            onSubmit: function(){
                alert(1);
//                var isValid = $(this).form('validate');
//                if (!isValid){
//                    $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
//                }
//                return isValid;	// 返回false终止表单提交
            },
            success: function(data){
                alert("success");
                //$.messager.progress('close');	// 如果提交成功则隐藏进度条
//                if (0 == data.code) {
//                    $.messager.alert('提示', data.message);
//                }
                //更新父类显示所有的选项卡
//                parent.refresh();
                //关闭当前窗口
//                parent.removePanel();
            }
        });
    }


//        // 显示进度条
//        $.messager.progress();
//        $('#ff').form('submit', {
//            url:'sale/edit',
//            queryParams:{
//                chcId:chcId,
//                chcCustName : $("#CustName").val(),
//                chcTitle : $("#Title").val()
////                chcLinkman : $("#chcLinkman").val(),
////                chcSource : $("#chcSource").val(),
////                chcRate : $("#chcRate").val(),
////                chcTel : $("#chcTel").val(),
////                chcDesc : $("#chcDesc").val()
//            },
//            onSubmit: function(){
//                var isValid = $(this).form('validate');
//                if (!isValid){
//                    $.messager.progress('close');	// 如果表单是无效的则隐藏进度条
//                }
//                return isValid;	// 返回false终止表单提交
//            },
//            success: function(data){
////                alert("success");
//                $.messager.progress('close');	// 如果提交成功则隐藏进度条
//                if (0 == data.code) {
//                    $.messager.alert('提示', data.message);
//                }
////                //更新父类显示所有的选项卡
////                parent.refresh();
////                //关闭当前窗口
////                parent.removePanel();
//            }
//        });
//    }

    function clearForm(){
        $('#ff').form('clear');
    }


</script>
</body>
</html>