package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;


public interface ClothesInterface {
	
    /**
     * 服装展示 + 分页
     * @param clothesVO
     * @param pages
     * @param rows
     * @return
     * liu
     */
	public List<ClothesDetailVO> findAll(Integer pages,Integer rows);
	
	/**
	 * 查询服装总数量count(*)
	 * @param clothesVO
	 * @return
	 * liu
	 */
	public long count(ClothesVO clothesVO);
	
	//==============================================================
}
