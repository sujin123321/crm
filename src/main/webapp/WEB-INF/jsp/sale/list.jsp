<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp"%>
	<title>jb-aptech毕业设计项目</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="script/common.js"></script>
<%--
	<%@include file="/common/easyui_style.jsp"%>
	<script type="text/javascript" src="js/ListSale.js"></script>
--%>
</head>
<body>
<div class="page_title">销售机会管理</div>
	<%--<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('input/sale/add');">新建</button>
	<button class="common_button" onclick="reload();">查询</button> 
	</div>--%>
<%--<table class="query_form_table">
	<tr>
		<th>客户名称</th>
		<td><input /></td>
		<th>概要</th>
		<td><input /></td>
		<th>联系人</th>
		<td>
			<input name="T1" size="20" />
		</td>
	</tr>
	</table>
<br />--%>
<%--<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>客户名称</th>
		<th>概要</th>
		<th>联系人</th>
		<th>联系人电话</th>
		<th>创建时间</th>
		<th>操作</th>
	</tr>
	<tr>
		<td class="list_data_number">1</td>
		<td class="list_data_text">睿智数码</td>
		<td class="list_data_ltext">采购笔记本电脑意向</td>
		<td class="list_data_text">刘先生</td>
		<td class="list_data_text">13729239239</td>
		<td class="list_data_text">2007年12月06日</td>
		<td class="list_data_op">
			<img onclick="to('input/sale/dispatch');" title="指派" src="images/bt_linkman.gif" class="op_button" />
			<img onclick="to('input/sale/edit');" title="编辑" src="images/bt_edit.gif" class="op_button" />
			<img onclick="del('“销售机会：采购笔记本电脑意向”');" title="删除" src="images/bt_del.gif" class="op_button" />
		</td>
	</tr>
	<tr>
		<th colspan="7" class="pager">
<div class="pager">
	共59条记录 每页<input value="10" size="2" />条
	第<input value="1" size="2"/>页/共5页
	<a href="#">第一页</a>
	<a href="#">上一页</a>
	<a href="#">下一页</a>
	<a href="#">最后一页</a>
	转到<input value="1" size="2" />页
	<button width="20" onclick="reload();">GO</button>
</div>
		</th>
	</tr>
</table>--%>

<div id="tb" style="padding:2px 5px;">
	客户名称：<input  id="chcCustName" style="width:110px"/>
	概要：<input  id="chcTitle" style="width:110px"/>
	联系人：<input  id="chcLinkman" style="width:110px"/>
	<a id="listBtn" href="#"  class="easyui-linkbutton" iconCls="icon-search">查询</a>
</div>
<table id="dg" ></table>

<%--<m:page pageBean="${pageBean}"/>--%>
<script type="text/javascript">

    $(function() {
        $('#dg').datagrid( {
            pagination : true,
            pageList : [ 2, 4, 6, 8 ],
            pageSize : 2,
            idFiled : 'chcId',
            singleSelect : true,
            toolbar : [ {
                iconCls : 'icon-add',
                text : '新增',
                handler : function() {
                    //窗口嵌套：调父窗口的
//                    parent.doOpenTab('字典新增', 'input/sale/add');
                    var title ='新建销售机会';
                    var url = 'input/sale/add';
                    var iconCls = '';
                    var iframe = true;
					parent.addTab(title,url,iconCls,iframe);
                }
            }, '-', {
                iconCls : 'icon-edit',
                text : '修改',
                handler : function() {
                    //获得被选中的行
                    var row = $('#dg').datagrid("getSelected");
                    if (!row) {
                        $.messager.alert('警告', "请选择要修改的行");
                        return;
                    }
                    //获取选中的行的字典id
                    var chcId = row.chcId;
                    //parent.doOpenTab('修改', '/pages/sys/addDict.jsp?chcId='+chcId);
                    var title ='编辑销售机会';
                    var url = 'input/sale/edit?chcId='+chcId;
                    var iconCls = '';
                    var iframe = true;

                    parent.addTab(title,url,iconCls,iframe);
//                    var url2 = 'sale/loadSalChance?chcId='+chcId;
//                    alert(chcId);
//                    parent.loadform(url2);

                }
            }, '-', {
                iconCls : 'icon-remove',
                text : '删除',
                handler : function() {
                    //获得被选中的行
                    var row = $('#dg').datagrid("getSelected");
                    // alert(row);
                    if (!row) {
                        $.messager.alert('警告', "请选择要删除的行");
                        return;
                    }
                    //获取选中的行的字典id
                    var chcId = row.chcId;
                    //alert(chcId+"c");
                    var url = "sale/doDel?chcId=" + chcId;
                    $.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
                        if (r) {
                            $.ajax( {
                                dataType : 'json',
                                url : url,
                                success : function(data) {
                                    if (0 == data.code) {
                                        $.messager.alert('提示', data.message);
                                        //删除成功之后 返回指定行的索引号  便于删除 行  getRowIndex
                                        var ind = $('#dg').datagrid("getRowIndex");
                                        //然后根据行id  删除行
                                        $('#dg').datagrid("deleteRow", ind);
                                    } else {
                                        $message.alert('警告', '删除失败，请与管理员联系');
                                    }
                                }
                            });
                        }
                    });

                }
            } ],
            url : 'sale/listSalChance',
            columns : [ [ {
                field : 'chcId',
                title : '编号',
                width : '40%'
            }, {
                field : 'chcCustName',
                title : '客户名称',
                width : '40%'
            }, {
                field : 'chcTitle',
                title : '概要',
                width : '40%'
            }, {
                field : 'chcLinkman',
                title : '联系人',
                width : '40%'
            }, {
                field : 'chcTel',
                title : '联系人电话',
                width : '40%'
            }, {
                field : 'chcCreateDate',
                title : '创建时间',
                width : '80%'
            } ] ]
        });
        $("#listBtn").click(function() {
            //获取查询文本框的值
			//alert(6);
            var formData = {
                chcCustName : $("#chcCustName").val(),
                chcTitle : $("#chcTitle").val(),
                chcLinkman : $("#chcLinkman").val()
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



</script>
</body>
</html>