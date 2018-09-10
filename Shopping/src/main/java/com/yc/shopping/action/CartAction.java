package com.yc.shopping.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.yc.shopping.biz.CartInterface;
import com.yc.shopping.biz.ReviewInterface;
import com.yc.shopping.vo.CartVO;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.ReviewVO;
import com.yc.shopping.vo.UserVO;

@Controller("CartAction")
public class CartAction {

	@Resource(name = "CartImp")
	CartInterface cBiz;

	@Resource(name = "ReviewImp")
	ReviewInterface rBiz;

	/**
	 * 页面调转展示服装以及评论
	 * 
	 * @param clothesid
	 * @param model
	 * @return liu
	 */
	@RequestMapping("/check.do")
	public String check(Integer clothesid, Model model, HttpServletRequest request) {
		System.out.println("服装id" + clothesid);
		ClothesVO list = cBiz.showById(clothesid);
		model.addAttribute("clothes", list);

		model.addAttribute("clothesDetail", list.getClosthesDetailVo());
		System.out.println(list.getClosthesDetailVo().get(0).getClothespic());

		List<ClothesDetailVO> color = cBiz.findcolor(clothesid);
		model.addAttribute("color", color);
		List<ClothesDetailVO> size = cBiz.findsize(clothesid);
		model.addAttribute("size", size);
		List<ClothesDetailVO> clothespic = cBiz.findclothespic(clothesid);
		model.addAttribute("clothespic", clothespic);
		System.out.println(clothespic);

		//评论
		List<Map<String, String>> list1 = rBiz.selectById(clothesid);
		
		System.out.println("==============list1评论================="+list1);
		if(list1.size()>0){
			model.addAttribute("review", list1);
		}else{
			model.addAttribute("review", null);
		}
		request.getSession().setAttribute("list4", list1);
		model.addAttribute("clothesid", clothesid);
		return "product";
	}

