package com.yc.shopping.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.utils.DataUtils;
import com.yc.shopping.utils.Encrypt;
import com.yc.shopping.utils.MyUtils;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller("UserAction")
public class UserAction {
	@Resource(name = "UserImp")
	private UserInterface uimp;

	/**
	 * 注册用户
	 * 
	 * @author Computer-huangbiao
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String registerUser(UserVO user, Model model) {
		System.out.println("=========进来了=========================");

		user.setNickname(user.getUname());

		System.out.println("===========user.getUsex()==================" + user.getUsex());
		// 密码加密存入数据库
		user.setUpwd(Encrypt.md5(user.getUpwd()));

		uimp.registerUser(user);

		return "shop";
	}

	/**
	 * wang忘记密码邮件发送
	 */
	@RequestMapping("/email.do")
	public void emailSend(HttpServletResponse response, String name) {
		MyUtils email = new MyUtils();
		if (name == null || "".equals(name)) {
			try {
				response.getWriter().print("请输入邮箱");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			email.sendMail(name);
			try {
				response.getWriter().print("发送邮件成功");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 判断验证码是否正确 huang
	 */
	@RequestMapping(value = "/judgeCode.do", method = RequestMethod.POST)
	public void judgeCode(HttpServletResponse response, String name) {
		System.out.println("=========验证码===============" + DataUtils.code);
		if (DataUtils.code.equals(name)) {
			// 验证码正确
			try {
				response.getWriter().print("验证码正确");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("验证码错误");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 判断用户名是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuName.do", method = RequestMethod.POST)
	public void judgeuName(HttpServletResponse response, String uname) {
		System.out.println("======用户名==========================" + uname);
		System.out.println("======用户名==========================" + uimp.selectUserByUname(uname));
		if (uimp.selectUserByUname(uname) == null) {
			// 数据库无该用户名,可创建
			try {
				response.getWriter().print("用户名可用");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该用户名,不可创建
			try {
				response.getWriter().print("用户名已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 判断电子邮箱是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuEmail.do", method = RequestMethod.POST)
	public void judgeuEmail(HttpServletResponse response, String uemail) {

		System.out.println("======邮箱=======" + uimp.selectUserByUemail(uemail));
		if (uimp.selectUserByUemail(uemail) == null) {
			// 数据库无该邮箱,可创建
			try {
				response.getWriter().print("邮箱可用");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该邮箱,不可创建
			try {
				response.getWriter().print("邮箱已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 判断电话号码是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuPhone.do", method = RequestMethod.POST)
	public void judgeuPhone(HttpServletResponse response, String uphone) {
		System.out.println("======手机号=======" + uphone);
		if (uimp.selectUserByUphone(uphone) == null) {
			// 数据库无该手机号,可创建
			try {
				response.getWriter().print("手机号可用");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该邮箱,不可创建
			try {
				response.getWriter().print("手机号已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

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
	 *             liu
	 */
	@RequestMapping("/login.do")
	public String login(UserVO userVo, HttpServletRequest request, Model model) throws BizException {
		System.out.println(userVo.getUname() + "=========" + userVo.getUpwd());
		// 获取输入验证码
		String vcode = request.getParameter("vcode");
		// 取会话中的验证码
		String vscode = (String) request.getSession().getAttribute("vscode");

		userVo = uimp.checkByNP(userVo.getUname(), userVo.getUpwd());
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
