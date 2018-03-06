package com.zking.crm.util;

import java.io.Serializable;

/**
 * 生成easyui控件datagrid所需要的数据格式
 * 
 */
public class ResponseData implements Serializable {

	private static final long serialVersionUID = -308499030984494877L;

	private int code = 0;//0代表正常  非0 代表不正常
	private String message;//消息
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private int total;
	private Object rows;// List/Set/Array

	public ResponseData() {
		super();
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

}
