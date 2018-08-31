package com.yc.shopping.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.biz.OrderInterface;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.UserVO;

/**
 * 订单控制
 * 
 * @author wang
 *
 */
@Controller
public class OrderAction {

	@Resource(name = "OrderImp")
	private OrderInterface orderimp;

	/**
	 * 跳到结账界面---填写信息确认订单
	 * 
	 * @return
	 */
	@RequestMapping("checkout.do")
	public String checkout(Model model, HttpServletRequest request) {
		// 假设用户
		UserVO user = new UserVO();
		user.setUname("黄彪");
		user.setUid(3);
		// user.setUname("qwe");
		// user.setUid(2);
		request.getSession().setAttribute("user", user);
		// 捕获用户没有买衣服不能结账
		UserVO u = null;
		try {
			u = orderimp.findCartByUser(user);

			System.out.println(u);
			int f = orderimp.findUserUintegral(user);// 折扣
			model.addAttribute("user", u);

			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			double total = 0;
			for (int i = 0; i < u.getCartVo().size(); i++) {// ---------------???/getCartVo()
				map = new HashMap<String, Object>();
				map.put("pname", u.getClothesVo().get(i).getClothesname());
				map.put("colour", u.getClothesDetailVo().get(i).getClothescolour());
				map.put("size", u.getClothesDetailVo().get(i).getClothessize());
				map.put("num", u.getCartVo().get(i).getCnum());
				map.put("price", u.getClothesVo().get(i).getClothesprice());
				// 总价
				double tprice = u.getCartVo().get(i).getCnum() * u.getClothesVo().get(i).getClothesprice();
				total += tprice;
				list.add(map);
			}
			model.addAttribute("list", list);// 存服装
			model.addAttribute("total", total);// 存合计
			model.addAttribute("f", f);// 存用户折扣
			System.out.println(f);
			return "checkout";

		} catch (BizException e) {
			System.out.println("请先购买商品");
			return "cart";
		}

	}

	/**
	 * wang 下单按钮控制，验证用户密码 先判断有无地址，再判断有无商品， 在验证安全
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("playOrder.do")
	public void playOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("===");
		UserVO user = (UserVO) request.getSession().getAttribute("user");// 从会话获取用户判断该用户是否买了商品
		UserVO u;
		try {
			u = orderimp.findCartByUser(user);
			response.getWriter().print("2");// 请输入密码
		} catch (BizException e) {
			response.getWriter().print("1");// -----请先购买商品
		}

	}

	/**
	 * wang 判断密码是否正确
	 * 
	 * @throws IOException
	 * @throws BizException
	 */
	@RequestMapping("panduanPwd.do")
	public void judgepwd(String pwd, OrderVO order, HttpServletRequest request, HttpServletResponse response)
			throws IOException, BizException {
		// 从会话获取用户
		UserVO user = (UserVO) request.getSession().getAttribute("user");
		// 获取页面信息
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String area = request.getParameter("area");
		String detailarea = request.getParameter("detailarea");
		String price = request.getParameter("price").substring(1);// 截取￥符号
		double tranprice = Double.parseDouble(price);// 转换类型

		order.setUseraddress(province + city + area + detailarea);// 设置用户地址
		order.setUid(user.getUid());// 设置用户id
		order.setTranprice(tranprice);// 设置交易价格
		// 判断密码
		int result = orderimp.judgePwdToOrder(user, pwd);

		if (result == 0) {
			response.getWriter().print("0");// 密码错误
		} else {
			/**
			 * 插入订单表
			 */
			// OrderVO order=new OrderVO();//订单对象
			int orderid = orderimp.addOrderVo(order);// 插入订单表
			UserVO u = orderimp.findCartByUser(user);
			orderimp.addOrderDetailVo(u, orderid);// 插入订单详情表

			response.getWriter().print("1");// 密码正确
		}

	}

