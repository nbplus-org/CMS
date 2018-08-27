package com.yc.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.ReviewVO;

@Repository("ReviewDao")
public interface ReviewDao {	
	/**
	 * 通过服装编号   获取评论表中的匿名 评论  图片
	 * 
	 * liu
	 */
	@Select("select *from reviewvo where clothesid=#{clothesid}")
	List<ReviewVO> selectById(Integer clothesid);
}
