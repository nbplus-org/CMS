package com.yc.shopping.biz;

import com.yc.shopping.vo.UserVO;

/**
 * 用户类接口
 * @author wang
 *
 */
public interface UserInterface {

	/**
	 * 用户注册
	 * @param user 
	 * @author huang
	 */
	   public int registerUser(UserVO user);
	
}
