package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.ReviewVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单的dao
 * 
 * @author wang
 *
 */
@Repository("OrderDao")
public interface OrderDao {

	/**
	 * wang 结算部分购物车，----确认订单功能
	 * 
	 * @return
	 */
	List<Map<String, Object>> selectCartByUser(int[] arry);
	
	
	/**wang
	 * 结算全部购物车
	 * @return
	 */
	@Select("select * from Uservo a left join"
			+ " Cartvo b on a.uid=b.uid LEFT JOIN "
			+ "ClothDetailvo c on b.clodetailid=c.clodetailid "
			+ "LEFT JOIN Clothesvo d ON d.clothesid=c.clothesid where a.uid=#{uid}")
	List<Map<String,Object>> selectCartByUserAll(UserVO userVo);
	
	

	

	/**
	 * 查该用户的积分进行折扣 wang
	 * 
	 * @return
	 */
	@Select("select uintegral from uservo where uname=#{uname}")
	UserVO selectUserUintegral(UserVO userVo);

	/**
	 * wang插入订单表
	 * 
	 * @return
	 */
	@Insert("INSERT INTO Ordervo (uid,uname,uphone,useraddress,ordertime,arrivaltime,tranprice,ordernotes,orderstatus) "
			+ "VALUES(#{uid},#{uname},#{uphone},#{useraddress},NOW(),date_add(NOW(),interval 1 day ),#{tranprice},#{ordernotes},0)")
	@Options(useGeneratedKeys = true, keyColumn = "orderid", keyProperty = "orderid")
	int insertToOrderVo(OrderVO order);

	/**
	 * wang插入订单详情表
	 * 
	 * @return
	 */
	@Insert("INSERT into OrderDetailvo (orderid,clodetailid,reviewstatus,num) VALUES(#{orderid},#{clodetailid},'0',#{num})")
	int insertToOrderDetailVo(@Param("orderid") int orderid, @Param("clodetailid") int clodetailid,
			@Param("num") int num);

	/*
	 * wang查看订单
	 * 
	 * @return
	 */
	// List<OrderVO> selectUserOrder(UserVO userVo,int offset,int rows);
	List<OrderVO> selectUserOrder(UserVO userVo);

	/**
	 * wang查看全部订单总数--分页总数
	 * 
	 * @param userVo
	 * @return
	 */
	@Select("select count(*) cnt from Ordervo where uid=#{uid} and orderstatus!=4")
	List<Map<String, Object>> selectAllOderTotal(UserVO userVo);

	/**
	 * wang 查带状态的订单
	 * 
	 * @param orderVo
	 * @return
	 */
	List<OrderVO> selectOrderByStatus0(@Param("uid") Integer uid, @Param("orderstatus") String status);

	/**
	 * wang 查看未评价的订单
	 * 
	 * @param userVo
	 * @return
	 */
	// @Select("select * from Ordervo a LEFT JOIN OrderDetailvo b "
	// + "on a.orderid=b.orderid where uid=#{uid} and orderstatus=2 AND
	// reviewstatus='0' ORDER BY ordertime DESC ")
	List<OrderVO> selectOrderdaipingjia(UserVO userVo);

	/**
	 * wang操作订单状态
	 * 
	 * @return
	 */
	int updateOrderStatus(OrderVO orderVo);

	/**
	 * 后台查询待处理订单，即订单状态orderstatus为 0的订单 huang
	 * 
	 * @return
	 */
	@Select("select * from ordervo where orderstatus = '0' ")
	List<OrderVO> selectPendingOrder();

	/**
	 * 后台查询订单带状态status -1,0,1,2 分页 huang（后台）
	 * 
	 * @return
	 */
	@Select("select * from ordervo where orderstatus =#{orderstatus} " + "limit #{startPage}, #{pageSize}")
	List<OrderVO> selectAllOrderBystatus(@Param("orderstatus") String orderstatus, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);

