package com.yc.shopping.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.utils.MyUtils;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller
public class UserAction {

	UserInterface uimp;

	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String registerUser(UserVO user, Model model) {
		// 得到当前时间
		user.setuBirthday(new Date());
		user.setNickName(user.getuName());

		int result = uimp.registerUser(user);
		if (result > 0) {
			model.addAttribute("regResultMsg", "恭喜你，注册成功!");
		} else {
			model.addAttribute("regResultMsg", "创建失败，请与管理员联系：15570921217 !");
		}

		return "reglogin";
	}

	/**
	 * wang忘记密码邮件发送
	 */
	@RequestMapping("email.do")
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

}
