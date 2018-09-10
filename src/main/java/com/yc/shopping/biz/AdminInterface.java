package com.yc.shopping.biz;

import com.yc.shopping.vo.AdminVO;

/**
 * 管理员接口
 * @author wang
 *
 */
public interface AdminInterface {

	/**
	 * 后台登陆 huang
	 * @param admin
	 * @return
	 */
	AdminVO selectAdmin(AdminVO admin);
	
}
