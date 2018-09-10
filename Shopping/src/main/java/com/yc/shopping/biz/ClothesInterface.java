package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;


import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.TypeVO;


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
	public List<TypeVO> showtypename();
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
	public List<Map<String, Object>> searchBytype(String typename,Integer pages,Integer rows);

	/**
	 * 根据类型   查询条数
	 * @param clothestype
	 * @return
	 */
    public long countBytype(String typename);

	//==============================================================
	
	/**
	 * 查所有服装 huang(后台服装查询)
	 * @return
	 */
	public List<Map<String,String>> selectAllClothes(int startPage,int pageSize);
	
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
	public List<Map<String, String>> selectClothesByCondition(ClothesVO clothes,int startPage,int pageSize);
	
	public int selectCountByCondition(ClothesVO clothes);
	
	//=============================================
	/**
	 * 通过服装id得到服装信息
	 * @param clothesid
	 * @return
	 */
	List<Map<String, String>> modifyOfSelect(String clothesid);
	
	int modifyClothes(ClothesVO clothes);
	/**
	 * 查询品牌图片
	 * @return
	 */
	public List<ClothesVO> showbrandpic();
	/**
	 * 根据品牌图片   关联查询
	 * @param brandpic
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> searchBybrandpic(String brandpic,Integer pages,Integer rows);
	/**
	 * 根据品牌图片查询数量
	 * @param brandpic
	 * @return
	 */
	public long countBybrandpic(String brandpic);
	
	/**
	 * 新增服装表
	 * @param clothesVO
	 * @return
	 */
	public int insertToClothes(ClothesVO clothesVO);
	/**
	 * 根据类型名称查询TypeVO表已存在
	 * @param typename
	 * @return
	 */
	public TypeVO selectBytype(String typename);
	
	/**
	 * 
	 * 新增typevo表
	 * @param typeVO
	 * @return
	 */
	public int InsertToTypevo(TypeVO typeVO);
	
	/**
	 * 新增typeclothesvo表
	 * @param typeid
	 * @param clothesid
	 * @return
	 */
	public int insertTotypeclothesvo(Integer typeid,Integer clothesid);
	/**
	 *  新增服装详情表
	 * @param clothesDetailVO
	 * @return
	 */
	public int insertToClothdetail(ClothesDetailVO clothesDetailVO);
	
	/**
	 * 服装表，服装详情表关联查询
	 * @param clothesid
	 * @param pages
	 * @param rows
	 * @return
	 */
	public List<Map<String, Object>> selectClothesAndDetail(int clothesid,int pages,int rows);
	
	/**
	 * 根据服装id 查询数量
	 * @param clothesid
	 * @return
	 */
	public int selectCount(int clothesid);
	
	/**
	 * 修改库存
	 * @param stocknum
	 * @param clodetailid
	 * @return
	 */
	public int updateStocknum(Integer stocknum, Integer clodetailid); 
	
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查类型,大标签，品牌
	 * @param model
	 * @param value
	 */
	List<Map<String, String>> clothesType(String value);
	List<Map<String, String>> clothesBigTag(String value);
	List<Map<String, String>> clothesBrand(String value);
	List<Map<String, String>> clothesName(String value);
	/**
	 * 根据服装名查询服装表是否与此数据
	 * @param clothesname
	 * @return
	 */
	public ClothesVO selectByClothesName(String clothesname);
	
	/**
	 * 根据服装id 和服装颜色查询服装详情表 判断是否有此数据(前提是有尺码) 同名字不同  判断是否有不同颜色
	 * @param clothescolour
	 * @param clothesid
	 * @return
	 */
	public List<ClothesDetailVO> selectByclothescolour(String clothescolour,Integer clothesid);
	
	/**
	 * 服装颜色确定  根据服装尺寸，服装id，服装颜色判断服装详情表是否有数据(前提有尺码)  同名字同颜色不同尺码
	 * @param clothessize
	 * @param clothesid
	 * @param clothescolour
	 * @return
	 */
	public ClothesDetailVO selectByclothessize(String clothessize,Integer clothesid,String clothescolour);
	
	/**
	 * 同名字同颜色同尺码     加其库存
	 * @param stocknum
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 */
	public int updatenum(Integer stocknum,Integer clothesid,String clothescolour,String clothessize);
	
	/**
	 * 没有尺码的情况下   同名同颜色   加其库存
	 * @param clothessize
	 * @param clothesid
	 * @return
	 */
	public int updatenumNotsize(Integer stocknum,Integer clothesid, String clothescolour);
	
	/**
	 * 降序查找服装表
	 * @param startPage
	 * @param pageSize
	 * @return
	 */
	public List<ClothesVO> selectClothes(int startPage,int pageSize);

}
