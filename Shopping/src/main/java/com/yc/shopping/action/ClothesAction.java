package com.yc.shopping.action;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Controller("ClothesAction")
public class ClothesAction {

	@Resource(name = "ClothesImp")
	ClothesInterface cBiz;

	/**
	 * 服装展示
	 * 
	 * @param clothesVO
	 * @param model
	 * @param request
	 * @return liu
	 */
	@RequestMapping("/show.do")
	public String show(ClothesVO clothesVO, Model model, HttpServletRequest request) {
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
		List<ClothesDetailVO> list = cBiz.findAll(pages, rows);
		System.out.println("============" + list);
		model.addAttribute("show", list);

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
		return "backManager/clothes-manager";
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
		model.addAttribute("clothesMsg", cBiz.modify(Integer.parseInt(clothesid)));
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
	@RequestMapping(value="/backManager/springUpload.do",method=RequestMethod.POST)
	public String springUpload(HttpServletRequest request, Model model, @Param("clothedid") String clothesid,
			@Param("aid") String aid, ClothesVO clothes, @Param("file") MultipartFile file)
			throws IllegalStateException, IOException {

		System.out.println("=============aid=============" + aid);
		/*clothes.setAid(Integer.parseInt(aid));*/
		// 一次遍历所有文件
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			System.out.println("=======图片名================" + filename);
			File f = new File("F:/git/CMS/CMS/Shopping/src/main/webapp/upload/" + filename);
			// 上传
			file.transferTo(f);
			f.mkdir();
		}

		return "backManager/back-manager";
	}
}
