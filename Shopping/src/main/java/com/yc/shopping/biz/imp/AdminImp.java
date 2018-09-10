package com.yc.shopping.biz.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.AdminInterface;
import com.yc.shopping.dao.AdminDao;
import com.yc.shopping.vo.AdminVO;

/**
 * 
 * @author wang
 *
 */
@Service("AdminImp")
public class AdminImp implements AdminInterface {
	@Resource(name="AdminDao")
	private AdminDao aDao;

	/**
	 * 后台登陆 huang
	 */
	@Override
	public AdminVO selectAdmin(AdminVO admin) {
		return aDao.selectAdmin(admin);
	}

}