	@Select("select count(*) from ordervo where orderstatus =#{orderstatus} ")
	int selectOrderCount(@Param("orderstatus") String orderstatus);

	/**
	 * 后台查询所有订单带状态status!=4 分页 huang（后台）
	 * 
	 * @return
	 */
	@Select("select * from ordervo where orderstatus !=#{orderstatus} "
			+ "order by ordertime desc limit #{startPage}, #{pageSize} ")
	List<OrderVO> selectAllOrder(@Param("orderstatus") String orderstatus, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);

	@Select("select count(*) from ordervo where orderstatus !=#{orderstatus} ")
	int selectAllOrderCount(@Param("orderstatus") String orderstatus);

	/*
	 * wang根据订单详情标号查服装编号--评价
	 * 
	 * @return
	 */
	@Select("SELECT c.clothesid from OrderDetailvo a LEFT JOIN ClothDetailvo b"
			+ " on a.clodetailid=b.clodetailid LEFT JOIN clothesvo c "
			+ "ON b.clothesid=c.clothesid WHERE orderdetailid=#{orderdetailid}")
	Map<String, Object> selectClothByClodetail(String orderdetailid);

	/**
	 * wang 插入评论
	 * 
	 * @return
	 */
	@Insert("INSERT INTO Reviewvo VALUES(null,#{clothesid},#{uid},#{state},null,#{reviewstar},#{reviewstr})")
	int insertReviewVO(ReviewVO reviewVo);

	/**
	 * wang 添加评论表后，修改订单详情状态
	 * 
	 * @return
	 */
	@Update("UPDATE OrderDetailvo set reviewstatus='1' WHERE orderdetailid=#{orderdetailid}")
	int updateOrderDetailVO(String orderdetailid);

	/**
	 * 后台查询订单对应的订单详情 huang 通过orderid订单号
	 * 
	 * @return
	 */
	@Select("select * from ordervo o,orderdetailvo od,clothdetailvo cd,clothesvo c where "
			+ "o.orderid =od.orderid and od.clodetailid=cd.clodetailid and cd.clothesid=c.clothesid and o.orderid=#{orderid}")
	List<Map<String, Object>> selectOrderDetailvo(int orderid);

	/**
	 * 修改status状态值 ,修改时会注入管理员信息，一般用于发货 huang(后台)
	 * 
	 * @param orderid
	 * @return
	 */
	@Update("update ordervo set orderstatus = '1' ,aid= #{aid} where orderid=#{orderid}")
	int updateStatus(@Param("orderid") int orderid, @Param("aid") int aid);
	
	/**
	 * 删除购物车里下单的服装--部分下单
	 * @return
	 */
	int deleteCart(int[] arry);
	/**
	 * 删除购物车里下单的服装--全部下单
	 * @return
	 */
	@Delete("DELETE from cartvo")
	int deleteCartAll();
	
	/**
	 * wang 下单减少库存数
	 * @return
	 */
	@Update("UPDATE clothdetailvo set stocknum=stocknum-#{cnum} WHERE clodetailid=#{clodetailid}")
	int updateStokNum(@Param("cnum")int cnum,@Param("clodetailid")int clodetailid);
	
    
	/**
	 * wang 根据订单号查订单详情--确认收货增加库存
	 */
	@Select("SELECT * from orderdetailvo where orderid=#{orderid}")
	List<Map<String,Object>> sellectOrderDetailByOrderID(int orderid);
	
	/**
	 * wang取消订单返还库存
	 * @return
	 */
	@Update("UPDATE clothdetailvo set stocknum=stocknum+#{cnum} WHERE clodetailid=#{clodetailid}")
	int updateAddStokNum(@Param("cnum")int cnum,@Param("clodetailid")int clodetailid);
	/**
	 * wang 确认收货加入销售表
	 * @param orderid
	 * @return
	 */
	@Insert("insert into salevo VALUES(null,#{orderid})")
    int insertSaleVO(int orderid);	
}
