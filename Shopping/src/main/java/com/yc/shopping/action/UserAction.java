package com.yc.shopping.action;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller
public class UserAction {
	
	UserInterface uimp;
	
	@RequestMapping(value="/regist.do" , method=RequestMethod.POST)
	public String registerUser(UserVO user,Model model){
		//得到当前时间
		user.setuBirthday(new Date());
		user.setNickName( user.getuName() );
		
		int result=uimp.registerUser(user);
		if(result>0){
			model.addAttribute("regResultMsg", "恭喜你，注册成功!");
		}else{
			model.addAttribute("regResultMsg", "创建失败，请与管理员联系：15570921217 !");
		}
		
		return "reglogin";
		
	}
	
	
}
