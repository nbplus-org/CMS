package com.yc.shopping.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yc.shopping.biz.CartInterface;
import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.TypeVO;
import com.yc.shopping.vo.UserVO;

@Controller("ClothesAction")
public class ClothesAction {

	@Resource(name = "ClothesImp")
	ClothesInterface cBiz;

	@Resource(name = "CartImp")
	CartInterface ctBiz;

	/**
	 * 服装展示
	 * 
	 * <<<<<<< HEAD
	 * 
	 * @param clothesVO
	 * @param model
	 * @param request
	 * @return liu
	 */
	@RequestMapping("/show.do")
	public String show(ClothesVO clothesVO, Model model, HttpServletRequest request, HttpSession session) {
		/**
		 * 获取分页查询参数
		 */
		System.out.println("==========getId=============" + request.getSession().getId());
		System.out.println("==========UserVO================" + request.getSession().getAttribute("UserVO"));
		int pages;
		int rows;
		String page = request.getParameter("page");
		String row = request.getParameter("rows");

		if (page == null || row == null) {
			pages = 1;
			rows = 8;
		} else {
			pages = Integer.parseInt(page);
			rows = Integer.parseInt(row);
		}
		long total = cBiz.count(clothesVO);
		model.addAttribute("total", total);
		// 求总页数 放到model.addAttribute里面
		int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
		model.addAttribute("allPage", allPage);

		// 当前页数 也可写成pages<=1 pages>=allPage
		if (pages < 1) {
			pages = 1;
		} else if (pages > allPage - 1) {
			System.out.println("aaaaa");
			pages = allPage;
		}
		model.addAttribute("pages", pages);
		List<Map<String, Object>> list = cBiz.findAll(pages, rows);
		System.out.println("============" + list);
		model.addAttribute("show", list);

		List<ClothesVO> clothesbigtag = cBiz.showClothesbigtag();
		model.addAttribute("clothesbigtag", clothesbigtag);
		session.setAttribute("clothesbigtag", clothesbigtag);
		List<ClothesVO> clothesbrand = cBiz.showClothesbrand();
		model.addAttribute("clothesbrand", clothesbrand);
		session.setAttribute("clothesbrand", clothesbrand);
		List<TypeVO> typename = cBiz.showtypename();
		model.addAttribute("typename", typename);
		session.setAttribute("typename", typename);
		List<ClothesVO> brandpic = cBiz.showbrandpic();
		model.addAttribute("brandpic", brandpic);
		session.setAttribute("brandpic", brandpic);

		List<Map<String, Object>> cart = ctBiz.findAll();
		System.out.println(cart);
		model.addAttribute("cart", cart);
		session.setAttribute("cart", cart);

		UserVO userVo = (UserVO) request.getSession().getAttribute("UserVO");
		if (userVo != null) {
			long cartcount = ctBiz.cartCount(userVo.getUid());
			model.addAttribute("cartcount", cartcount);
			session.setAttribute("cartcount", cartcount);
			System.out.println("show.do   userVo" + userVo.getUname());
		}

		return "index";
	}

	/**
	 * 购物车的新增或订单后的减少 都需及时查询到准确的数值，以便右上角购物车数量及信息的及时获取 huang
	 * 
	 * @param model
	 * @param session
	 */
	@RequestMapping("/showCarAgain.do")
	public void showCarAgain(Model model, HttpSession session) {

		List<Map<String, Object>> cart = ctBiz.findAll();
		System.out.println(cart);
		model.addAttribute("cart", cart);
		session.setAttribute("cart", cart);

		UserVO userVo = (UserVO) session.getAttribute("UserVO");
		if (userVo != null) {
			long cartcount = ctBiz.cartCount(userVo.getUid());
			model.addAttribute("cartcount", cartcount);
			session.setAttribute("cartcount", cartcount);
			System.out.println("show.do   userVo" + userVo.getUname());
		}
	}

