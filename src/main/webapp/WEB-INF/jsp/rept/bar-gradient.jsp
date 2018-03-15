<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang='en'>
<head>
    <%@include file="/common/head.jsp" %>
    <meta charset='UTF-8'>
    <title>ichartjs designer</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script src="script/common.js"></script>
    <script src='http://www.ichartjs.com/ichart.latest.min.js'></script>
</head>
<div class="page_title">客户贡献分析</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="reload();">查询</button>
</div>
<table class="query_form_table">
    <tr>
        <th>客户名称</th>
        <td><input /></td>
        <th>年份</th>
        <td>
            <select>
                <option>全部</option>
                <option>2005</option>
                <option>2006</option>
                <option>2007</option>
                <option>2008</option>
                <option>2009</option>
                <option>2010</option>
            </select>
        </td>
    </tr>
</table>
<br><br>
<div id='ichart-render'></div>
<script type='text/javascript'>
    $(function(){
        var chart = iChart.create({
            render:"ichart-render",
            width:1200,
            height:500,
            background_color:"#fefefe",
            gradient:false,
            color_factor:0.2,
            border:{
                color:"BCBCBC",
                width:1
            },
            align:"center",
            offsetx:0,
            offsety:0,
            sub_option:{
                border:{
                    color:"#BCBCBC",
                    width:1
                },
                label:{
                    fontweight:500,
                    fontsize:11,
                    color:"#4572a7",
                    sign:"square",
                    sign_size:12,
                    border:{
                        color:"#BCBCBC",
                        width:1
                    },
                    background_color:"#fefefe"
                }
            },
            shadow:true,
            shadow_color:"#666666",
            shadow_blur:2,
            showpercent:false,
            column_width:"70%",
            bar_height:"70%",
            radius:"90%",
            title:{
                text:"客户贡献分析",
                color:"#3398DB",
                fontsize:20,
                font:"微软雅黑",
                textAlign:"center",
                height:30,
                offsetx:0,
                offsety:0
            },
            subtitle:{
                text:"数据统计",
                color:"#3398DB",
                fontsize:16,
                font:"微软雅黑",
                textAlign:"center",
                height:20,
                offsetx:0,
                offsety:0
            },
            footnote:{
                text:"",
                color:"#111111",
                fontsize:12,
                font:"微软雅黑",
                textAlign:"right",
                height:20,
                offsetx:0,
                offsety:0
            },
            legend:{
                enable:false,
                background_color:"#fefefe",
                color:"#333333",
                fontsize:12,
                border:{
                    color:"#BCBCBC",
                    width:1
                },
                column:1,
                align:"right",
                valign:"center",
                offsetx:0,
                offsety:0
            },
            coordinate:{
                width:"80%",
                height:"84%",
                background_color:"#ffffff",
                axis:{
                    color:"#a5acb8",
                    width:[1,"",1,""]
                },
                grid_color:"#d9d9d9",
                label:{
                    fontweight:500,
                    color:"#666666",
                    fontsize:11
                }
            },
            label:{
                fontweight:500,
                color:"#666666",
                fontsize:11
            },
            type:"column2d",
            data:[
                {
                    name:"名称A",
                    value:43000,
                    color:"#3398DB"
                },{
                    name:"名称B",
                    value:1000000,
                    color:"#3398DB"
                },{
                    name:"名称C",
                    value:60000,
                    color:"#3398DB"
                },{
                    name:"新增",
                    value:76543,
                    color:"#3398DB"
                },{
                    name:"新增",
                    value:1234567,
                    color:"#3398DB"
                },{
                    name:"新增",
                    value:5433,
                    color:"#3398DB"
                },{
                    name:"新增",
                    value:111111,
                    color:"#3398DB"
                }
            ]
        });
        chart.draw();
    });
</script>
</body>
</html>