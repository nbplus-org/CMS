package com.yc.shopping.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		 List<ClothesVO> clothesbigtag=cBiz.showClothesbigtag();
		 model.addAttribute("clothesbigtag", clothesbigtag);
		 session.setAttribute("clothesbigtag", clothesbigtag);
		 List<ClothesVO> clothesbrand=cBiz.showClothesbrand();
		 model.addAttribute("clothesbrand", clothesbrand);
		 session.setAttribute("clothesbrand", clothesbrand);
		 List<TypeVO> typename=cBiz.showtypename();
		 model.addAttribute("typename", typename);
		 session.setAttribute("typename", typename);
		 List<ClothesVO> brandpic=cBiz.showbrandpic();
		 model.addAttribute("brandpic", brandpic);
		 session.setAttribute("brandpic", brandpic);
		 
    	List<Map<String, Object>> cart=ctBiz.findAll();
    	System.out.println(cart);
    	//model.addAttribute("cart", cart);
    	session.setAttribute("cart", cart);
    	
    	UserVO userVo=(UserVO) request.getSession().getAttribute("UserVO");
    	if(userVo!=null){
        	long cartcount=ctBiz.cartCount(userVo.getUid());
        	//model.addAttribute("cartcount", cartcount);
        	session.setAttribute("cartcount", cartcount);
        	System.out.println("show.do   userVo"+userVo.getUname());
    	}
    	
		return "index";
	}
	
	/**
	 *购物车的新增或订单后的减少 都需及时查询到准确的数值，以便右上角购物车数量及信息的及时获取 
	 *huang
	 * @param model
	 * @param session
	 */
	@RequestMapping("/showCarAgain.do")
	public void showCarAgain( Model model,HttpSession session){
		List<Map<String, Object>> cart=ctBiz.findAll();
    	System.out.println(cart);
    	session.setAttribute("cart", cart);
    	
    	UserVO userVo=(UserVO) session.getAttribute("UserVO");
    	if(userVo!=null){
        	long cartcount=ctBiz.cartCount(userVo.getUid());
        	session.setAttribute("cartcount", cartcount);
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
	public String showShop(String brandpic,String clothestype,String clothesbrand,String clothesbigtag,String clothescolour,String op,String price,ClothesVO clothesVO, Model model, HttpServletRequest request) {
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
            if(request.getSession().getAttribute("clothescolour")==null){
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
            }else{
            	String mycolor=(String) request.getSession().getAttribute("clothescolour");
            	System.out.println("=====aaa====="+mycolor);
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

		}else if("tag".equals(op)){
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
			List<Map<String, Object>>  list=cBiz.searchBytype(clothestype, pages, rows);
			model.addAttribute("show", list);
		}else if("brandpic".equals(op)){
			System.out.println("========="+brandpic);
			long total=cBiz.countBybrandpic(brandpic);
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
			List<Map<String, Object>>  list=cBiz.searchBybrandpic(brandpic, pages, rows);
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
		if(aid==""||aid==null){
			aid="1";
		}
		clothes.setAid(Integer.parseInt(aid));
		clothes.setClothesid( Integer.parseInt(clothesid) );
		
		/* clothes.setAid(Integer.parseInt(aid)); */
		// 一次遍历所有文件
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			clothes.setBrandpic( filename );
			File f = new File("F:/git/CMS/CMS/Shopping/src/main/webapp/upload/" + filename);
			// 上传
			if(!f.exists()){
				file.transferTo(f);
			}
			int result=cBiz.modifyClothes(clothes);
			if(result>0){
				model.addAttribute("success", "修改成功");
			}else{
				model.addAttribute("failure", "修改失败");
			}
		}
		model.addAttribute("clothesMsg", cBiz.modifyOfSelect(Integer.parseInt(clothesid)));
		return "backManager/clothes-modify";
	}
	
//	@RequestMapping("/Search.do")
//	public String Search(){
//		
//		return "shop";
//	}
}