	/**
	 * 头部按钮及shopjsp页面按钮查询
	 * 
	 * @param clothestype
	 * @param clothesbrand
	 * @param clothesbigtag
	 * @param clothescolour
	 * @param op
	 * @param price
	 * @param clothesVO
	 * @param model
	 * @param request
	 * @return liu
	 */
	@RequestMapping("/showShop.do")
	public String showShop(String brandpic, String clothestype, String clothesbrand, String clothesbigtag,
			String clothescolour, String op, String price, ClothesVO clothesVO, Model model,
			HttpServletRequest request) {

		System.out.println("=======clothestype======" + clothestype);
		System.out.println("=======op======" + op);

		int pages;
		int rows;
		String page = request.getParameter("page");
		String row = request.getParameter("rows");
		if (page == null || row == null) {
			pages = 1;
			rows = 4;
		} else {
			pages = Integer.parseInt(page);
			rows = Integer.parseInt(row);
		}
		System.out.println("=========" + op);
		if ("shop".equals(op)) {
			long total = cBiz.count(clothesVO);
			model.addAttribute("total", total);
			// 求总页数 放到model.addAttribute里面
			int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
			model.addAttribute("allPage", allPage);
			// 当前页数
			if (pages < 1) {
				pages = 1;
			} else if (pages > allPage - 1) {
				pages = allPage;
			}
			model.addAttribute("pages", pages);
			List<Map<String, Object>> list = cBiz.findAll(pages, rows);
			System.out.println("============" + list);
			model.addAttribute("show", list);
		} else if ("price".equals(op)) {
			System.out.println("============" + price);
			System.out.println("============" + price.length()); // 21 19 17
			// request.getSession().setAttribute("length", price.length());
			// request.getSession().setAttribute("price",price);
			// Integer.parseInt(request.getSession().getAttribute().toString())
			// System.out.println(Integer.parseInt(request.getSession().getAttribute("length").toString()));
			// if(request.getSession().getAttribute("length")!=null){
			if (price.length() == 8) {
				// String price2=(String)
				// request.getSession().getAttribute("price");
				String lower = price.substring(1, 3);
				String higher = price.substring(6, 8);
				System.out.println("=====" + lower);
				System.out.println("=====" + higher);

				long total = cBiz.countByPrice(Double.parseDouble(lower), Double.parseDouble(higher));
				model.addAttribute("total", total);
				// 求总页数 放到model.addAttribute里面
				int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
				model.addAttribute("allPage", allPage);
				// 当前页数
				if (pages <= 1) {
					pages = 1;
				} else if (pages >= allPage) {
					pages = allPage;
				}
				model.addAttribute("pages", pages);
				List<Map<String, Object>> list = cBiz.searchByPrice(Double.parseDouble(lower),
						Double.parseDouble(higher), pages, rows);
				model.addAttribute("show", list);
			} else if (price.length() == 9) {
				// String price2=(String)
				// request.getSession().getAttribute("price");
				String lower = price.substring(1, 3);
				String higher = price.substring(6, 9);
				System.out.println("=====" + lower);
				System.out.println("=====" + higher);

				long total = cBiz.countByPrice(Double.parseDouble(lower), Double.parseDouble(higher));
				model.addAttribute("total", total);
				// 求总页数 放到model.addAttribute里面
				int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
				model.addAttribute("allPage", allPage);
				// 当前页数
				if (pages < 1) {
					pages = 1;
				} else if (pages > allPage - 1) {
					pages = allPage;
				}
				model.addAttribute("pages", pages);
				List<Map<String, Object>> list = cBiz.searchByPrice(Double.parseDouble(lower),
						Double.parseDouble(higher), pages, rows);
				model.addAttribute("show", list);
			} else if (price.length() == 10) {
				// String price2=(String)
				// request.getSession().getAttribute("price");
				String lower = price.substring(1, 4);
				String higher = price.substring(7, 10);
				System.out.println("=====" + lower);
				System.out.println("=====" + higher);

				long total = cBiz.countByPrice(Double.parseDouble(lower), Double.parseDouble(higher));
				model.addAttribute("total", total);
				// 求总页数 放到model.addAttribute里面
				int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
				model.addAttribute("allPage", allPage);
				// 当前页数
				if (pages < 1) {
					pages = 1;
				} else if (pages > allPage - 1) {
					pages = allPage;
				}
				model.addAttribute("pages", pages);
				List<Map<String, Object>> list = cBiz.searchByPrice(Double.parseDouble(lower),
						Double.parseDouble(higher), pages, rows);
				model.addAttribute("show", list);
				// }

			}
		} else if ("color".equals(op)) {
			System.out.println("============" + clothescolour);
			request.getSession().setAttribute("clothescolour", clothescolour);
			if (request.getSession().getAttribute("clothescolour") == null) {
				long total = cBiz.countByColor(clothescolour);
				model.addAttribute("total", total);
				// 求总页数 放到model.addAttribute里面
				int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
				model.addAttribute("allPage", allPage);
				// 当前页数
				if (pages < 1) {
					pages = 1;
				} else if (pages > allPage - 1) {
					pages = allPage;
				}
				model.addAttribute("pages", pages);
				List<Map<String, Object>> list = cBiz.searchByColor(clothescolour, pages, rows);
				model.addAttribute("show", list);
			} else {
				String mycolor = (String) request.getSession().getAttribute("clothescolour");
				System.out.println("=====aaa=====" + mycolor);
				long total = cBiz.countByColor(mycolor);
				model.addAttribute("total", total);
				// 求总页数 放到model.addAttribute里面
				int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
				model.addAttribute("allPage", allPage);
				// 当前页数
				if (pages < 1) {
					pages = 1;
				} else if (pages > allPage - 1) {
					pages = allPage;
				}
				model.addAttribute("pages", pages);
				List<Map<String, Object>> list = cBiz.searchByColor(mycolor, pages, rows);
				model.addAttribute("show", list);
			}

		} else if ("tag".equals(op)) {
			System.out.println("============" + clothesbigtag);

			long total = cBiz.countByTag(clothesbigtag);
			model.addAttribute("total", total);
			// 求总页数 放到model.addAttribute里面
			int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
			model.addAttribute("allPage", allPage);
			// 当前页数
			if (pages < 1) {
				pages = 1;
			} else if (pages > allPage - 1) {
				pages = allPage;
			}
			model.addAttribute("pages", pages);
			List<Map<String, Object>> list = cBiz.searchByTag(clothesbigtag, pages, rows);
			model.addAttribute("show", list);
		} else if ("brand".equals(op)) {
			System.out.println("==========" + clothesbrand);
			long total = cBiz.countBybrand(clothesbrand);
			model.addAttribute("total", total);
			// 求总页数 放到model.addAttribute里面
			int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
			model.addAttribute("allPage", allPage);
			// 当前页数
			if (pages < 1) {
				pages = 1;
			} else if (pages > allPage - 1) {
				pages = allPage;
			}
			model.addAttribute("pages", pages);
			List<Map<String, Object>> list = cBiz.searchBybrand(clothesbrand, pages, rows);
			model.addAttribute("show", list);
		} else if ("type".equals(op)) {
			System.out.println("==========" + clothestype);
			long total = cBiz.countBytype(clothestype);
			model.addAttribute("total", total);
			// 求总页数 放到model.addAttribute里面
			int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
			model.addAttribute("allPage", allPage);
			// 当前页数
			if (pages < 1) {
				pages = 1;
			} else if (pages > allPage - 1) {
				pages = allPage;
			}
			model.addAttribute("pages", pages);
			List<Map<String, Object>> list = cBiz.searchBytype(clothestype, pages, rows);
			model.addAttribute("show", list);
		} else if ("brandpic".equals(op)) {
			System.out.println("=========" + brandpic);
			long total = cBiz.countBybrandpic(brandpic);
			model.addAttribute("total", total);
			// 求总页数 放到model.addAttribute里面
			int allPage = (int) (total % rows == 0 ? total / rows : total / rows + 1);
			model.addAttribute("allPage", allPage);
			// 当前页数
			if (pages < 1) {
				pages = 1;
			} else if (pages > allPage - 1) {
				pages = allPage;
			}
			model.addAttribute("pages", pages);
			List<Map<String, Object>> list = cBiz.searchBybrandpic(brandpic, pages, rows);
			model.addAttribute("show", list);
		}
		List<ClothesDetailVO> color = cBiz.findcolor();
		model.addAttribute("color", color);
		List<ClothesVO> tag = cBiz.findtag();
		model.addAttribute("tag", tag);
		request.getSession().setAttribute("op", op);

		return "shop";
	}

