package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Component("UserDao")
public interface UserDao {
	
	/**
	 * 验证用户名密码是否正确，实现登录
	 * @param uname
	 * @param upwd
	 * @return
	 * 
	 * @author liu 
	 */
	@Select("select * from uservo where uname=#{uname} and upwd=#{upwd}")
	UserVO loginByNP(@Param("uname")String uname,@Param("upwd")String upwd); 
}
