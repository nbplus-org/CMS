package com.yc.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单的dao
 * @author wang
 *
 */
@Repository("OrderDao")
public interface OrderDao {
    
	/**wang
	 * 结算购物车，----确认订单功能
	 * @return
	 */
	UserVO selectCartByUser(UserVO userVo);
	
	
	/**
	 * 查该用户的积分进行折扣
	 * wang
	 * @return
	 */
	@Select("select uintegral from uservo where uname=#{uname}")
	UserVO selectUserUintegral(UserVO userVo);
	
	/**
	 * wang插入订单表
	 * @return
	 */
	@Insert("INSERT INTO Ordervo (uid,uname,uphone,useraddress,ordertime,arrivaltime,tranprice,ordernotes,orderstatus) "
			+ "VALUES(#{uid},#{uname},#{uphone},#{useraddress},NOW(),date_add(NOW(),interval 1 day ),#{tranprice},#{ordernotes},0)")
	@Options(useGeneratedKeys = true, keyColumn = "orderid", keyProperty = "orderid")
	int insertToOrderVo(OrderVO order);
	
	
    /**
     * wang插入订单详情表	
     * @return
     */
	@Insert("INSERT into OrderDetailvo (orderid,clodetailid,num) VALUES(#{orderid},#{clodetailid},#{num})")
	int insertToOrderDetailVo(@Param("orderid")int orderid,@Param("clodetailid")int clodetailid,@Param("num")int num);
	
	/**
     * wang查看订单
     * @return
     */
	List<OrderVO> selectUserOrder(UserVO userVo); 
	
	/**
	 * wang 查带状态的订单
	 * @param orderVo
	 * @return
	 */
	List<OrderVO> selectOrderByStatus0(@Param("uid")Integer uid,@Param("orderstatus")String status); 
	
	/**
	 * wang操作订单状态
	 * @return
	 */
	int updateOrderStatus(OrderVO orderVo);
	
	
	
	
}
