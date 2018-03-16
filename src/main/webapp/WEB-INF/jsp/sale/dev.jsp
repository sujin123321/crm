<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/common/head.jsp"%>
	<title>jb-aptech毕业设计项目</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="script/common.js"></script>
	<%@include file="/common/easyui_style.jsp"%>
	<%--
        <script type="text/javascript" src="js/ListSale.js"></script>
    --%>
</head>
<body>
<%--<div class="easyui-panel" title="销售机会管理" style="width:800px;max-width:800px;padding:30px 60px;">
	<div id="tb" style="padding:2px 5px;" class="">
		客户名称：<input  id="chcCustName" style="width:110px"/>
		概要：<input  id="chcTitle" style="width:110px"/>
		联系人：<input  id="chcLinkman" style="width:110px"/>
		<a id="listBtn" href="#"  class="easyui-linkbutton" iconCls="icon-search">查询</a>
	</div>
</div>--%>
<br>
<table id="dg" title="客户开发管理"></table>

<%--<m:page pageBean="${pageBean}"/>--%>
<script type="text/javascript">

    $(function() {
        $('#dg').datagrid( {
            pagination : true,
            pageList : [ 2, 4, 6, 8 ],
            pageSize : 4,
            idFiled : 'chcId',
            singleSelect : true,
//            fitColumns:true,
            url : 'sale/listSalChance2',
            toolbar : [{
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
                	text:'<img onclick="jh()" title="制定计划" src="images/bt_plan.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
                }
                ,{
                    text: '<img onclick="zx()" title="执行计划" src="images/bt_feedback.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
                },{
                    text:'<img onclick="kf()" title="开发成功" src="images/bt_yes.gif" class="op_button" name="zp"/>&nbsp;&nbsp;'
                },{
                    text:'<img onclick="look()" title="查看" src="images/bt_detail.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
                }
            ],
            columns : [ [ {
					field : 'chcId',
					title : '编号',
					width : '100'
				},{
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
					width : '200'
				}, {
					field : 'chcStatus',
					title : '状态',
					width : '150',
					formatter:function (value, row, index) {
						if(value==2){
							return "开发中";
						}
						if(value==3){
							return "已归档";
						}
                        if(value==4){
                            return "已归档";
                        }
					}
            }
//				, {
//                field : 'operate',
//                title : '操作',
//                width : '100',
//                formatter:function (value, row, index) {
//                    var rows = $('#dg').datagrid('getRows')//获取当前页的数据行
//                    var total = 0;
//                    var arrayObj = new Array();
//                    for (var i = 0; i < rows.length; i++) {
//                        arrayObj.push(rows[i]['chcStatus']);
////                        total += rows[i]['chcStatus']; //获取指定列
////						if(total==2){
////						    return "sss";
////						}else if(total==3){
////						    return "mmm";
////						}
//                    }
//
//                    for(var i=0;i<arrayObj.length;i++){
//                      //alert(arrayObj[i]);
//                      if(arrayObj[i]==2){
//                          var  str = '' +
//                              '<img onclick="jh()" title="制定计划" src="images/bt_plan.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                              '<img onclick="zx()" title="执行计划" src="images/bt_feedback.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                              '<img onclick="kf()" title="开发成功" src="images/bt_yes.gif" class="op_button" name="zp" />';
//                          return str;
//					  }else if(arrayObj[i]==3){
//                          var str = '' +
//                              '<img onclick="look()" title="查看" src="images/bt_detail.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
//                          return str;
//					  }
//                    }


//                }
//                field:'operate',title:'操作',align:'center',width:150,
//                formatter:function(value, row, index){
//                    var rows = $('#dg').datagrid('getRows')//获取当前页的数据行
//                    var total = 0;
//                    for (var i = 0; i < rows.length; i++) {
//                        total += rows[i]['chcStatus']; //获取指定列
//                        if (rows[i]['chcStatus'] == 2) {
//                            var  str = '' +
//                                '<img onclick="jh()" title="制定计划" src="images/bt_plan.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                                '<img onclick="zx()" title="执行计划" src="images/bt_feedback.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                                '<img onclick="kf()" title="开发成功" src="images/bt_yes.gif" class="op_button" name="zp" />';
//                            return str;
//                        }else if (rows[i]['chcStatus']== 3) {
//                            var str = '' +
//                                '<img onclick="look()" title="查看" src="images/bt_detail.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
//                            return str;
//                        }
//                    }
//                    alert(total);
//                    if (total == 2) {
//                      var  str = '' +
//                            '<img onclick="jh()" title="制定计划" src="images/bt_plan.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                            '<img onclick="zx()" title="执行计划" src="images/bt_feedback.gif" class="op_button" name="zp" />&nbsp;&nbsp;&nbsp;' +
//                            '<img onclick="kf()" title="开发成功" src="images/bt_yes.gif" class="op_button" name="zp" />';
////                    var str = '<a href="#" name="opera" class="easyui-linkbutton" ></a>';
//                        return str;
//                    }
//                    if (total== 3) {
//                       var str = '' +
//                            '<img onclick="look()" title="查看" src="images/bt_detail.gif" class="op_button" name="zp" />&nbsp;&nbsp;'
//                        return str;
//                    }
//                }
//            }
			] ]
        }
        );
    });

    //计划
	function jh(){
		// 得到columns对象
	//    var columns = $('#dg').datagrid("options").columns;
	//	// 得到rows对象
	//    var rows = $('#dg').datagrid("getRows"); // 这段代码是// 对某个单元格赋值
	//    rows[lastIndex][columns[0][6].field]='hhh';
	//	// 刷新该行, 只有刷新了才有效果

	//    var rows = $('#dg').datagrid('getRows');//获取当前页的数据行
	//    var total = 0;
	//    for (var i = 0; i < rows.length; i++) {
	//        total = rows[i]['chcStatus']; //获取指定列
	//		if(rows[i]['chcStatus']==2){
	//
	//		}
	//    }

        var chcStatus=$('#dg').datagrid("getSelected").chcStatus;
        if(chcStatus==2){
            var chcId=$('#dg').datagrid("getSelected").chcId;
            var title ='制定计划';
            var url = 'sale/loadSalChancePlan?chcId='+chcId;
            var iconCls = '';
            var iframe = true;
            parent.addTab(title,url,iconCls,iframe);
		}else{
            alert("已归档，不能制定计划");
		}
	}

	//执行
	function zx() {
        var chcStatus=$('#dg').datagrid("getSelected").chcStatus;
		if(chcStatus==2){
			var chcId=$('#dg').datagrid("getSelected").chcId;
			var title ='执行计划';
			var url = 'sale/loadSalChancePlanDo?chcId='+chcId;
			var iconCls = '';
			var iframe = true;
			parent.addTab(title,url,iconCls,iframe);
        }else{
            alert("已归档，不能执行计划");
        }
	}

	//查看
	function look() {
        var chcStatus=$('#dg').datagrid("getSelected").chcStatus;
        if(chcStatus==3||chcStatus==4){
			var chcId=$('#dg').datagrid("getSelected").chcId;
            var title ='查看';
            var url = 'sale/loadSalChancePlanLook?chcId='+chcId;
            var iconCls = '';
            var iframe = true;
            parent.addTab(title,url,iconCls,iframe);
        }else{
            alert("开发中，不能查看");
		}
	}

	//开发
	function kf() {
        var chcStatus=$('#dg').datagrid("getSelected").chcStatus;
        if(chcStatus==2){
            $.messager.confirm('确认', '确认要开发吗？', function(r) {
                if (r) {
                    var chcId = $('#dg').datagrid("getSelected").chcId;
                    $.ajax({
                        dataType: 'json',
                        url: 'sale/edit?chcId=' + chcId + '&chcStatus=' + 3,
                        success: function (data) {
                            if (0 == data.code) {
                                alert("开发成功");
                                $('#dg').datagrid('reload');
                            } else {
                                $message.alert('警告', '服务器繁忙，请与管理员联系');
                            }
                        }
                    });
                }
            });
        }else{
            alert("已归档");
		}
	}


</script>
</body>
</html>