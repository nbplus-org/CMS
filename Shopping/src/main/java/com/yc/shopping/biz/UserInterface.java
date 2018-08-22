package com.yc.shopping.biz;

import com.yc.shopping.exception.BizException;
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
	   
	   
	   /**
	    * 根据用户账号查邮箱
	    * @param user
	    * @return
	    * wang
	 * @throws BizException 
	    */
	   public UserVO findEmailByName(UserVO user) throws BizException;
	   
	   /**
	    * 找回密码---根据账号修改密码
	    * wang
	    * @param zid  账号
	    * @param pwd  修改的密码
	    * @return
	    */
	   public int modifyPwdByName(String zid,String pwd);
		   
	  
	   
	   
	
}
