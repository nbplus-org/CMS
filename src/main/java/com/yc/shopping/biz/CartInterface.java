package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;


import com.yc.shopping.vo.CartVO;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;


public interface CartInterface {
	

	/**
	 * product.jsp页面添加购物车按钮 
	 * @param uid
	 * @param clodetailid
	 * @param cnum
	 * @return
	 * liu
	 */
	public int Insert(Integer uid,Integer clodetailid,Integer cnum);
	
	/**
	 *  通过 服装编号，颜色，尺寸  判断 库存足不足  如果足够 跳转到cart.jsp页面
	 * 将信息存入购物车表
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 * liu
	 */
	public ClothesDetailVO CheckNum(Integer clothesid,String clothescolour,String clothessize);
	
	/**
	 * 通过clothesid查找相关图片的信息,跳转到product.jsp页面
	 * 完成右边信息的填写
	 * @param clothesid
	 * @return
	 * liu
	 */
	public ClothesVO showById(Integer clothesid);
	

	
	/**
	 *  通过clothesid查询服装详情表（clothDetailTable）的clothespic
	 * 在product.jsp页面展示出来
	 * @param clothesid
	 * @return
	 * liu
	 */
	public ClothesDetailVO showPic(Integer clothesid);
	
	/**
	 * 通过服装编号  颜色尺寸  获取服装详情ID
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 * liu
	 */
	public ClothesDetailVO findId(Integer clothesid,String clothescolour,String clothessize);
	
	/**
	 * 根据服装详情id查询购物车表
	 * @param clodetailid
	 * @return
	 * liu
	 */
	public CartVO selectClodetailid(Integer clodetailid);
	
	/**
	 * 购物车表如有重复clodetailid,则增加cnum的数量
	 * @param cnum
	 * @param qty
	 * @param clodetailid
	 * @return
	 * liu
	 */
	public int updateCartCnum(Integer cnum,Integer qty,Integer clodetailid);
	
	/**
	 * 三个表关联查询     赋值购物车(根据用户id)
	 * @return
	 * 
	 * liu
	 */
	public List<Map<String, Object>> findAll(Integer uid);
	
	/**
	 * 购物车加减控件操作  控制购物车cnum改变
	 * @param num
	 * @param uid
	 * @param clodetailid
	 * @param cnum
	 * @return
	 * 
	 * liu
	 */
	public int updateCount(String num,Integer uid,Integer clodetailid,Integer cnum);
	
	/**
	 * 删除购物车表中的某一条数据
	 * @param uid
	 * @param clodetailid
	 * @return
	 * 
	 * liu
	 */
	public int delete(Integer uid,Integer clodetailid);
	
	/**
	 * 根据用户id和服装详情id查询购物车表(一条)
	 * @param uid
	 * @param clodetailid
	 * @return
	 * 
	 * liu
	 */
	public CartVO checkCnum(Integer uid,Integer clodetailid);
	
	/**
	 * 根据购物车id查询购物车表的服装详情id
	 * @param cartid
	 * @return
	 * 
	 * liu
	 */
	public CartVO findClodetailid(Integer cartid);
	
	/**
	 * 根据cartid 删除购物车表一条数据
	 */
	public int deleteOne(Integer cartid);
	
	/**
	 * 查询购物车表是否还有这条数据
	 * @param cartid
	 * @return
	 */
	public CartVO Found(Integer cartid);
	
	/**
	 * 根据用户id一键删除购物车
	 * @param uid
	 * @return
	 */
	public int deleteAll(Integer uid);
	
	/**
	 * 根据clodetailid查询服装详情表的服装id(也就是服装表id  多对一)
	 * @param clodetailid
	 * @return
	 */
	public ClothesDetailVO findClothesId(Integer clodetailid);
	
	/**
	 *  根据服装id查询颜色(去重)
	 * @param clothesid
	 * @return
	 */
	public 	List<ClothesDetailVO> findcolor(Integer clothesid);
	
	/**
	 * 根据服装id查询尺码(去重)
	 * @param clothesid
	 * @return
	 */
	public List<ClothesDetailVO> findsize(Integer clothesid);
	
	/**
	 * 根据服装id查询照片(去重)
	 * @param clothesid
	 * @return
	 */
	public List<ClothesDetailVO> findclothespic(Integer clothesid);
	
	/**
	 *  根据用户id 查询购物车数量
	 * @param uid
	 * @return
	 */
	public long cartCount(Integer uid);
	/**
	 * 购买商品   库存扣除购买数
	 * @param stocknum
	 * @param qty
	 * @param clodetailid
	 * @return
	 */
	public int updatestocknum(Integer stocknum,Integer qty,Integer clodetailid);
	/**
	 *  根据服装id 查询服装表标签类型   判断是否为包包
	 * @param clothesid
	 * @return
	 */
	ClothesVO checkBigTag(Integer clothesid);
}
