package com.yc.shopping.biz.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.OrderInterface;
import com.yc.shopping.dao.OrderDao;
import com.yc.shopping.dao.UserDao;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.utils.Encrypt;
import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.ReviewVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单实现类
 * 
 * @author wang
 *
 */
@Service("OrderImp")
public class OrderImp implements OrderInterface {

	@Resource(name = "OrderDao")
	OrderDao orderDao;

	@Resource(name = "UserDao")
	UserDao uDao;

	/**
	 * wang 结算购物车，----确认订单功能
	 * 
	 * @return
	 * @throws BizException
	 */
	public List<Map<String, Object>> findCartByUser(int[] arry) throws BizException {

		return orderDao.selectCartByUser(arry);

	}

	/**
	 * 查该用户的积分进行折扣 wang
	 * 
	 * @return
	 */
	public int findUserUintegral(UserVO userVo) {
		UserVO u = orderDao.selectUserUintegral(userVo);
		int f = u.getUintegral();// 用户积分
		/**
		 * 无积分不打折---0 积分1-1000普通会员 享 95折----1 积分1001-10000 享 85折-----2
		 * 积分10001-50000享75折-----3 积分>50001享7折-----------4
		 */
		if (f == -1 || f == 0) {
			return 0;
		} else if (f > 0 && f <= 1000) {
			return 95;
		} else if (f > 1000 && f <= 10000) {
			return 85;
		} else if (f > 10000 && f <= 50000) {
			return 75;
		} else {
			return 70;
		}

	}

	/**
	 * 判断密码是否正确 正确返回1错误返回0
	 * 
	 * @return
	 */
	public int judgePwdToOrder(UserVO userVo, String pwd) {

		String fpwd = Encrypt.md5(pwd);
		UserVO u = uDao.loginByNP(userVo.getUname(), fpwd);

		if (u != null) {
			return 1;
		} else {
			return 0;
		}

	}

	/**
	 * wang添加订单 返回订单id
	 * 
	 * @return
	 */
	@Override
	public int addOrderVo(OrderVO order) {
		int i = orderDao.insertToOrderVo(order);
		return order.getOrderid();
	}

	/**
	 * 添加订单详情表wang
	 * 
	 * @param userVo
	 * @return
	 */
	public void addOrderDetailVo(UserVO userVo, int orderid) {

		for (int i = 0; i < userVo.getClothesDetailVo().size(); i++) {

			orderDao.insertToOrderDetailVo(orderid, userVo.getClothesDetailVo().get(i).getClodetailid(),
					userVo.getCartVo().get(i).getCnum());
		}
	}

	/*
	 * 添加订单详情表wang
	 * 
	 * @param userVo
	 * 
	 * @return
	 */
	public void addOrderDetailVo(List<Map<String, Object>> list, int orderid) {

		for (int i = 0; i < list.size(); i++) {

			orderDao.insertToOrderDetailVo(orderid, (Integer) list.get(i).get("clodetailid"),
					(Integer) list.get(i).get("cnum"));
		}

	}

	/**
	 * wang查看订单
	 * 
	 * @return
	 */
	/*
	 * public List<OrderVO> findOrder(UserVO userVo,int pages,int rows) {
	 * 
	 * int offset=(pages-1)*rows; return orderDao.selectUserOrder(userVo
	 * ,offset,rows); }
	 */
	public List<OrderVO> findOrder(UserVO userVo) {

		return orderDao.selectUserOrder(userVo);
	}

	/**
	 * wang 查带状态的订单
	 * 
	 * @param orderVo
	 * @return
	 */
	public List<OrderVO> findOrderByStatus0(Integer uid, String status) {
		return orderDao.selectOrderByStatus0(uid, status);
	}

	/**
	 * wang操作订单状态 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,待评价
	 * 2---评价晒单--变3 已评价 3---删除订单--变4
	 */
	@Override
	public int changeOrderStatus(OrderVO orderVo) {
		return orderDao.updateOrderStatus(orderVo);
	}

