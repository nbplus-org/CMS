package com.yc.shopping.biz.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.dao.UserDao;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.utils.Encrypt;
//github.com/nbplus-org/CMS.git
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

	@Override
	public UserVO checkByNP(String uname,String upwd){
		UserVO userVO1=uDao.loginByNP(uname,Encrypt.md5(upwd));
		if(userVO1!=null){
			return userVO1;
		}
		return null;
	}
	
	/**
	    * 根据用户账号查邮箱
	    * @param user
	    * @return
	    * wang
	 * @throws BizException 
	    */
	@Override
	public UserVO findEmailByName(UserVO user) throws BizException {
		UserVO u=uDao.selectEmailByName(user);
		if(u==null){
			throw new BizException("该用户未注册");
		}
		return u;
		
	}
	
	/**
	 * 找回密码---根据账号修改密码
	 * wang
	 * @param zid  账号
	 * @param pwd  修改的密码
	 * @return
	 */
	@Override
	public int modifyPwdByName(String zid, String pwd) {
		 String fpwd= Encrypt.md5(pwd);
		 return uDao.updatePwdByName(zid, fpwd);
	}

}
