package com.yc.shopping.action;


import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		// 得到当前时间
		user.setUbirthday(new Date());
		user.setNickname(user.getUname());

		user.setNickname(user.getUname());

		System.out.println("===========user.getUsex()==================" + user.getUsex());
		// 密码加密存入数据库
		user.setUpwd(Encrypt.md5(user.getUpwd()));

		uimp.registerUser(user);

		return "shop";
	}

	/**
	 * wang 根据用户账号查找邮箱
	 * 
	 * @throws IOException
	 */
	@RequestMapping("zid.do")
	public void seeEmailByUserName(HttpServletResponse response, UserVO user) throws IOException {
		try {
			UserVO u = uimp.findEmailByName(user);
			// 隐藏邮箱
			String[] str = u.getUemail().split("@");
			String f = str[0].substring(0, 3);// 前面三位数
			System.out.println(f + "==" + str[1]);// 邮箱信息
			response.getWriter().print("：" + f + "****@" + str[1]);// 前面三维+邮箱信息

		} catch (BizException e) {
			response.getWriter().print("1");
		}
	}

	/**
	 * huang 忘记密码邮件发送
	 * @throws IOException 
	 */
	@RequestMapping("/semail.do")
	public void emailSend(HttpServletResponse response, String name) {
		if (name == null || "".equals(name)) {
			try {
				response.getWriter().print("请输入邮箱");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("email.do")
	public void emailSend(HttpServletResponse response,  UserVO user,String email) throws IOException {
		MyUtils my = new MyUtils();
		try {
			UserVO u=uimp.findEmailByName(user);
			if(email==null||"".equals(email)){
				response.getWriter().print("2");//异常---请输入邮箱
			}else{
				//判断输入的邮箱和数据库的是否一致
				if(email.equals(u.getUemail())){
					//一致的话发送验证码
					my.sendMail(u.getUemail());
					response.getWriter().print("4");//发送验证码成功
				}else{
					response.getWriter().print("3");//异常---邮箱错误
				}
	
			}
		} catch (BizException e) {
			response.getWriter().print("1");//异常该用户未注册
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
	 * wang 判断验证码是否正确//表单提交
	 */
	@RequestMapping("judgecode.do")
	public String judge(String code, Model model, String zid) {

		if (zid == null || "".equals(zid)) {
			model.addAttribute("msg1", "该用户未注册");
			return "forgetpwd";
		}
		if (code == null || "".equals(code)) {
			model.addAttribute("msg", "验证码不能为空");
			return "forgetpwd";
		}
		if (code.equals(DataUtils.code)) {
			model.addAttribute("zid", zid);
			return "resetpwd";
		} else {
			model.addAttribute("msg", "验证码错误");
			return "forgetpwd";
		}

	}

	/**
	 * wang 重置密码
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("resetpwd.do")
	public void resetPwd(HttpServletResponse response, String pwd, String npwd, String zid) throws IOException {
		System.out.println(pwd + "++" + npwd);
		if (pwd.equals(npwd)) {
			if (zid != null) {
				int result = uimp.modifyPwdByName(zid, npwd);
				if (result > 0) {
					response.getWriter().print("1");// 重置成功，跳转页面
				} else {
					response.getWriter().print("2");// 重置失败，请与管理员联系
				}
			} else {
				response.getWriter().print("3");// 身份失效
			}
		} else {
			response.getWriter().print("4");// 新密码与确认新密码不匹配
		}
	}

	/**
	 * 判断电话号码是否已被注册 huang
	 */
	@RequestMapping(value="/judgeuPhone.do",method=RequestMethod.POST)

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
