package com.yc.shopping.action;


import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.fabric.xmlrpc.base.Data;
import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.exception.BizException;
import com.yc.shopping.utils.DataUtils;
import com.yc.shopping.utils.MyUtils;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller
public class UserAction {
	
    @Resource(name="UserImp")
	UserInterface uimp;

	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String registerUser(UserVO user, Model model) {
		// 得到当前时间
		user.setUbirthday(new Date());
		user.setNickname(user.getUname());

		int result = uimp.registerUser(user);
		if (result > 0) {
			model.addAttribute("regResultMsg", "恭喜你，注册成功!");
		} else {
			model.addAttribute("regResultMsg", "创建失败，请与管理员联系：15570921217 !");
		}

		return "reglogin";
	}
	/**
	 * wang 根据用户账号查找邮箱
	 * @throws IOException 
	 */
    @RequestMapping("zid.do")
	public void seeEmailByUserName(HttpServletResponse response, UserVO user) throws IOException{
    	 try {
			UserVO u=uimp.findEmailByName(user);
			//隐藏邮箱
			String[] str=u.getUemail().split("@");
			String f=str[0].substring(0, 3);//前面三位数
			System.out.println(f+"=="+str[1]);//邮箱信息
			response.getWriter().print("："+f+"****@"+str[1]);//前面三维+邮箱信息
			
		} catch (BizException e) {
			response.getWriter().print("1");
		}
	}
	
	
	/**
	 * wang 忘记密码邮件发送
	 * @throws IOException 
	 */
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
	 * wang 判断验证码是否正确//表单提交
	 */
	@RequestMapping("judgecode.do")
	public String judge(String code,Model model,String zid){
		
		if(zid==null||"".equals(zid)){
			 model.addAttribute("msg1","该用户未注册");
				return "forgetpwd";
		 } 
		 if(code==null||"".equals(code)){
			model.addAttribute("msg","验证码不能为空");
			return "forgetpwd";
		 }
		if(code.equals(DataUtils.code)){
			model.addAttribute("zid",zid);
			return "resetpwd";
		}else{
			model.addAttribute("msg","验证码错误");
			return "forgetpwd";
		}
		
	}
	
	
	
	
	
	/**
	 * wang 重置密码
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("resetpwd.do")
	public void resetPwd(HttpServletResponse response,String pwd,String npwd,String zid) throws IOException{
		System.out.println(pwd +"++"+npwd);
		if(pwd.equals(npwd)){
			if(zid!=null){
				int result=uimp.modifyPwdByName(zid, npwd);
				if(result>0){
					response.getWriter().print("1");//重置成功，跳转页面
				}else{
					response.getWriter().print("2");//重置失败，请与管理员联系
				}
			}else{
				response.getWriter().print("3");//身份失效
			}
		}else{
			response.getWriter().print("4");//新密码与确认新密码不匹配
		}	
	}


}
