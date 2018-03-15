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

<%--<div class="page_title">客户服务管理 > 服务分配</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" id="listBtn">查询</button>
</div>
<table class="query_form_table" height="53">
	<tr>
		<th height="28">客户</th>
		<td>
			<input id="svrCustName"/>
		</td>
		<th height="28">概要</th>
		<td>
			<input id="svrTitle"/>
		</td>
		<th height="28">服务类型</th>
		<td>
			<select name="svrType">
				<option value="null">全部</option>
				<option value="咨询">咨询</option>
				<option value="建议">建议</option>
				<option value="投诉">投诉</option>
			</select>
		</td>
	</tr>
	<tr>
		<th height="22">创建日期</th>
		<td colspan="3">
			<input id="preDate" size="10" /> - <input id="afterDate" size="10" /></td>
		<th height="22">状态</th>
		<td>
			<select name="D1">
				<option selected>新创建</option>
			</select>
		</td>
	</tr>
</table>
<br />--%>
<br>
<table id="dg" title="服务分配"></table>
<script type="text/javascript">
    $(function() {
        $('#dg').datagrid( {
            pagination : true,
            pageList : [ 2, 4, 6, 8 ],
            pageSize : 2,
            idFiled : 'svrId',
            singleSelect : true,
            toolbar : [{
                text: '客户：<input id="svrCustName"/>'
            },{
                text: '概要：<input id="svrTitle"/>'
            },{
                text: '服务类型：<select name="svrType">\n' +
                '\t\t\t\t<option value="">全部</option>\n' +
                '\t\t\t\t<option value="咨询">咨询</option>\n' +
                '\t\t\t\t<option value="建议">建议</option>\n' +
                '\t\t\t\t<option value="投诉">投诉</option>\n' +
                '\t\t\t</select>'
            },{
                text: '创建日期：<input id="preDate" class="easyui-datebox" style="width:100px" /> - <input id="afterDate" class="easyui-datebox" style="width:100px"/>'
            },{
                text: '<select name="D1">\n' +
                '\t\t\t\t<option selected>新创建</option>\n' +
                '\t\t\t</select>'
            },{
                id: 'searchBtn',
                text: '',
                iconCls: 'icon-search',
                handler: function(){
                    $('#dg').datagrid('load',{
                        svrCustName : $("#svrCustName").val(),
                        svrTitle : $("#svrTitle").val(),
                        svrType :$('select[name=svrType]').val(),
                        preDate: $("#preDate").val(),
                        afterDate:$("#afterDate").val()
                    });
                }
			}
			],
            url : 'service/listServiceCreate',
            columns : [ [ {
                field : 'svrId',
                title : '编号',
                width : '100'
            }, {
                field : 'svrCustName',
                title : '客户',
                width : '150'
            }, {
                field : 'svrTitle',
                title : '概要',
                width : '200'
            }, {
                field : 'svrType',
                title : '服务类型',
                width : '100'
            }, {
                field : 'svrCreateBy',
                title : '创建人',
                width : '100'
            }, {
                field : 'svrCreateDate',
                title : '创建日期',
                width : '150'
            } , {
                field: 'fp', title: '分配给', align: 'center', width: 150,
                formatter: function (value, row, index) {

					var str = '<select class="easyui-combobox" id="ty" name="svrDueTo" label="分配人：" style="width:50%">\n' +
                        '\t\t\t\t<option value="小明">小明</option>\n' +
                        '\t\t\t\t<option value="旺财">旺财</option>\n' +
                        '\t\t\t\t<option value="球球">球球</option>\n' +
                        '\t\t\t</select>'+
                        '<button id="fp" value="分配" onclick="fp()">分配</button>';
                    return str;
//					return "分配";
                }
            }, {
                    field: 'cz', title: '操作', align: 'center', width: 50,
                    formatter: function (value, row, index) {
                        var str =
                            '<img onclick="del()" title="删除" src="images/bt_del.gif" class="op_button" name="zp" />';
                        return str;
                    }
                }
            ] ]
        });
        $("#listBtn").click(function() {
            //获取查询文本框的值
            //alert(6);
            var formData = {
                svrCustName : $("#svrCustName").val(),
                svrTitle : $("#svrTitle").val(),
                svrType :$('select[name=svrType]').val(),
                preDate: $("#preDate").val(),
                afterDate:$("#afterDate").val()
            };
            //alert(formData);
            $('#dg').datagrid( {
                //在请求远程数据的时候发送额外的参数(dictName)
                queryParams : formData
            });
            //终止默认行为
            return false;
        });
    });

    //分配
	function fp() {
        var svrId = $('#dg').datagrid("getSelected").svrId;
        var svrDueTo=$("#ty").val();
//        alert(ty);
        $.ajax({
            dataType: 'json',
            url: 'service/editServiceFP?svrId=' + svrId+'&svrDueTo='+svrDueTo,
            success: function (data) {
                if (0 == data.code) {
                    $('#dg').datagrid('reload');
                } else {
                    $message.alert('警告', '服务器繁忙，请与管理员联系');
                }
            }
        });
    }

    //执行
    function del() {
        var svrId = $('#dg').datagrid("getSelected").svrId;
        var rows = $('#dg').datagrid('getRows');//获取当前页的数据行
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total = rows[i]['svrCustName']; //获取指定列
        }
        $.messager.confirm('确认', '您确认想要删除客户：'+total+'?', function (r) {
            if (r) {
                $.ajax({
                    dataType: 'json',
                    url: 'service/delServiceCreate?svrId=' + svrId,
                    success: function (data) {
                        if (0 == data.code) {
                            $('#dg').datagrid('reload');
                        } else {
                            $message.alert('警告', '删除失败，请与管理员联系');
                        }
                    }
                });
            }
        });
    }

</script>
</body>
</html>