package com.yc.shopping.biz;

import java.util.List;

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
	
	/**
	 * 查所有服装 huang(后台服装查询)
	 * @return
	 */
	public List<ClothesVO> selectAllClothes(int startPage,int pageSize);
	
	/**
	 * 查分页总数count
	 */
	public int selectAllCount();
	
	/**
	 * 待条件分页查询服装 huang (后台)
	 * @param clothes
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	public List<ClothesVO> selectClothesByCondition(ClothesVO clothes,int startPage,int pageSize);
	
	public int selectCountByCondition(ClothesVO clothes);
	
	//=============================================
	/**
	 * 修改服装信息 huang(后台)
	 * 通过服装id得到服装信息
	 * @param clothesid
	 * @return
	 */
	ClothesVO modify(int clothesid);
}
