package com.yc.shopping.biz.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.yc.shopping.biz.CartInterface;
import com.yc.shopping.dao.CartDao;
import com.yc.shopping.vo.CartVO;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Service("CartImp")
public class CartImp implements CartInterface {
	
	@Resource(name="CartDao")
	private CartDao cDao;


	/**
	 *  通过 服装编号，颜色，尺寸  判断 库存足不足  如果足够 跳转到cart.jsp页面
	 * 将信息存入购物车表
	 * 
	 * liu
	 */
	@Override
	public ClothesDetailVO CheckNum(Integer clothesid, String clothescolour, String clothessize) {
		return cDao.checkNum(clothesid, clothescolour, clothessize);
	}
    
	/**
	 * 通过clothesid查找相关图片的信息,跳转到product.jsp页面
	 * 完成右边信息的填写
	 * 
	 * liu
	 */
	@Override
	public ClothesVO showById(Integer clothesid) {
		return cDao.selectById(clothesid);
	}

	/**
	 *  通过clothesid查询服装详情表（clothDetailTable）的clothespic
	 * 在product.jsp页面展示出来
	 * 
	 * liu
	 */
	@Override
	public ClothesDetailVO showPic(Integer clothesid) {
		return cDao.showPic(clothesid);
	}

	/**
	 * product.jsp页面添加购物车按钮 
	 * 
	 * liu
	 */
	@Override
	public int Insert(Integer uid, Integer clodetailid, Integer cnum) {
		return cDao.insert(uid, clodetailid, cnum);
	}

	/**
	 * 通过服装编号  颜色尺寸  获取服装详情ID
	 * 
	 * liu
	 */
	@Override
	public ClothesDetailVO findId(Integer clothesid, String clothescolour, String clothessize) {
		return cDao.findId(clothesid, clothescolour, clothessize);
	}
	
	/**
	 * 根据服装详情id查询购物车表
	 * 
	 * liu
	 */
	@Override
	public CartVO selectClodetailid(Integer clodetailid) {
		return cDao.selectClodetailid(clodetailid);
	}

	/**
	 * 购物车表如有重复clodetailid,则增加cnum的数量
	 * 
	 * liu
	 */
	@Override
	public int updateCartCnum(Integer cnum,Integer qty,Integer clodetailid) {
		return cDao.updateCartCnum(cnum,qty, clodetailid);        
	}


    /**
     * 三个表关联查询     赋值购物车(根据用户id)
     * 
     * liu
     */
	@Override
	public List<Map<String, Object>> findAll(Integer uid) {
		return cDao.findAll(uid);
	}
    
	/**
	 * 购物车加减控件操作  控制购物车cnum改变
	 * 
	 * liu
	 */
	@Override
	public int updateCount(String num,Integer uid,Integer clodetailid,Integer cnum) {
         if("reduce".equals(num)){
        	 if(cDao.checkCnum(uid,clodetailid).getCnum()==1){
        		 return delete(uid,clodetailid);
        	 }
        	 return cDao.update(cDao.checkCnum(uid,clodetailid).getCnum()-1,uid,clodetailid);
         }else if("add".equals(num)){
        	 return cDao.update(cDao.checkCnum(uid,clodetailid).getCnum()+1,uid,clodetailid);
         }
		return cDao.update(cnum,uid,clodetailid);
	}
    
	/**
	 * 删除购物车表中的某一条数据
	 * 
	 * liu
	 */
	@Override
	public int delete(Integer uid, Integer clodetailid) {
		return cDao.delete(uid, clodetailid);
	}

	/**
	 * 根据用户id和服装详情id查询购物车表(一条)
	 * 
	 * liu
	 */
	@Override
	public CartVO checkCnum(Integer uid, Integer clodetailid) {
		return cDao.checkCnum(uid, clodetailid);
	}

	/**
	 * 根据购物车id查询购物车表的服装详情id
	 * 
	 * liu
	 */
	@Override
	public CartVO findClodetailid(Integer cartid) {
		return cDao.findClodetailid(cartid);
	}

    /**
     * 根据cartid 删除购物车表一条数据
     */
	public int deleteOne(Integer cartid){
		return cDao.deleteOne(cartid);
	}

	/**
	 * 查询购物车表是否还有这条数据
	 */
	@Override
	public CartVO Found(Integer cartid) {
		return cDao.Found(cartid);
	}

	/**
	 * 根据用户id一键删除购物车
	 */
	@Override
	public int deleteAll(Integer uid) {
		return cDao.deleteAll(uid);
	}

	/**
	 * 根据clodetailid查询服装详情表的服装id(也就是服装表id  多对一)
	 */
	@Override
	public ClothesDetailVO findClothesId(Integer clodetailid) {
		return cDao.findClothesId(clodetailid);
	}

	/**
	 *  根据服装id查询颜色(去重)
	 */
	@Override
	public List<ClothesDetailVO> findcolor(Integer clothesid) {
		return cDao.findcolor(clothesid);
	}

	/**
	 * 根据服装id查询尺码(去重)
	 */
	@Override
	public List<ClothesDetailVO> findsize(Integer clothesid) {
		return cDao.findsize(clothesid);
	}

	/**
	 * 根据服装id查询照片(去重)
	 */
	@Override
	public List<ClothesDetailVO> findclothespic(Integer clothesid) {
		return cDao.findclothespic(clothesid);
	}

	/**
	 * 根据用户id 查询购物车数量
	 */
	@Override
	public long cartCount(Integer uid) {
		return cDao.cartCount(uid);
	}
	
	/**
	 * 购买商品   库存扣除购买数
	 */
	@Override
	public int updatestocknum(Integer stocknum, Integer qty, Integer clodetailid) {
		return cDao.updatestocknum(stocknum, qty, clodetailid);
	}

	/**
	 *  根据服装id 查询服装表标签类型   判断是否为包包
	 */
	@Override
	public ClothesVO checkBigTag(Integer clothesid) {
		return cDao.checkBigTag(clothesid);
	}

}
