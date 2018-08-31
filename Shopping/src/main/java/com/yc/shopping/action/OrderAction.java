package com.yc.shopping.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.biz.OrderInterface;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.OrderVO;
import com.yc.shopping.vo.ReviewVO;
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
	public String checkout(Model model, HttpServletRequest request, int[] arry) {
		
        
		UserVO u=(UserVO) request.getSession().getAttribute("UserVO");
		model.addAttribute("user", u);//展示用户基本信息
		int f = orderimp.findUserUintegral(u);// 折扣
		try {
			
			for(int i=0;i<arry.length;i++){
				System.out.println("数组："+arry[i]);
			}
			
			List<Map<String, Object>> list=orderimp.findCartByUser(arry);//查服装
			double total = 0;
			for(int i=0;i<list.size();i++){
				Integer cnum=(Integer) list.get(i).get("cnum");  
				double price=(double) list.get(i).get("clothesprice");
				double tprice=cnum*price;
				total+=tprice;
			}
			
			
			
			model.addAttribute("list", list);// 存服装
			model.addAttribute("f", f);// 存用户折扣
			model.addAttribute("total", total);// 存合计
			model.addAttribute("f", f);// 存用户折扣
			request.getSession().setAttribute("arry", arry);;// 存数组
			System.out.println("存入会话的数组"+request.getSession().getAttribute("arry"));
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

			response.getWriter().print("2");// 请输入密码


	}

	/**
	 * wang 判断密码是否正确
	 * 
	 * @throws IOException
	 * @throws BizException
	 */
	@RequestMapping("panduanPwd.do")
	public void judgepwd(String pwd, OrderVO order,
			HttpServletRequest request, HttpServletResponse response
			)
			throws IOException, BizException {
		// 从会话获取用户
		UserVO user = (UserVO) request.getSession().getAttribute("UserVO");
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
			int[] arry=(int[]) request.getSession().getAttribute("arry");
		    List<Map<String, Object>> list=orderimp.findCartByUser(arry);
			orderimp.addOrderDetailVo(list, orderid);// 插入订单详情表

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
		 * 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,可以评价 2- 已完成的查2 可以删-变4
		 * 待评价-单独查
		 */
		// 从会话获取用户
		UserVO user = (UserVO) request.getSession().getAttribute("UserVO");
		
		
		
		
		// 如果订单为空？
		//List<OrderVO> o = orderimp.findOrder(user, pages, rows);
		List<OrderVO> o = orderimp.findOrder(user);
		// OrderVO orderVo=new OrderVO();
		// orderVo.setUid(user.getUid());
		// orderVo.setOrderstatus("0");//--0

		List<OrderVO> o0 = orderimp.findOrderByStatus0(user.getUid(), "0");// 待发货
		List<OrderVO> o1 = orderimp.findOrderByStatus0(user.getUid(), "1");// 待收货
		List<OrderVO> o2 = orderimp.findOrderByStatus0(user.getUid(), "2");// 已完成
		List<OrderVO> o3 = orderimp.findOrderdaipingjia(user);// 待评价
		// 判断该订单有没有未评价的订单，有展示，没有不展示
		List<Object> o4 = new ArrayList<>();
		for (int i = 0; i < o3.size(); i++) {
			if (o3.get(i).getOrderDetailVo().size() > 0) {
				o4.add(o3.get(i));
			}
		}
		model.addAttribute("order", o);// 全部订单
		model.addAttribute("order0", o0);// 待发货订单
		model.addAttribute("order1", o1);// 待收货订单
		model.addAttribute("order2", o2);// 已完成订单
		model.addAttribute("order4", o4);// 待评价
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
	 * wang评论控制
	 * 
	 * @return
	 */
	@RequestMapping("review.do")
	public void review(String orderdetailid, Model model) {
		System.out.println("订单详情编号" + orderdetailid);

		System.out.println(orderimp.findClothByClodetail(orderdetailid));
		model.addAttribute("clothesid", orderimp.findClothByClodetail(orderdetailid));
		model.addAttribute("orderdetailid", orderdetailid);

	}

	/**
	 * wang返回订单页面
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("submit.do")
	public void backOrder(String orderdetailid, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String state = request.getParameter("state");
		String reviewstar = request.getParameter("reviewstar");
		String reviewstr = request.getParameter("reviewstr");
		String clothesid = request.getParameter("clothesid");
		System.out.println("评价的服装id" +clothesid);
        Integer id=Integer.valueOf(clothesid);//转Integer的服装id
        
		
		UserVO u = (UserVO) request.getSession().getAttribute("UserVO");
		// 设置用户id
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setUid(u.getUid());
		reviewVo.setClothesid(id);
		reviewVo.setReviewstar(reviewstar);
		reviewVo.setState(state);
		reviewVo.setReviewstr(reviewstr);
		int result = orderimp.addReviewVO(reviewVo);

		if (result > 0) {
			// 评论成功，修改订单详情表状态
			int o = orderimp.changeOrderDetailVO(orderdetailid);
			if (o > 0) {

				response.getWriter().print("1");// 评论成功
			} else {
				// 失败
				response.getWriter().print("0");// 评论失败
			}

		} else {

			response.getWriter().print("0");// 评论失败

		}

	}

}