	/**
	 * 查所有服装并分页 huang（后台）
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/backManager/selectAllClothes.do")
	public String selectAllClothes(Model model, @Param("page") String page) {

		// 每条页面显示数据条数pageSize
		int pageSize = 8;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;

		List<ClothesVO> allClothes = cBiz.selectAllClothes(startPage, pageSize);

		// 查询总页数
		int count = cBiz.selectAllCount();
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allClothes", allClothes);
		return "backManager/clothes-manager";
	}

	/**
	 * 带条件查询服装并分页 huang（后台）
	 * 
	 * @param clothes
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping("/backManager/conditionSelectClothes.do")
	public String conditionSelectClothes(ClothesVO clothes, @Param("page") String page, Model model) {
		if (clothes.getClothesname() == null) {
			clothes.setClothesname("");
		}
		if (clothes.getClothesbigtag() == null) {
			clothes.setClothesbigtag("");
		}
		if (clothes.getClothesbrand() == null) {
			clothes.setClothesbrand("");
		}
		if (clothes.getClothestype() == null) {
			clothes.setClothestype("");
		}
		// 每条页面显示数据条数pageSize
		int pageSize = 8;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;
		List<ClothesVO> allClothes = cBiz.selectClothesByCondition(clothes, startPage, pageSize);

		// 查询总页数
		int count = cBiz.selectCountByCondition(clothes);
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("clothes", clothes);
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allClothes", allClothes);
		return "backManager/clothes-manager";
	}

	/**
	 * 服装管理--根据clothesid得到服装信息并修改信息 huang(后台)
	 * 
	 * @param model
	 * @param clothesid
	 * @return
	 */
	@RequestMapping("/backManager/clothes-modify.do")
	public String clothesModify(Model model, @Param("clothedid") String clothesid) {
		model.addAttribute("clothesMsg", cBiz.modifyOfSelect(Integer.parseInt(clothesid)));
		return "backManager/clothes-modify";
	}

