package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository("ReviewDao")
public interface ReviewDao {	
	/**
	 * 通过服装编号   获取评论表中的匿名 评论  图片
	 * 
	 * liu
	 */
	@Select("select * from reviewvo r , uservo u where clothesid=#{clothesid} and r.uid=u.uid")
	List<Map<String,String>> selectById(Integer clothesid);
}
