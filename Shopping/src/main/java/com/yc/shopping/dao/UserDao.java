package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
public interface UserDao {
	/**
	 * 注册用户，插入用户数据UserVO
	 * uid主键
	 * uintegral积分默认-1
	 * @param user
	 * @return
	 */
	@Insert("insert into uservo(uname,nickname,upwd,usex,uphone,uemailubirthday) "
			+ "values( #{uname},#{nickname},#{upwd},#{usex},#{uphone},#{uemail},#{ubirthday} )")
	@Options(useGeneratedKeys=true,keyColumn="uid",keyProperty="uid")
	int registerUser(UserVO user);
}
