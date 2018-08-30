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
	public UserVO findCartByUser(UserVO userVo) throws BizException {
		UserVO u = orderDao.selectCartByUser(userVo);
		/// ?????//?
		if (u.getClothesDetailVo().get(0) == null) {
			System.out.println("=");
			throw new BizException("请先购买商品");

		}
		return u;
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

	/**
	 * wang查看订单
	 * 
	 * @return
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
		return orderDao.updateStatus(orderid,aid);
	}

}
