package com.yc.shopping.biz.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.dao.UserDao;
import com.yc.shopping.vo.UserVO;

/**
 * 用户业务接口实现
 * 
 * @author wang
 *
 */
@Service("UserImp")
public class UserImp implements UserInterface {

	@Resource(name="UserDao")
	UserDao uDao;

	/**
	 * 注册用户
	 * 
	 * @author huang
	 */
	@Override
	public int registerUser(UserVO user) {
		return uDao.registerUser(user);
	}

	/**
	 * 通过用户名查询用户
	 * 
	 * @author huang
	 */
	@Override
	public UserVO selectUserByUname(String uname) {
		return uDao.selectUserByUname(uname);
	}

	/**
	 * 通过邮箱查询用户
	 * 
	 * @author huang
	 */
	@Override
	public UserVO selectUserByUemail(String uemail) {
		return uDao.selectUserByUemail(uemail);
	}

	/**
	 * 通过电话号码s查询用户
	 * 
	 * @author huang
	 */
	@Override
	public UserVO selectUserByUphone(String uphone) {
		return uDao.selectUserByUphone(uphone);
	}

}
