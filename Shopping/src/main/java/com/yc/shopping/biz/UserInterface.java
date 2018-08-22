package com.yc.shopping.biz;

import com.yc.shopping.vo.UserVO;

/**
 * 用户类接口
 * 
 * @author wang
 *
 */

public interface UserInterface {

	/**
	 * 用户注册
	 * @author huang
	 * @param user
	 */
	public int registerUser(UserVO user);

	/**
	 * 通过用户名查询用户
	 * @author huang
	 * @return
	 */
	public UserVO selectUserByUname(String uname);

	/**
	 * 通过邮箱查询用户
	 * @author huang
	 * @return
	 */
	
	public UserVO selectUserByUemail(String uemail);

	/**
	 * 通过电话号查询用户
	 * @author huang
	 * @return
	 */
	public UserVO selectUserByUphone(String uphone);

}
