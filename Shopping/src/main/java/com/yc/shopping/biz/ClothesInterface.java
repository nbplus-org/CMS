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
	public List<Map<String, Object>> findAll(Integer pages,Integer rows);
	
	/**
	 * 查询服装总数量count(*)
	 * @param clothesVO
	 * @return
	 * liu
	 */
	public long count(ClothesVO clothesVO);
	
	
	/**
	 * 查询服装标签
	 * @return
	 */
	public List<ClothesVO> showClothesbigtag();
	/**
	 * 查询服装品牌
	 * @return
	 */
	public List<ClothesVO> showClothesbrand();
	/**
	 * 查询服装类型
	 * @return
	 */
	public List<ClothesVO> showClothestype();
	/**
	 *  根据价格   关联查询
	 * @param lower
	 * @param higher
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> searchByPrice(Double lower,Double higher,Integer pages,Integer rows);
	
	/**
	 * 根据价格范围查询条数
	 * @param lower
	 * @param higher
	 * @return
	 */
	public long countByPrice(Double lower,Double higher);
	
	/**
	 * 根据颜色  关联查询
	 * @param clothescolour
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> searchByColor(String clothescolour,Integer pages,Integer rows);
	
	/**
	 * 根据颜色查询条数
	 * @param clothescolour
	 * @return
	 */
	public long countByColor(String clothescolour);
	
	/**
	 * 查询服装颜色
	 * @return
	 */
	public List<ClothesDetailVO> findcolor();
	
	/**
	 * 查询服装标签
	 * @return
	 */
	public List<ClothesVO> findtag();
	
	/**
	 * 根据标签  关联查询
	 */
	public 	List<Map<String, Object>> searchByTag(String clothesbigtag,Integer pages,Integer rows);
	
	/**
	 * 根据标签 查询条数
	 * @param clothesbigtag
	 * @return
	 */
	public long countByTag(String clothesbigtag);
	
	/**
	 * 根据品牌  关联查询
	 * @param clothesbrand
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> searchBybrand(String clothesbrand,Integer pages,Integer rows);
	
	/**
	 * 根据品牌 查询条数
	 * @param clothesbrand
	 * @return
	 */
	public long countBybrand(String clothesbrand);
	
	/**
	 * 根据类型  关联查询
	 * @param clothestype
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> searchBytype(String clothestype,Integer pages,Integer rows);

	/**
	 * 根据类型   查询条数
	 * @param clothestype
	 * @return
	 */
    public long countBytype(String clothestype);
}
