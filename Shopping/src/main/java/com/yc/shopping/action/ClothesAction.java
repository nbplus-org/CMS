package com.yc.shopping.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Controller("ClothesAction")
public class ClothesAction {

	@Resource(name="ClothesImp")
	ClothesInterface  cBiz;
	
	/**
	 * 服装展示
	 * @param clothesVO
	 * @param model
	 * @param request
	 * @return
	 * liu
	 */
	@RequestMapping("/show.do")
	public String show(ClothesVO clothesVO,Model model,HttpServletRequest request){
		/**
		 * 获取分页查询参数
		 */
		int pages;
		int rows;
		String	page = request.getParameter("page");
		String	row = request.getParameter("rows");
		if(page==null || row==null){
			 pages = 1;
			 rows = 8;
		}else{
             pages=Integer.parseInt(page);				
			 rows=Integer.parseInt(row);	
		}				
		List<ClothesDetailVO> list=cBiz.findAll( pages, rows);
		System.out.println("============"+list);
		model.addAttribute("show", list);
		
		long total=cBiz.count(clothesVO);
		model.addAttribute("total", total);
		//求总页数  放到model.addAttribute里面
		int allPage=(int) (total%rows==0?  total/rows : total/rows+1);
		model.addAttribute("allPage", allPage);
		
		//当前页数
		if(pages<1){
			pages=1;
		}else if(pages>allPage-1){
			pages=allPage;
		}
		model.addAttribute("pages", pages);
		return "index";
	}
	
}
