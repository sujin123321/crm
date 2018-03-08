$(function() {
	$("ul.myTree").each(function() {
		var url = "tree/get?parentNodeId=" + $(this).attr("id")+"&method=1";
		alert(url);
		$("ul.myTree").tree( {
			url : url,
			onBeforeLoad : function(node, param) {
				//console.log("onBeforeLoad");
                alert(3);
                if (node){
                	alert(4);
                    //有节点的时候才将parentNodeId改为这一子节点所对应的节点
                    var defaults = $(this).tree("options");
                    var newUrl = "tree/get?parentNodeId=" + node.id;
                    defaults.url = newUrl;//将新地址赋值到跳转的地址
                }else{
                	alert(5);
                    var defaults = $(this).tree("options");
                    alert("w")
                    var newUrl = "tree/get?parentNodeId=" + node.id;
                    alert(newUrl);
                    defaults.url = newUrl;//将新地址赋值到跳转的地址
				}

		},
	onSelect : function(node) {
				alert(4);
		var text = node.text;
		var url = node.attributes.url;
		alert(text+","+url);
			if (url) {
				doOpenTab(text, url);
			}
		}
		});
	});
	//alert(399);
});

/**
 * 打开新的tab页
 */
function doOpenTab(text, url) {
	alert(1);
	//判断选中的枝节点 如果已存在就选中这个tab页
	if ($('#wu-tabs').tabs('exists', text)) {
		$('#wu-tabs').tabs('select', text);
		//修改不同对象但用同个tab的隐藏域（iframe）
		//getTab:获取指定选项卡面板
		var tabObj = $('#wu-tabs').tabs('getTab',text);
		$("iframe",tabObj).attr("src",contextPath + url);
	} else {
		url = contextPath + url;
		//alert(url);
		//加载内容
		var content = '<iframe scrolling="no" frameborder="0" src="'+url+'" width="100%" height="100%"></iframe>';
		//如果没有就创建
		$('#tt').tabs('add', {
			title : text,
			content : content,
			closable : true
		});
	}

}