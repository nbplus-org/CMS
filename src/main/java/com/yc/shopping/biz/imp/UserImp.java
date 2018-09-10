package com.yc.shopping.biz.imp;

import java.util.List;

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

	@Resource(name = "UserDao")
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
	public List<UserVO> selectUserByUname(String uname) {
		return uDao.selectUserByUname(uname);
	}

	/**
	 * 通过邮箱查询用户
	 * 
	 * @author huang
	 */
	@Override
	public List<UserVO> selectUserByUemail(String uemail) {
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
	public UserVO checkByNP(String uname, String upwd) {
		UserVO userVO1 = uDao.loginByNP(uname, Encrypt.md5(upwd));
		if (userVO1 != null) {
			return userVO1;
		}
		return null;
	}

	/**
	 * 根据用户账号查邮箱
	 * 
	 * @param user
	 * @return wang
	 * @throws BizException
	 */
	@Override
	public UserVO findEmailByName(UserVO user) throws BizException {
		UserVO u = uDao.selectEmailByName(user);
		if (u == null) {
			throw new BizException("该用户未注册");
		}
		return u;

	}

	/**
	 * 找回密码---根据账号修改密码 wang
	 * 
	 * @param zid
	 *            账号
	 * @param pwd
	 *            修改的密码
	 * @return
	 */
	@Override
	public int modifyPwdByName(String zid, String pwd) {
		String fpwd = Encrypt.md5(pwd);
		return uDao.updatePwdByName(zid, fpwd);
	}

	/**
	 * 查所有用户huang（后台）
	 */
	@Override
	public List<UserVO> selectAllUser(int page, int rows) {
		return uDao.selectAllUser(page, rows);
	}

	/**
	 * 重置用户密码通过id（后台）
	 */
	@Override
	public int resetPwd(Object uid, String pwd) {
		return uDao.resetPwd(uid, pwd);
	}


	/**
	 * 通过用户id查电话号 huang(后台)
	 * 
	 * @param uid
	 * @return
	 */
	@Override
	public String selectEmailByUid(Object uid) {
		return uDao.selectEmailByUid(uid);
	}

	/**
	 * 高级查询,通过输入的相关信息进行查询 huang(后台)
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public List<UserVO> topSelect(UserVO user, int startPage, int pageSize) {
		return uDao.topSelect(user, startPage, pageSize);
	}

	/**
	 * 分页查询需要，得到总用户数量 huang (后台)
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public int selectCount() {
		return uDao.selectCount();
	}


	/**
	 * 高级搜索用户分页查询 huang(后台)
	 */
	@Override
	public int selectCountTop(UserVO user) {
		return uDao.selectCountTop(user);
	}

}
