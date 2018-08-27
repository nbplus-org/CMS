package com.yc.shopping.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.shopping.biz.AdminInterface;
import com.yc.shopping.vo.AdminVO;

@Controller("AdminAction")
public class AdminAction {
	@Resource(name = "AdminImp")
	private AdminInterface aimp;

	/**
	 * 后台登陆判断 huang
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/backManager/backLoginJu.do", method = RequestMethod.POST)
	public void backLoginJu(AdminVO admin, Model model, HttpSession session, HttpServletResponse response) {
		AdminVO adminVo = aimp.selectAdmin(admin);
		if (adminVo == null) {
			try {
				response.getWriter().print("账户密码不匹配，请确认后重新登陆");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			session.setAttribute("admin", adminVo);
		}
	}
	
	@RequestMapping("/backManager/backLogin.do")
	public String backLogin(){
		return "/backManager/back-manager";
	}
	
}
