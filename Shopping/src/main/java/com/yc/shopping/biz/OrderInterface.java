package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.ReviewVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单接口
 * 
 * @author wang
 *
 */
public interface OrderInterface {

	/**
	 * wang 结算部分购物车，----确认订单功能
	 * 
	 * @return
	 * @throws BizException
	 */
	List<Map<String, Object>> findCartByUser(int[] arry) throws BizException;

	
	/**
	 * wang 结算全部购物车
	 * @return
	 */
	List<Map<String,Object>>  findCartByUserAll(UserVO userVo)throws BizException;
	

	/**
	 * 查该用户的积分进行折扣 wang
	 * 
	 * @return
	 */
	int findUserUintegral(UserVO userVo);

	/**
	 * 判断密码是否正确 正确返回1错误返回0
	 * 
	 * @return
	 */
	int judgePwdToOrder(UserVO userVo, String pwd);

	/**
	 * 添加订单详情表wang
	 * 
	 * @param userVo
	 * @return
	 */
	void addOrderDetailVo(UserVO userVo, int orderid);

	/**
	 * int findUserUintegral(UserVO userVo);
	 * 
	 * 
	 * /** wang添加订单
	 * 
	 * @return
	 */
	int addOrderVo(OrderVO order);

	/**
	 * 添加订单详情表wang
	 * 
	 * @param userVo
	 * @return
	 */
	void addOrderDetailVo(List<Map<String, Object>> list, int orderid);

	/**
	 * wang查看订单
	 * 
	 * @return
	 */
	// List<OrderVO> findOrder(UserVO userVo,int pages,int rows);
	List<OrderVO> findOrder(UserVO userVo);

	/**
	 * wang 查带状态的订单
	 * 
	 * @param orderVo
	 * @return
	 */
	List<OrderVO> findOrderByStatus0(Integer uid, String status);

	/**
	 * wang操作订单状态 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,待评价
	 * 2---评价晒单--变3 已评价 3---删除订单--变4 List<OrderVO> findOrderByStatus0(Integer
	 * uid,String status);
	 * 
	 * /** wang 查看未评价的订单
	 * 
	 * @param userVo
	 * @return
	 */
	List<OrderVO> findOrderdaipingjia(UserVO userVo);

	/**
	 * wang操作订单状态 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,待评价
	 * 2---评价晒单--变3 已评价 3---删除订单--变4
	 */
	int changeOrderStatus(OrderVO orderVo);

	/**
	 * 后台查询订单带状态status -1,0,2,4 分页 huang（后台）
	 * 
	 * @return
	 */
	List<OrderVO> selectAllOrderBystatus(String orderstatus, int startPage, int pageSize);

	int selectOrderCount(String orderstatus);

	/**
	 * 后台查询所有订单状态status != 4 分页 huang（后台）
	 * 
	 * @return
	 */
	List<OrderVO> selectAllOrder(String orderstatus, int startPage, int pageSize);

	int selectAllOrderCount(String orderstatus);

	/**
	 * 后台查询订单对应的订单详情 huang 通过orderid订单号
	 * 
	 * @return
	 */
	List<Map<String, Object>> selectOrderDetailvo(int orderid);

	/**
	 * 修改status状态值 ,修改时会注入管理员信息，一般用于发货 huang(后台)
	 * 
	 * @param orderid
	 * @return
	 */
	int updateStatus(int orderid, int aid);

	int changeOrderStatusHB(OrderVO orderVo);

	/**
	 * wang根据订单详情标号查服装编号
	 * 
	 * @return
	 */
	Map<String, Object> findClothByClodetail(String orderdetailid);

	/**
	 * wang 插入评论
	 * 
	 * @return
	 */
	int addReviewVO(ReviewVO reviewVo);

	/**
	 * wang 添加评论表后，修改订单详情状态
	 * 
	 * @return
	 */
	int changeOrderDetailVO(String orderdetailid);
	
	
	/**
	 * 删除购物车里下单的服装--部分下单
	 * @return
	 */
	int removeCart(int[] arry);
	/**
	 * 删除购物车里下单的服装--全部下单
	 * @return
	 */
	int removeCartAll();
	
	
	/**
	 * wang 下单减少库存数
	 * @return
	 */
	int changeStokNum(int cnum,int clodetailid);
	
	/**
	 * wang 根据订单号查订单详情--确认收货增加库存
	 */
	List<Map<String,Object>> findOrderDetailByOrderID(int orderid);
	
	/**
	 * wang取消订单返还库存
	 * @return
	 */
	int changeAddStokNum(int cnum,int clodetailid);
	
	/**
	 * wang 确认收货加入销售表
	 * @param orderid
	 * @return
	 */
    int addSaleVO(int orderid);	
	

}