	/**
	 * wang 查看未评价的订单
	 * 
	 * @param userVo
	 * @return
	 */
	@Override
	public List<OrderVO> findOrderdaipingjia(UserVO userVo) {
		return orderDao.selectOrderdaipingjia(userVo);
	}

	/**
	 * wang根据订单详情标号查服装编号
	 * 
	 * @return
	 */
	@Override
	public Map<String, Object> findClothByClodetail(String orderdetailid) {
		return orderDao.selectClothByClodetail(orderdetailid);
	}

	/**
	 * wang 插入评论
	 * 
	 * @return
	 */
	@Override
	public int addReviewVO(ReviewVO reviewVo) {
		return orderDao.insertReviewVO(reviewVo);
	}

	/**
	 * wang 添加评论表后，修改订单详情状态
	 * 
	 * @return
	 */
	@Override
	public int changeOrderDetailVO(String orderdetailid) {
		return orderDao.updateOrderDetailVO(orderdetailid);
	}

	/**
	 * 后台查询所有订单带状态status -1,0,2,4 分页 huang（后台）
	 * 
	 * @return
	 */
	@Override
	public List<OrderVO> selectAllOrderBystatus(String orderstatus, int startPage, int pageSize) {
		return orderDao.selectAllOrderBystatus(orderstatus, startPage, pageSize);
	}

	@Override
	public int selectOrderCount(String orderstatus) {
		return orderDao.selectOrderCount(orderstatus);
	}

	/**
	 * 后台查询所有订单状态status != 4 分页 huang（后台）
	 * 
	 * @return
	 */
	@Override
	public List<OrderVO> selectAllOrder(String orderstatus, int startPage, int pageSize) {
		return orderDao.selectAllOrder(orderstatus, startPage, pageSize);
	}

	@Override
	public int selectAllOrderCount(String orderstatus) {
		return orderDao.selectAllOrderCount(orderstatus);
	}

	/**
	 * 后台查询订单对应的订单详情 huang 通过orderid订单号
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, Object>> selectOrderDetailvo(int orderid) {
		return orderDao.selectOrderDetailvo(orderid);
	}

	/**
	 * 修改status状态值 ,修改时会注入管理员信息，一般用于发货 huang(后台)
	 * 
	 * @param orderid
	 * @return
	 */
	@Override
	public int updateStatus(int orderid, int aid) {
		return orderDao.updateStatus(orderid, aid);
	}

	@Override
	public int changeOrderStatusHB(OrderVO orderVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * wang 结算全部购物车
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findCartByUserAll(UserVO userVo) throws BizException{
		return orderDao.selectCartByUserAll(userVo);
	}
	/**
	 * 删除购物车里下单的服装--部分下单
	 * @return
	 */
	@Override
	public int removeCart(int[] arry) {
		return orderDao.deleteCart(arry);
	}
	/**
	 * 删除购物车里下单的服装--全部下单
	 * @return
	 */
	@Override
	public int removeCartAll() {
		return orderDao.deleteCartAll();
	}
	
	/**
	 * wang 下单减少库存数
	 * @return
	 */
	@Override
	public int changeStokNum(int cnum, int clodetailid) {
		return orderDao.updateStokNum(cnum, clodetailid);
	}
	/**
	 * wang 根据订单号查订单详情--确认收货增加库存
	 */
	@Override
	public List<Map<String, Object>> findOrderDetailByOrderID(int orderid) {
		return orderDao.sellectOrderDetailByOrderID(orderid);
	}
	/**
	 * wang取消订单返还库存
	 * @return
	 */
	@Override
	public int changeAddStokNum(int cnum, int clodetailid) {
		return orderDao.updateAddStokNum(cnum, clodetailid);
	}
	/**
	 * wang 确认收货加入销售表
	 * @param orderid
	 * @return
	 */
	@Override
	public int addSaleVO(int orderid) {
		return orderDao.insertSaleVO(orderid);
	}

}
