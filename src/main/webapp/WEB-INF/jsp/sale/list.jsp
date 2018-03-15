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
<%--
<div class="page_title">销售机会管理</div>
--%>
<%--<div class="easyui-panel" title="销售机会管理" style="width:800px;max-width:800px;padding:30px 60px;">
	<div id="tb" style="padding:2px 5px;" class="">
		客户名称：<input  id="chcCustName" style="width:110px"/>
		概要：<input  id="chcTitle" style="width:110px"/>
		联系人：<input  id="chcLinkman" style="width:110px"/>
		<a id="listBtn" href="#"  class="easyui-linkbutton" iconCls="icon-search">查询</a>
	</div>
</div>--%>
<br>
<table id="dg" title="销售机会管理">

</table>

<%--<m:page pageBean="${pageBean}"/>--%>
<script type="text/javascript">
    $(function() {
        $('#dg').datagrid( {
            pagination : true,
            pageList : [ 2, 4, 6, 8 ],
            pageSize : 2,
            idFiled : 'chcId',
            singleSelect : true,
            //fitColumns:true,
            toolbar : [ {
                	text: '客户名称：<input  class="easyui-textbox" id="chcCustName" style="width:110px"/>'
				}, {
					text: '概要：<input class="easyui-textbox" id="chcTitle" style="width:110px"/>'
				}, {
                	text: '联系人：<input  class="easyui-textbox" id="chcLinkman" style="width:110px"/>'
            	},{
					id: 'searchBtn',
                        text: '',
						iconCls: 'icon-search',
						handler: function(){
							$('#dg').datagrid('load',{
                                chcCustName : $("#chcCustName").val(),
                                chcTitle : $("#chcTitle").val(),
                                chcLinkman : $("#chcLinkman").val()
							});
					}
				},{
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
            },  '-', {
                iconCls : 'icon-print',
                text : '指派',
                handler : function() {
                    //获得被选中的行
                    var row = $('#dg').datagrid("getSelected");
                    if (!row) {
                        $.messager.alert('警告', "请选择要指派的行");
                        return;
                    }
                    //获取选中的行的字典id
                    var chcId = row.chcId;
                    //parent.doOpenTab('修改', '/pages/sys/addDict.jsp?chcId='+chcId);
                    var title ='指派销售机会';
                    var url = 'input/sale/dispatch?chcId='+chcId;
                    var iconCls = '';
                    var iframe = true;

                    parent.addTab(title,url,iconCls,iframe);
//                    var url2 = 'sale/loadSalChance?chcId='+chcId;
//                    alert(chcId);
//                    parent.loadform(url2);

                }
            },'-', {
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
                width : '150'
            }, {
                field : 'chcCustName',
                title : '客户名称',
                width : '150'
            }, {
                field : 'chcTitle',
                title : '概要',
                width : '200'
            }, {
                field : 'chcLinkman',
                title : '联系人',
                width : '150'
            }, {
                field : 'chcTel',
                title : '联系人电话',
                width : '150'
            }, {
                field : 'chcCreateDate',
                title : '创建时间',
                width : '400'
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