package com.yc.shopping.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.biz.FormInterface;
import com.yc.shopping.biz.OrderInterface;
import com.yc.shopping.utils.ContactUsUtil;

/**
 * 报表控制
 * 
 * @author wang
 *
 */
@Controller
public class FormAction {

	@Resource(name = "FormImp")
	private FormInterface formImp;

	// 柱状图
	@RequestMapping("/backManager/monthsale.do")
	public String BarSale(String year, String month, HttpServletRequest request) {

		// 默认年份
		if (year == null || "".equals(year)) {
			year = "2015";
		}
		List<Map<String, Object>> list = formImp.monthSale(year);
		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		for (Map<String, Object> m : list) {
			nameList.add(m.get("value").toString());
			String svalue = m.get("name").toString();
			valueList.add(svalue);
		}
		System.out.println(nameList);
		System.out.println(valueList);
		request.setAttribute("nameList", nameList);
		request.setAttribute("valueList", valueList);
		return "backManager/bar-simple";
	}

	// 库存折线图
	@RequestMapping("/backManager/lineStockNum.do")
	public String lineStockNum(HttpServletRequest request) {
		List<Map<String, Object>> list = formImp.findStockNum();
		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		for (Map<String, Object> m : list) {

			nameList.add(m.get("value").toString());
			String svalue = m.get("name").toString();
			valueList.add(svalue);

		}
		System.out.println(nameList);
		System.out.println(valueList);
		request.setAttribute("nameList", nameList);
		request.setAttribute("valueList", valueList);

		return "backManager/line-simple";
	}

	// 每一年每一月的各类服装销量统计
	@RequestMapping("/backManager/piesale.do")
	public String pieSale(String year, String month, HttpServletRequest request) {
		// 默认年份
		if (year == null || "".equals(year)) {
			year = "2015";
		}
		if (month == null || "".equals(month)) {
			month = "01";
		}
		String date = year + "-" + month;
		System.out.println("日期：" + date);

		List<Map<String, Object>> list = formImp.findSaleClothesNum(date);
		List<String> nameList = new ArrayList<String>();
		List<Map<String, Object>> valueList = list;
		for (Map<String, Object> m : list) {

			nameList.add(m.get("name").toString());

		}
		System.out.println(nameList);
		System.out.println(valueList);
		request.setAttribute("nameList", nameList);
		request.setAttribute("valueList", valueList);
		return "backManager/pie-simple";
	}

	/**
	 * wang 联系我们发邮件
	 */
	@RequestMapping("contactUs.do")
	public void contactUs(String name, String email, String title, String str, HttpServletResponse response) {
		String info = name + email + title + str;
		if (info == null || "".equals(info)) {
			try {
				response.getWriter().print("0");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {

			ContactUsUtil contact = new ContactUsUtil();
			contact.sendMail(info);
			try {
				response.getWriter().print("1");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
