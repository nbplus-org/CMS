package com.yc.shopping.biz.imp;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.dao.UserDao;
import com.yc.shopping.vo.UserVO;

/**
 * 用户业务接口实现
 * 
 * @author wang
 *
 */
public class UserImp implements UserInterface {

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

}
