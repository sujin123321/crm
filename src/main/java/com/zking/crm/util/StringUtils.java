package com.zking.crm.util;

public class StringUtils {
	private StringUtils() {
	}

	public static boolean isBlank(String str) {
		if (null == str || str.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNotBlank(String str) {
		return !isBlank(str);
	}

	public static boolean isNull(String str) {
		if (null == str) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 去掉字符串前后的空格，但字符串等于null或长度为0的串，均返回null
	 * 
	 * @param str
	 * @return
	 */
	public static String trimToNull(String str) {
		if (isBlank(str)) {
			return null;
		} else {
			return str.trim();
		}
	}

	/**
	 * 去掉字符串前后的空格，但字符串等于null或长度为0的串，均返回长度为0的串
	 * 
	 * @param str
	 * @return
	 */
	public static String trimToBlank(String str) {
		if (isBlank(str)) {
			return "";
		} else {
			return str.trim();
		}
	}

}
