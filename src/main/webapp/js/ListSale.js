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
                parent.doOpenTab('字典新增', 'input/sale/add');
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
                parent.doOpenTab('修改', '/pages/sys/addDict.jsp?dictId='+chcId);
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
            width : '5%'
        }, {
            field : 'chcCustName',
            title : '客户名称',
            width : '10%'
        }, {
            field : 'chcTitle',
            title : '概要',
            width : '10%'
        }, {
            field : 'chcLinkman',
            title : '联系人',
            width : '10%'
        }, {
            field : 'chcTel',
            title : '联系人电话',
            width : '20%'
        }, {
            field : 'chcCreateDate',
            title : '创建时间',
            width : '20%'
        } ] ]
    });
    $("#listBtn").click(function() {
        //获取查询文本框的值
        var formData = {
            dictName : $("#dictName").val()
        }
        alert(formData);
        $('#dg').datagrid( {
            //在请求远程数据的时候发送额外的参数(dictName)
            queryParams : formData
        });
        //终止默认行为
        return false;
    });

});


