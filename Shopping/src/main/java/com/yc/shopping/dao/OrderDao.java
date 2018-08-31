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
import com.yc.shopping.vo.ReviewVO;
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
	List<Map<String,Object>> selectCartByUser(int[] arry);
	
	
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
	@Insert("INSERT into OrderDetailvo (orderid,clodetailid,reviewstatus,num) VALUES(#{orderid},#{clodetailid},'0',#{num})")
	int insertToOrderDetailVo(@Param("orderid")int orderid,@Param("clodetailid")int clodetailid,@Param("num")int num);
	
	/**
     * wang查看订单
     * @return
     */
	//List<OrderVO> selectUserOrder(UserVO userVo,int offset,int rows); 
	List<OrderVO> selectUserOrder(UserVO userVo); 
	/**
	 * wang查看全部订单总数--分页总数
	 * @param userVo
	 * @return
	 */
	@Select("select count(*) cnt from Ordervo where uid=#{uid} and orderstatus!=4")
	List<Map<String,Object>> selectAllOderTotal(UserVO userVo);
	
	
	/**
	 * wang 查带状态的订单
	 * @param orderVo
	 * @return
	 */
	List<OrderVO> selectOrderByStatus0(@Param("uid")Integer uid,@Param("orderstatus")String status); 
	
	/**
	 * wang 查看未评价的订单
	 * @param userVo
	 * @return
	 */
//	@Select("select * from Ordervo a LEFT JOIN OrderDetailvo b "
//			+ "on a.orderid=b.orderid where uid=#{uid} and orderstatus=2  AND reviewstatus='0' ORDER BY ordertime DESC ")
	List<OrderVO> selectOrderdaipingjia(UserVO userVo);
	
	
	
	/**
	 * wang操作订单状态
	 * @return
	 */
	int updateOrderStatus(OrderVO orderVo);
	
	/**
	 * wang根据订单详情标号查服装编号--评价
	 * @return
	 */
	@Select("SELECT c.clothesid from OrderDetailvo a LEFT JOIN ClothDetailvo b"
			+ " on a.clodetailid=b.clodetailid LEFT JOIN clothesvo c "
			+ "ON b.clothesid=c.clothesid WHERE orderdetailid=#{orderdetailid}")
	Map<String,Object> selectClothByClodetail(String orderdetailid);
	
	/**
	 * wang 插入评论
	 * @return
	 */
	@Insert("INSERT INTO Reviewvo VALUES(null,#{clothesid},#{uid},#{state},null,#{reviewstar},#{reviewstr})")
	int insertReviewVO(ReviewVO reviewVo);
	/**
	 * wang 添加评论表后，修改订单详情状态
	 * @return
	 */
	@Update("UPDATE OrderDetailvo set reviewstatus='1' WHERE orderdetailid=#{orderdetailid}")
	int updateOrderDetailVO(String orderdetailid);
	
	
	
	
}
