package com.zking.crm.tag.ui;

import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.zking.crm.util.PageBean;

public class PageTag extends BodyTagSupport{



	private static final long serialVersionUID = -4467471276324820202L;


	private PageBean pageBean;

	public PageTag() {
		super();
	}


	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}


	@Override
	public int doStartTag() throws JspException {
		try {
			if(null!=pageBean){
				String html=this.convertHTML();
				JspWriter out=pageContext.getOut();
				out.println(html);
			}else{
				throw new RuntimeException("占不到");
			}
			return SKIP_BODY;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}


	}


	//将pagebean转换成html字符串输出
	public String convertHTML(){
		StringBuffer bf=new StringBuffer();



		//动态生成js
		bf.append("<script type='text/javascript'>");
		bf.append("var maxPageNumberr="+pageBean.getMaxPageNumber()+";");
		bf.append("function doSkipPage(curPage){");
		//bf.append("alert(curPage);");
		bf.append("document.pageBeanForm.curPage.value=curPage;");
		bf.append("document.pageBeanForm.submit();");
		bf.append("}");
		bf.append("var maxPageNumber="+pageBean.getMaxPageNumber()+";");
		bf.append("function doGotoPage(){");
		bf.append("var curPage=document.getElementById('gotoPageNumber').value;");
		bf.append("if(!curPage||isNaN(curPage)||parseInt(curPage)<=0||parseInt(curPage)>maxPageNumber){");
		bf.append(" alert('页码必须是1-"+pageBean.getMaxPageNumber()+"之间的数字');");
		bf.append("var curPage=document.getElementById('gotoPageNumber').value='';");
		bf.append("var curPage=document.getElementById('gotoPageNumber').focus();");
		bf.append("return;");
		bf.append("}");
		bf.append(" doSkipPage(curPage);");
		bf.append("}");
		bf.append("</script>");



		//动态生成表单
		bf.append("<form name='pageBeanForm' action='"+pageBean.getUrl()+"' method='post'>");
		bf.append("<input type='hidden' name='curPage' value=''/>");
		for(Map.Entry<String, String[]> entry:pageBean.getParameterMap().entrySet()){
			String name=entry.getKey();
			String[] values=entry.getValue();
			if("curPage".equals(name)){
				continue;
			}
			for (String string : values) {
				bf.append("<input type='hidden' name='"+name+"' value='"+string+"'/>");
				System.out.println("name:"+name+"===="+"value="+string);
			}


		}
		bf.append("</form>");





		//动态生成按钮
		bf.append("<div align='center' style='font-size:6px;height:150px;'>");
		bf.append("第"+pageBean.getCurPage()+"页，" +
				"每页"+pageBean.getPageRecord()+"条，共"+pageBean.getTotalRecord()+"条，" +
				"共"+pageBean.getMaxPageNumber()+"页&nbsp;&nbsp;&nbsp;&nbsp;" +
				"<a href='javascript:doSkipPage(1)'>首页" +
				"</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
				"<a href='javascript:doSkipPage("+pageBean.getPreviousPageNumber()+")'>上一页</a>" +
				"&nbsp;&nbsp;&nbsp;&nbsp;" +
				"<a href='javascript:doSkipPage("+pageBean.getNextPageNumber()+")'>下一页</a>" +
				"&nbsp;&nbsp;&nbsp;&nbsp;" +
				"<a href='javascript:doSkipPage("+pageBean.getMaxPageNumber()+")'>尾页</a>" +
				"&nbsp;&nbsp;&nbsp;&nbsp;<input id='gotoPageNumber' type='text' style='width: 50px;'/>" +
				"<a href='javascript:doGotoPage()'>GO</a>");
		bf.append("</div>");



		return bf.toString();
	}
}
