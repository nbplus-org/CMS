package com.yc.shopping.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @author Computer-huangbiao
 *
 */
public class GetCurrentTime {

	/**
	 * 得到当前的时间
	 * 
	 * @return
	 */
	public static String getCurrentTime() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 设置日期格式
		
		return sdf.format(new Date());// new Date()当前时间
	}
	
}