	/**
	 * 查看订单wang
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("seeorder.do")
	public String seeOrder(HttpServletRequest request, Model model) {
		/**
		 * 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,待评价 2---评价晒单--变3 已评价
		 * 3---删除订单--变4
		 */
		System.out.println("=====++");
		// 假设用户 查看订单请先登录
		UserVO user = new UserVO();
		user.setUname("黄彪");
		user.setUid(3);
		// user.setUname("qwe");
		// user.setUid(2);
		request.getSession().setAttribute("user", user);
		// 如果订单为空？
		List<OrderVO> o = orderimp.findOrder(user);
		// OrderVO orderVo=new OrderVO();
		// orderVo.setUid(user.getUid());
		// orderVo.setOrderstatus("0");//--0

		List<OrderVO> o0 = orderimp.findOrderByStatus0(user.getUid(), "0");// 待发货
		List<OrderVO> o1 = orderimp.findOrderByStatus0(user.getUid(), "1");// 待收货
		List<OrderVO> o2 = orderimp.findOrderByStatus0(user.getUid(), "2");// 待评价
		List<OrderVO> o3 = orderimp.findOrderByStatus0(user.getUid(), "3");// 已完成

		model.addAttribute("order", o);// 全部订单
		model.addAttribute("order0", o0);// 待发货订单
		model.addAttribute("order1", o1);// 待收货订单
		model.addAttribute("order2", o2);// 待评价订单
		model.addAttribute("order3", o3);// 已完成订单
		return "order";
	}

	/**
	 * wang订单操作--取消订单---确认收货
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("orderOperation.do")
	public void orderOperation(OrderVO orderVo, HttpServletResponse response) throws IOException {
		System.out.println("订单号：" + orderVo.getOrderid() + "状态:" + orderVo.getOrderstatus());
		int result = orderimp.changeOrderStatus(orderVo);
		if (result > 0) {
			response.getWriter().print(1);// 成功
		} else {
			response.getWriter().print(0);// 失败
		}

	}

	/**
	 * 通过status订单状态值查找对应订单订单,status为空则查全部
	 * huang(后台)
	 * @return
	 */
	@RequestMapping("backManager/selectAllOrderBystatus.do")
	public String selectAllOrderBystatus(Model model, @Param("page") String page,
			@Param("orderstatus") String orderstatus) {

		// 每条页面显示数据条数pageSize
		int pageSize = 8;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;

		List<OrderVO> allOrder = null;
		int count = 0;

		/**
		 * 判断状态值，为!=4即查全部
		 */
		if (orderstatus.equals("4")) {
			allOrder = orderimp.selectAllOrder(orderstatus, startPage, pageSize);
			// 查询总页数
			count = orderimp.selectAllOrderCount(orderstatus);
		} else {
			allOrder = orderimp.selectAllOrderBystatus(orderstatus, startPage, pageSize);
			// 查询总页数
			count = orderimp.selectOrderCount(orderstatus);
		}

		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}

		model.addAttribute("orderstatus", orderstatus);
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allOrder", allOrder);
		return "backManager/order-manager";

	}

	/**
	 * 点击按钮，查看订单详情 huang (后台)
	 * 
	 * @param orderid
	 * @param model
	 * @return
	 */
	@RequestMapping("backManager/processOrder.do")
	public String processOrder(String orderid, Model model) {
		List<Map<String, Object>> OrderDetails = orderimp.selectOrderDetailvo(Integer.parseInt(orderid));
		model.addAttribute("OrderDetails", OrderDetails);
		return "backManager/order-detail";
	}
	
	/**
	 * 修改订单状态，一般用于发货,修改时将注入管理员信息 huang(后台)
	 * @param orderid
	 * @return
	 */
	@RequestMapping("backManager/updateStatus.do")
	public String updateStatus(@Param("orderid")String orderid,@Param("orderid")String aid){
		orderimp.updateStatus( Integer.parseInt(orderid),Integer.parseInt(aid) );
		return "redirect:/backManager/selectAllOrderBystatus.do?orderstatus=0";
	}
}
