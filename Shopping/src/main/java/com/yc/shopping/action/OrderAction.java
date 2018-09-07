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
	 * wang 判断库存足不足，不足不能下单。
	 * @throws BizException 
	 * @throws IOException 
	 */
	@RequestMapping("pandunStackNum.do")
	public void pandunStackNum(HttpServletResponse response, int[] arry,HttpServletRequest request) throws 
	BizException, IOException{
		
		UserVO u = (UserVO) request.getSession().getAttribute("UserVO");
		//说明是购物车买部分上品
		if(arry!=null){
			List<Map<String, Object>> list = orderimp.findCartByUser(arry);// 查服装
			for(int i=0;i<list.size();i++){
				if((int)list.get(i).get("cnum")>(int)list.get(i).get("stocknum")){
					//库存不足
					response.getWriter().print((String)list.get(i).get("clothesname"));	
					System.out.println((String)list.get(i).get("clothesname")+"库存不足");
				}
			}
			response.getWriter().print("0");
		}else{
			List<Map<String, Object>> list = orderimp.findCartByUserAll(u);
			for(int i=0;i<list.size();i++){
				if((int)list.get(i).get("cnum")>(int)list.get(i).get("stocknum")){
					//库存不足
					response.getWriter().print((String)list.get(i).get("clothesname"));	
					
				}
			}
			response.getWriter().print("0");
		}
		
		
		

	}
	

	
	
	/**
	 * 跳到结账界面---填写信息确认订单---部分结算wang
	 * 
	 * @return
	 */
	@RequestMapping("checkout.do")
	public String checkout(Model model, HttpServletRequest request, int[] arry) {

		UserVO u = (UserVO) request.getSession().getAttribute("UserVO");
		model.addAttribute("user", u);// 展示用户基本信息
		int f = orderimp.findUserUintegral(u);// 折扣
		try {

			for (int i = 0; i < arry.length; i++) {
				System.out.println("数组：" + arry[i]);
			}

			List<Map<String, Object>> list = orderimp.findCartByUser(arry);// 查服装
			double total = 0;
			for (int i = 0; i < list.size(); i++) {
				Integer cnum = (Integer) list.get(i).get("cnum");
				double price = (double) list.get(i).get("clothesprice");
				double tprice = cnum * price;
				total += tprice;
			}

			model.addAttribute("list", list);// 存服装
			model.addAttribute("f", f);// 存用户折扣
			model.addAttribute("total", total);// 存合计
			model.addAttribute("f", f);// 存用户折扣
			request.getSession().setAttribute("arry", arry);// 存数组
			return "checkout";
		} catch (BizException e) {
			System.out.println("请先购买商品");
			return "cart";
		}

	}

	
	/**
	 * 跳到结账界面---填写信息确认订单---全部结算购物车wang*******
	 * 
	 * @return
	 */
	@RequestMapping("checkoutAll.do")
	public String checkoutAll(Model model, HttpServletRequest request) {

		UserVO u = (UserVO) request.getSession().getAttribute("UserVO");
		model.addAttribute("user", u);// 展示用户基本信息
		int f = orderimp.findUserUintegral(u);// 折扣
		try {

			List<Map<String, Object>> list = orderimp.findCartByUserAll(u);// 查服装
			if(list.get(0).get("clothesprice")!=null){
				double total = 0;
				for (int i = 0; i < list.size(); i++) {
					Integer cnum = (Integer) list.get(i).get("cnum");
					double price = (double) list.get(i).get("clothesprice");
					double tprice = cnum * price;
					total += tprice;
				}

				model.addAttribute("list", list);// 存服装
				model.addAttribute("f", f);// 存用户折扣
				model.addAttribute("total", total);// 存合计
				model.addAttribute("f", f);// 存用户折扣
				return "checkout";
				
			}else{
				return "cart";
			}
			
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

	public void judgepwd(String pwd, OrderVO order, HttpServletRequest request, HttpServletResponse response)
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
			int[] arry = (int[]) request.getSession().getAttribute("arry");
			
			//如果数组为空说明是全部购物
			List<Map<String, Object>> list=null;
			if(arry!=null){
				 list= orderimp.findCartByUser(arry);
				 orderimp.addOrderDetailVo(list, orderid);// 插入订单详情表
				 //修改库存数量
				 for(int i=0;i<list.size();i++){
					 orderimp.changeStokNum((int)list.get(i).get("cnum"),(int)list.get(i).get("clodetailid"));
				 }
				 orderimp.removeCart(arry);//清空购物车
				 request.getSession().removeAttribute("arry");
				 response.getWriter().print("1");// 密码正确
			}else{
				 list = orderimp.findCartByUserAll(user);
				 orderimp.addOrderDetailVo(list, orderid);// 插入订单详情表
				 //修改库存数量
				 for(int i=0;i<list.size();i++){
				 orderimp.changeStokNum((int)list.get(i).get("cnum"),(int)list.get(i).get("clodetailid"));
				 
				 }
				 orderimp.removeCartAll();//清空购物车
				 response.getWriter().print("1");// 密码正确
			}
			//response.getWriter().print("2");// 下单失败
		
			
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
		 * <<<<<<< HEAD 已支付，待发货 0---取消订单--变-1 已发货，待收货 1---确认收货--变2 已收货,待评价
		 * 2---评价晒单--变3 已评价 3---删除订单--变4 ======= 已支付，待发货 0---取消订单--变-1 已发货，待收货
		 * 1---确认收货--变2 已收货,可以评价 2- 已完成的查2 可以删-变4 待评价-单独查 >>>>>>> branch
		 * 'master' of https://github.com/nbplus-org/CMS.git
		 */
		// 从会话获取用户
		UserVO user = (UserVO) request.getSession().getAttribute("UserVO");
		if(user==null){
			return "reglogin";
		}else{
		// 如果订单为空？
		// List<OrderVO> o = orderimp.findOrder(user, pages, rows);
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
	}

	/**
	 * 通过status订单状态值查找对应订单订单,status为空则查全部 huang(后台)
	 * 
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
	 * 订单操作
	 * 取消订单库存返回
	 * 确认收货      加入销售表
	 *        
	 */

	@RequestMapping("orderOperation.do")
	public void orderOperation(OrderVO orderVo, HttpServletResponse response) throws IOException {
		System.out.println("订单号：" + orderVo.getOrderid() + "状态:" + orderVo.getOrderstatus());
		//取消的订单库存返回
		if(orderVo.getOrderstatus().equals("0")){
		List<Map<String, Object>> list=orderimp.findOrderDetailByOrderID(orderVo.getOrderid());
		    for(int i=0;i<list.size();i++){
		    	orderimp.changeAddStokNum((int)list.get(i).get("num"), (int)list.get(i).get("clodetailid"));
		    	
	        	}	
		}
		//确认收货存销售表
		if(orderVo.getOrderstatus().equals("1")){
			orderimp.addSaleVO(orderVo.getOrderid());
		}
		
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
		System.out.println("评价的服装id" + clothesid);
		Integer id = Integer.valueOf(clothesid);// 转Integer的服装id

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
	@RequestMapping("backManager/updateStatus.do")
	public void updateStatus(@Param("orderid")String orderid,@Param("aid")String aid ,HttpServletResponse response){
		System.out.println("==================发货===================");
		if(aid==null){
			aid="1";
		}
		int result=orderimp.updateStatus(Integer.parseInt(orderid), Integer.parseInt(aid));
		if(result>0){
			try {
				response.getWriter().print("已发货");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				response.getWriter().print("发货失败,请检查是否还有库存");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
