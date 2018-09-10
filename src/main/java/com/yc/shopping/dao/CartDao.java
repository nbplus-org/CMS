package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.vo.CartVO;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;


@Repository("CartDao")
public interface CartDao {

     /**
      * product.jsp页面添加购物车按钮 
      * @param uid
      * @param clodetailid
      * @param cnum
      * liu
      */
	@Insert("insert into cartvo(uid,clodetailid,cnum) values(#{uid},#{clodetailid},#{cnum})")
	int insert(@Param("uid")Integer uid,@Param("clodetailid")Integer clodetailid,@Param("cnum")Integer cnum);
	
	/**
	 * 通过 服装编号，颜色，尺寸  判断 库存足不足  如果足够 跳转到cart.jsp页面
	 * 将信息存入购物车表
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 * liu
	 */
	@Select("select stocknum from clothdetailvo where clothesid=#{clothesid} and clothescolour=#{clothescolour} and clothessize=#{clothessize}")
	ClothesDetailVO checkNum(@Param("clothesid")Integer clothesid,@Param("clothescolour")String clothescolour,@Param("clothessize")String clothessize);
    
	/**
	 *  通过clothesid查找相关图片的信息,跳转到product.jsp页面
	 * 完成右边信息的填写
	 * @param clothesid
	 * @return
	 * liu
	 */
	ClothesVO selectById(Integer clothesid);
	
	
	
	/**
	 * 通过clothesid查询服装详情表（clothDetailTable）的clothespic
	 * 在product.jsp页面展示出来
	 * @param clothesid
	 * @return
	 * liu
	 */
	@Select("select clothespic from clothdetailvo where clothesid=#{clothesid}")
	ClothesDetailVO showPic(Integer clothesid);
	
	/**
	 * 通过服装编号  颜色尺寸  获取服装详情ID
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 * liu
	 */
	@Select("select* from clothdetailvo where clothesid=#{clothesid} and clothescolour=#{clothescolour} and clothessize=#{clothessize}")
	ClothesDetailVO findId(@Param("clothesid")Integer clothesid,@Param("clothescolour")String clothescolour,@Param("clothessize")String clothessize);
	
	/**
	 * 根据服装详情id查询购物车表
	 * @param clodetailid
	 * @return
	 * liu
	 */
	@Select("select * from cartvo where clodetailid=#{clodetailid}")
	CartVO selectClodetailid(Integer clodetailid);
	
	/**
	 * 购物车表如有重复clodetailid,则增加cnum的数量
	 * @param cnum
	 * @param qty
	 * @param clodetailid
	 * @return
	 * liu
	 */
	@Update("update cartvo set cnum=#{cnum}+#{qty} where clodetailid=#{clodetailid}")
	int updateCartCnum(@Param("cnum")Integer cnum,@Param("qty")Integer qty,@Param("clodetailid")Integer clodetailid);
		
	/**
	 * 三个表关联查询     赋值购物车(根据用户id)
	 * @return
	 * 
	 * liu
	 */
	@Select("select * from cartvo a,clothdetailvo b,clothesvo c where a.clodetailid=b.clodetailid and c.clothesid=b.clothesid and uid=#{uid}")
	List<Map<String, Object>> findAll(Integer uid);
	
	/**
	 * 购物车加减控件操作  控制购物车cnum改变
	 * @param cnum
	 * @param uid
	 * @param clodetailid
	 * @return
	 * 
	 * liu
	 */
	@Update("update cartvo set cnum=#{cnum} where uid=#{uid} and clodetailid=#{clodetailid}")
	int update(@Param("cnum")Integer cnum,@Param("uid")Integer uid,@Param("clodetailid")Integer clodetailid);
	
	/**
	 * 根据用户id和服装详情id查询购物车表(一条)
	 * @param uid
	 * @param clodetailid
	 * @return
	 * 
	 * liu
	 */
	@Select("select * from cartvo where uid=#{uid} and clodetailid=#{clodetailid}")
	CartVO checkCnum(@Param("uid")Integer uid,@Param("clodetailid")Integer clodetailid);
	
	/**
	 * 删除购物车表中的某一条数据
	 * @param uid
	 * @param clodetailid
	 * @return
	 * 
	 * liu
	 */
	@Delete("delete from cartvo where uid=#{uid} and clodetailid=#{clodetailid}")
	int delete(@Param("uid")Integer uid,@Param("clodetailid")Integer clodetailid);
	
	/**
	 * 根据购物车id查询购物车表的服装详情id
	 * @param cartid
	 * @return
	 * 
	 * liu
	 */
	@Select("select clodetailid from cartvo where cartid=#{cartid}")
	CartVO findClodetailid(Integer cartid);
	
	/**
	 * 根据cartid 删除购物车表一条数据
	 * @param cartid
	 * @return
	 */
	@Delete("delete from cartvo where cartid=#{cartid}")
	int deleteOne(Integer cartid);
	
	/**
	 * 查询购物车表是否还有这条数据
	 * @param cartid
	 * @return
	 */
	@Select("select * from cartvo where cartid=#{cartid}")
	CartVO Found(Integer cartid);
	
	/**
	 * 根据用户id一键删除购物车
	 * @param uid
	 * @return
	 */
	@Delete("delete from cartvo where uid=#{uid}")
	int deleteAll(Integer uid);
	
	/**
	 * 根据clodetailid查询服装详情表的服装id(也就是服装表id  多对一)
	 * @return
	 */
	@Select("select *from clothdetailvo where clodetailid=#{clodetailid}")
	ClothesDetailVO findClothesId(Integer clodetailid);
	
	/**
	 * 根据服装id查询颜色(去重)
	 * @param clothesid
	 * @return
	 */
	@Select("select distinct clothescolour from clothdetailvo where  clothesid=#{clothesid}")
	List<ClothesDetailVO> findcolor(Integer clothesid);
	
	/**
	 * 根据服装id查询尺码(去重)
	 * @param clothesid
	 * @return
	 */
	@Select("select distinct clothessize from clothdetailvo where  clothesid=#{clothesid}")
	List<ClothesDetailVO> findsize(Integer clothesid);
	
	/**
	 * 根据服装id查询照片(去重)
	 * @param clothesid
	 * @return
	 */
	@Select("select distinct clothespic from clothdetailvo where clothesid=#{clothesid}")
	List<ClothesDetailVO> findclothespic(Integer clothesid);
	
	/**
	 * 根据用户id 查询购物车数量
	 * @return
	 */
	@Select("select count(*) from cartvo where uid=#{uid}")
	long cartCount(Integer uid);
	
	/**
	 * 购买商品   库存扣除购买数
	 * @param stocknum
	 * @param qty
	 * @param clodetailid
	 * @return
	 */
	@Update("update clothdetailvo set stocknum=#{stocknum}-#{qty} where clodetailid=#{clodetailid}")
	int updatestocknum(@Param("stocknum") Integer stocknum,@Param("qty") Integer qty,@Param("clodetailid") Integer clodetailid);

	/**
	 * 根据服装id 查询服装表标签类型   判断是否为包包
	 * @param clothesid
	 * @return
	 */
	@Select("select * from clothesvo where clothesid=#{clothesid}")
    ClothesVO checkBigTag(Integer clothesid);
}
