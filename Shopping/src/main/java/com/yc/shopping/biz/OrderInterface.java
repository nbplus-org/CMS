package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单接口
 * 
 * @author wang
 *
 */
public interface OrderInterface {

	/**
	 * wang 结算购物车，----确认订单功能
	 * 
	 * @return
	 * @throws BizException
	 */
	UserVO findCartByUser(UserVO userVo) throws BizException;

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
	 * wang添加订单
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
	void addOrderDetailVo(UserVO userVo, int orderid);

	/**
	 * wang查看订单
	 * 
	 * @return
	 */
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
}
