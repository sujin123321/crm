$(function() {
	$("#tt").each(function() {
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

