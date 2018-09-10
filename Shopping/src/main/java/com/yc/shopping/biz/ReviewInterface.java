package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

public interface ReviewInterface {	
	/**
	 * 通过服装编号   获取评论表中的匿名 评论  图片
	 * @param clothesid
	 * @return
	 * 
	 * liu
	 */
	public List<Map<String,String>> selectById(Integer clothesid);
}
