package com.yc.shopping.biz.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.dao.UserDao;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.filter.Encrypt;
import com.yc.shopping.filter.VaildUtils;
import com.yc.shopping.vo.UserVO;

/**
 * 用户业务接口实现
 * @author wang
 *
 */
@Component
public class UserImp implements UserInterface{

	@Resource(name="UserDao")
    private UserDao udao; 
	
	/**
	 * 验证用户名密码是否正确，实现登录
	 */
	public UserVO checkByNP(String uname,String upwd){
		UserVO userVO1=udao.loginByNP(uname,Encrypt.md5(upwd));
		if(userVO1!=null){
			return userVO1;
		}
		return null;
	}
	
}
