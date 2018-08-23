package com.yc.shopping.biz;

import com.yc.shopping.filter.BizException;
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
	 * 
	 * @author huang
	 * @param user
	 */
	public int registerUser(UserVO user);

	/**
	 * 通过用户名查询用户
	 * 
	 * @author huang
	 * @return
	 */
	public UserVO selectUserByUname(String uname);

	/**
	 * 通过邮箱查询用户
	 * 
	 * @author huang
	 * @return
	 */
	public UserVO selectUserByUemail(String uemail);

	/**
	 * 验证用户名密码是否正确，实现登录
	 * 
	 * @param uname
	 * @param upwd
	 * @return
	 * @throws BizException
	 * 
	 * @author liu
	 */
	public UserVO checkByNP(String uname, String upwd) throws BizException;

	/**
	 * 通过电话号查询用户
	 * 
	 * @author huang
	 * @return
	 */
	public UserVO selectUserByUphone(String uphone);

	/**
	 * 根据用户账号查邮箱
	 * 
	 * @param user
	 * @return wang
	 * @throws BizException
	 */
	public UserVO findEmailByName(UserVO user) throws BizException;

	/**
	 * 找回密码---根据账号修改密码 wang
	 * 
	 * @param zid
	 *            账号
	 * @param pwd
	 *            修改的密码
	 * @return
	 */
	public int modifyPwdByName(String zid, String pwd);

}