	/**
	 * 修改服装信息时图片上传 huang(后台)
	 * 
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/backManager/springUpload.do", method = RequestMethod.POST)
	public String springUpload(HttpServletRequest request, Model model, @Param("clothedid") String clothesid,
			@Param("aid") String aid, ClothesVO clothes, @Param("file") MultipartFile file)
			throws IllegalStateException, IOException {
		if (aid == "" || aid == null) {
			aid = "1";
		}
		clothes.setAid(Integer.parseInt(aid));
		clothes.setClothesid(Integer.parseInt(clothesid));

		/* clothes.setAid(Integer.parseInt(aid)); */
		// 一次遍历所有文件
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			clothes.setBrandpic(filename);
			File f = new File("F:/git/CMS/CMS/Shopping/src/main/webapp/upload/" + filename);
			// 上传
			if (!f.exists()) {
				file.transferTo(f);
			}
			int result = cBiz.modifyClothes(clothes);
			if (result > 0) {
				model.addAttribute("success", "修改成功");
			} else {
				model.addAttribute("failure", "修改失败");
			}
		}
		model.addAttribute("clothesMsg", cBiz.modifyOfSelect(Integer.parseInt(clothesid)));
		return "backManager/clothes-modify";
	}

	/**
	 * 新增服装
	 * 
	 * @param file1
	 * @param file2
	 * @param typeVO
	 * @param clothessize
	 * @param clothescolour
	 * @param clothestype
	 * @param request
	 * @param response
	 * @param clothesVO
	 * @param clothesDetailVO
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/backManager/clothesInsert.do", method = RequestMethod.POST)
	public String clothesInsert(TypeVO typeVO, String clothessize, String clothestype, HttpServletRequest request,
			HttpServletResponse response, ClothesVO clothesVO, ClothesDetailVO clothesDetailVO, Model model)
			throws IllegalStateException, IOException {

		if (!"".equals(clothestype)) {
			// if(!file1.isEmpty() && !file2.isEmpty()){
			// //保存文件
			// String filename1=file1.getOriginalFilename();
			// File f1=new java.io.File("d:/"+filename1);
			// file1.transferTo(f1);
			//
			// String filename2=file2.getOriginalFilename();
			// File f2=new java.io.File("d:/"+filename2);
			// file2.transferTo(f2);
			//
			// System.out.println(filename1+filename2);

			int insert = cBiz.insertToClothes(clothesVO);
			if (insert > 0) {
				System.out.println("修改成功");
			} else {
				System.out.println("修改失败");
			}
			Integer clothesid = clothesVO.getClothesid();
			System.out.println(clothesVO.getClothesid());

			String[] types = clothestype.split("[,;:，、；]");
			for (String type : types) {
				TypeVO aa = cBiz.selectBytype(type);
				if (aa == null) {
					typeVO = new TypeVO();
					typeVO.setTypename(type);
					cBiz.InsertToTypevo(typeVO);
				}
				TypeVO bb = cBiz.selectBytype(type);
				System.out.println(bb.getTypeid());
				cBiz.insertTotypeclothesvo(bb.getTypeid(), clothesVO.getClothesid());
			}
			if (!"".equals(clothessize)) {
				String[] sizes = clothessize.split("[,;:，、；]");
				for (String size : sizes) {
					clothesDetailVO.setClothesid(clothesid);
					clothesDetailVO.setClothessize(size);
					int result = cBiz.insertToClothdetail(clothesDetailVO);
					if (result > 0) {
						System.out.println("服装详情插入成功");
					}
				}

				// }
			}
		} else {
			int insert = cBiz.insertToClothes(clothesVO);
			System.out.println("依旧插入数据");
		}
		return "backManager/clothes-manager";
	}

	/**
	 * 展示现有服装
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/backManager/clothesAll.do")
	public String clothesAll(Model model, @Param("page") String page) {
		// 每条页面显示数据条数pageSize
		int pageSize = 8;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;

		List<ClothesVO> allClothes = cBiz.selectAllClothes(startPage, pageSize);

		// 查询总页数
		int count = cBiz.selectAllCount();
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allClothes", allClothes);
		return "backManager/clothes-information";
	}

	/**
	 * 展示对应服装详情
	 * 
	 * @param clothesid
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/backManager/clothesSchedule.do")
	public String clothesSchedule(Integer clothesid, Model model, @Param("page") String page) {
		// 每条页面显示数据条数pageSize
		int pageSize = 4;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;
		List<Map<String, Object>> list = cBiz.selectClothesAndDetail(clothesid, startPage, pageSize);
		// 查询总页数
		int count = cBiz.selectCount(clothesid);
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("clothesid", clothesid);
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allClothes", list);
		return "backManager/clothes-schedule";
	}

	/**
	 * 增加库存按钮 跳转页面
	 * 
	 * @param clodetailid
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/backManager/addNum.do")
	public String addNum(Integer clodetailid, Model model) {
		model.addAttribute("clodetailid", clodetailid);

		return "backManager/clothes-addnum";
	}

	/**
	 * 增加库存
	 * 
	 * @param model
	 * @param clodetailid
	 * @param stocknum
	 * @return
	 */
	@RequestMapping(value = "/backManager/addStocknum.do", method = RequestMethod.POST)
	public String addStocknum(Model model, Integer clodetailid, Integer stocknum) {
		int result = cBiz.updateStocknum(stocknum, clodetailid);
		if (result > 0) {
			System.out.println("修改成功");
		} else {
			System.out.println("修改失败");
		}
		return "backManager/clothes-manager";
	}
	
	/**
	 * index查询按钮,模糊查询  huang
	 * @param model
	 * @param value
	 * @throws IOException 
	 */
	@RequestMapping("fuzzySelect.do")
	public String fuzzySelect(Model model,String value ,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<ClothesVO> list= new ArrayList<ClothesVO>();
		System.out.println("==============value=================="+value);
		//用value模糊查询类型,大标签，品牌
		if(value!=null && !"".equals(value)){
			List<ClothesVO> type= cBiz.clothesType(value);
			List<ClothesVO> bigtag= cBiz.clothesBigTag(value);
			List<ClothesVO> brand= cBiz.clothesBrand(value);
			if(type==null && bigtag==null && brand==null){
				list.addAll( cBiz.clothesName(value) );
			}else{
				list.addAll( type );
				list.addAll( bigtag );
				list.addAll( brand );
			}
		}
		for(int i=0;i<list.size();i++){
			System.out.println("========================"+i+"="+list.get(i));
		}
		model.addAttribute("show", list);
		return "shop";
	}
	
}
