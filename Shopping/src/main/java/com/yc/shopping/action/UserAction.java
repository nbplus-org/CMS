package com.yc.shopping.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shopping.utils.MyUtils;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller
public class UserAction {
	
	/**
	 * wang忘记密码邮件发送
	 */
	@RequestMapping("email.do")
	public void emailSend(HttpServletResponse response,String name){
		
		MyUtils email=new MyUtils();
		if(name==null||"".equals(name)){
			try {
				response.getWriter().print("请输入邮箱");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			email.sendMail(name);
			try {
				response.getWriter().print("发送邮件成功");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