	/**
	 * 购买商品事件
	 * 
	 * @param model
	 * @param qty
	 * @param color
	 * @param size
	 * @param clothesid
	 * @param response
	 * @param request
	 *            liu
	 */
	@RequestMapping("/checkNum.do")
	public void checkNum(Model model, Integer qty, String color, String size, Integer clothesid,
			HttpServletResponse response, HttpServletRequest request) {
		System.out.println(color + "=========" + size + "=========" + qty);
		System.out.println("=========" + clothesid);

		System.out.println("====================color=======" + color);
		System.out.println("=================size=======" + size);
		System.out.println("==================qty=======" + qty);

		ClothesVO aa = cBiz.checkBigTag(clothesid);
		if (!aa.getClothesbigtag().equals("包包")) {
			if (qty != null && color != null && size != null && !qty.equals("") && !color.equals("")
					&& !size.equals("")) {
				System.out.println("信息完整");
				ClothesDetailVO list = cBiz.CheckNum(clothesid, color, size);
				if (list != null) {
					if (list.getStocknum() > qty) {
						System.out.println("货还很足哦！");
						ClothesDetailVO clothDetailVO = cBiz.findId(clothesid, color, size);
						UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
						System.out.println("=====****=====" + userVo);
						CartVO cartVO = cBiz.selectClodetailid(clothDetailVO.getClodetailid());
						if (userVo != null) {
							if (cartVO == null) {
								System.out.println("购物车表没有重复的商品");
								int in = cBiz.Insert(userVo.getUid(), clothDetailVO.getClodetailid(), qty);
								if (in > 0) {
									System.out.println("已添加到购物车");
									int updatestocknum = cBiz.updatestocknum(list.getStocknum(), qty,
											clothDetailVO.getClodetailid());
									if (updatestocknum > 0) {
										System.out.println("库存已改变");
										try {
											response.getWriter().print(0);
										} catch (IOException e) {
											e.printStackTrace();
										}
									}
								} else {
									System.out.println("系统故障,请稍后再试");
									try {
										response.getWriter().print(4);
									} catch (IOException e) {
										e.printStackTrace();
									}
								}
							} else {
								System.out.println("购物车表有重复的商品,已经叠加");
								cBiz.updateCartCnum(cartVO.getCnum(), qty, clothDetailVO.getClodetailid());
							}
						} else {
							System.out.println("用户未登录");
							try {
								response.getWriter().println(5);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}

					} else {
						System.out.println("您选择的商品库存不足,请选择其他商品或降低购物量");
						try {
							response.getWriter().print(0);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				} else {
					System.out.println("此类型商品现已缺货,请选择其他商品");
					try {
						response.getWriter().print(0);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				System.out.println("请填写完整的信息");
				try {
					response.getWriter().print(1);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			if (qty != null && color != null && !qty.equals("") && !color.equals("")) {
				System.out.println("信息完整");
				ClothesDetailVO list = cBiz.CheckNum(clothesid, color, size);
				if (list != null) {
					if (list.getStocknum() > qty) {
						System.out.println("货还很足哦！");
						ClothesDetailVO clothDetailVO = cBiz.findId(clothesid, color, size);
						UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
						System.out.println("=====****=====" + userVo);
						CartVO cartVO = cBiz.selectClodetailid(clothDetailVO.getClodetailid());
						if (userVo != null) {
							if (cartVO == null) {
								System.out.println("购物车表没有重复的商品");
								int in = cBiz.Insert(userVo.getUid(), clothDetailVO.getClodetailid(), qty);
								if (in > 0) {
									System.out.println("已添加到购物车");
									int updatestocknum = cBiz.updatestocknum(list.getStocknum(), qty,
											clothDetailVO.getClodetailid());
									if (updatestocknum > 0) {
										System.out.println("库存已改变");
										try {
											response.getWriter().print(0);
										} catch (IOException e) {
											e.printStackTrace();
										}
									}
								} else {
									System.out.println("系统故障,请稍后再试");
									try {
										response.getWriter().print(4);
									} catch (IOException e) {
										e.printStackTrace();
									}
								}
							} else {
								System.out.println("购物车表有重复的商品,已经叠加");
								cBiz.updateCartCnum(cartVO.getCnum(), qty, clothDetailVO.getClodetailid());
							}
						} else {
							System.out.println("用户未登录");
							try {
								response.getWriter().println(5);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}

					} else {
						System.out.println("您选择的商品库存不足,请选择其他商品或降低购物量");
						try {
							response.getWriter().print(0);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				} else {
					System.out.println("此类型商品现已缺货,请选择其他商品");
					try {
						response.getWriter().print(0);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				System.out.println("请填写完整的信息");
				try {
					response.getWriter().print(1);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * 购物车展示
	 * 
	 * @param model
	 * @param request
	 * @return liu
	 */
	@RequestMapping("/showCart.do")
	public String addCart(Model model, HttpServletRequest request, HttpSession session) {
		UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
		if (userVo != null) {
			List<Map<String, Object>> list = cBiz.findAll(userVo.getUid());
			System.out.println(list);
			model.addAttribute("list", list);

			long cartcount = cBiz.cartCount(userVo.getUid());
			session.setAttribute("cartcount", cartcount);
			System.out.println("show.do   userVo" + userVo.getUname());
			return "cart";
		}
		return "reglogin";
	}

	/**
	 * 购物车控件操作
	 * 
	 * @param num
	 * @param cartid
	 * @param clothesprice
	 * @param cnum
	 * @param request
	 * @param response
	 *            liu
	 */
	@RequestMapping("/changeNum.do")
	public void changeNum(String num, Integer cartid, Double clothesprice, Integer cnum, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(num + "====" + cartid + "=====" + clothesprice + "======" + cnum + "====");
		int number = 0;
		Map<String, Object> data = new HashMap<String, Object>();
		Double totalprice = null;
		if ("reduce".equals(num) && cnum <= 1) {
			UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
			CartVO cartVO = cBiz.findClodetailid(cartid);
			cBiz.updateCount(num, userVo.getUid(), cartVO.getClodetailid(), cnum);
		} else {
			UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
			CartVO cartVO = cBiz.findClodetailid(cartid);
			int result = cBiz.updateCount(num, userVo.getUid(), cartVO.getClodetailid(), cnum);
			if (result > 0) {
				CartVO cVo = cBiz.checkCnum(userVo.getUid(), cartVO.getClodetailid());
				number = cVo.getCnum();
				totalprice = clothesprice * number;
			}
		}
		data.put("num", number);
		data.put("totalprice", totalprice);
		Gson gson = new Gson();
		String s = gson.toJson(data);
		try {
			response.getWriter().print(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除按钮事件
	 * 
	 * @param num
	 * @param cartid
	 * @param response
	 */
	@RequestMapping("/deleteOne.do")
	public void deleteOne(String num, Integer cartid, HttpServletResponse response) {
		Map<String, Object> data = new HashMap<String, Object>();
		if ("delete".equals(num)) {
			int result = cBiz.deleteOne(cartid);
			System.out.println(result);
			if (result > 0) {
				System.out.println("删除成功");
				CartVO end = cBiz.Found(cartid);
				System.out.println(end);
				if (end == null) {
					System.out.println("确定删除");
					data.put("end", end);
					Gson gson = new Gson();
					String s = gson.toJson(data);
					try {
						response.getWriter().print(s);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					System.out.println("为什么还会有");
				}
			} else {
				System.out.println("删除失败");
			}
		} else {
			System.out.println("num错误");
		}
	}

	/**
	 * 一键删除事件
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteAll.do")
	public String deleteAll(HttpServletRequest request, HttpServletResponse response) {
		UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
		int result = cBiz.deleteAll(userVo.getUid());
		System.out.println(result);
		if (result > 0) {
			System.out.println("购物车清除完毕");
			try {
				response.getWriter().print(0);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("购物车清除失败");
		}
		return "redirect:showCart.do";
	}

	/**
	 * 图片查看事件
	 * 
	 * @param cartid
	 * @param model
	 * @return
	 */
	@RequestMapping("/seeByPic.do")
	public String seeByPic(Integer cartid, Model model) {
		CartVO cartVO = cBiz.findClodetailid(cartid);
		ClothesDetailVO clothDetailVO = cBiz.findClothesId(cartVO.getClodetailid());
		ClothesVO list = cBiz.showById(clothDetailVO.getClothesid());
		model.addAttribute("clothes", list);

		model.addAttribute("clothesDetail", list.getClosthesDetailVo());
		System.out.println(list.getClosthesDetailVo().get(0).getClothespic());

		List<ClothesDetailVO> color = cBiz.findcolor(clothDetailVO.getClothesid());
		model.addAttribute("color", color);
		List<ClothesDetailVO> size = cBiz.findsize(clothDetailVO.getClothesid());
		model.addAttribute("size", size);
		List<ClothesDetailVO> clothespic = cBiz.findclothespic(clothDetailVO.getClothesid());
		model.addAttribute("clothespic", clothespic);
		System.out.println(clothespic);

		List<Map<String, String>> list4 = rBiz.selectById(clothDetailVO.getClothesid());
		if (list4 != null) {
			System.out.println("评论表有数值");
			model.addAttribute("list4", list4);
		}
		return "product";
	}

	/**
	 * 结账按钮(衔接订单表)
	 * 
	 * @param cartid
	 * @return
	 */
	@RequestMapping("/CartToOrder.do")
	public String CartToOrder(Integer cartid) {
		System.out.println(cartid);
		return "order";
	}

	/**
	 * 主页购物车显示 删除按钮
	 * 
	 * @param cartid
	 * @return
	 */
	@RequestMapping("/trash.do")
	public String trash(Integer cartid) {
		System.out.println("=====" + cartid);
		int result = cBiz.deleteOne(cartid);
		if (result > 0) {
			System.out.println("删除成功");
		}
		return "redirect:show.do";
	}
}
