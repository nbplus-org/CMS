package com.yc.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Repository("ClothesDao")
public interface ClothesDao {

	/**
	 * 服装展示 + 分页
	 * @param clothesVO
	 * @param pages
	 * @param rows
	 * @return
	 * liu
	 */
	List<ClothesDetailVO> Select(@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 查询服装总数量count(*)
	 * @param clothesVO
	 * @return
	 * liu
	 */
	@Select("select count(*) cnt from clothesvo")
    long count(ClothesVO clothesVO);
	
	//==================================================================================
	
}
