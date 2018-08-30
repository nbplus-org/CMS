package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.OrderVO;
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
	 * wang 结算购物车，----确认订单功能
	 * 
	 * @return
	 */
	UserVO selectCartByUser(UserVO userVo);

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
	@Insert("INSERT into OrderDetailvo (orderid,clodetailid,num) VALUES(#{orderid},#{clodetailid},#{num})")
	int insertToOrderDetailVo(@Param("orderid") int orderid, @Param("clodetailid") int clodetailid,
			@Param("num") int num);

	/**
	 * wang查看订单
	 * 
	 * @return
	 */
	List<OrderVO> selectUserOrder(UserVO userVo);

	/**
	 * wang 查带状态的订单
	 * 
	 * @param orderVo
	 * @return
	 */
	List<OrderVO> selectOrderByStatus0(@Param("uid") Integer uid, @Param("orderstatus") String status);

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
	@Select("select * from ordervo where orderstatus =#{orderstatus} "
			+ "limit #{startPage}, #{pageSize}")
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
			+ "order by ordertime desc limit #{startPage}, #{pageSize} " )
	List<OrderVO> selectAllOrder(@Param("orderstatus") String orderstatus, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);
	@Select("select count(*) from ordervo where orderstatus !=#{orderstatus} ")
	int selectAllOrderCount(@Param("orderstatus") String orderstatus);
	
	/**
	 * 后台查询订单对应的订单详情 huang
	 * 通过orderid订单号
	 * @return
	 */
	@Select("select * from ordervo o,orderdetailvo od,clothdetailvo cd,clothesvo c where "
			+ "o.orderid =od.orderid and od.clodetailid=cd.clodetailid and cd.clothesid=c.clothesid and o.orderid=#{orderid}")
	List<Map<String, Object>> selectOrderDetailvo(int orderid);
	
	/**
	 * 修改status状态值  ,修改时会注入管理员信息，一般用于发货 huang(后台)
	 * @param orderid
	 * @return
	 */
	@Update( "update ordervo set orderstatus = '1' ,aid= where orderid=#{orderid}" )
	int updateStatus(@Param("orderid")int orderid,@Param("aid")int aid);
	
}
