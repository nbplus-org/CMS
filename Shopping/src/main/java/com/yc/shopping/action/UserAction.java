package com.yc.shopping.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.biz.impl.UserImp;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller
public class UserAction {

	@Autowired
	UserInterface ubiz;

	@RequestMapping(path = { "/", "/index" })
	public String index() {
		return "index";
	}

	/**
	 * 
	 * @param userVo
	 * @param request
	 * @param model
	 * @return
	 * @throws BizException
	 */
	@RequestMapping("/login.do")
	public String login(UserVO userVo, HttpServletRequest request, Model model) throws BizException {
		System.out.println(userVo.getUname() + "=========" + userVo.getUpwd());
		// 获取输入验证码
		String vcode = request.getParameter("vcode");
		// 取会话中的验证码
		String vscode = (String) request.getSession().getAttribute("vscode");

		userVo = ubiz.checkByNP(userVo.getUname(), userVo.getUpwd());
		if (userVo != null) {
			if (vcode.equalsIgnoreCase(vscode)) {
				model.addAttribute("userVo", userVo);
				return "index";
			} else {
				model.addAttribute("msgcode", "验证码错误!");
				return "reglogin";
			}
		} else {
			model.addAttribute("msg", "用户名或密码错误!");
			return "reglogin";
		}
	}
}
