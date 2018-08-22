package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Repository("UserDao")
public interface UserDao {
	/**
	 * 注册用户，插入用户数据UserVO uid主键 uintegral积分默认-1
	 * @author Computer-huangbiao
	 * @param user
	 * @return
	 */
	@Insert("insert into uservo(uname,nickname,upwd,usex,uphone,uemail,ubirthday) "
			+ "values( #{uname},#{nickname},#{upwd},#{usex},#{uphone},#{uemail},SYSDATE() )")
	@Options(useGeneratedKeys = true, keyColumn = "uid", keyProperty = "uid")
	int registerUser(UserVO user);
	
	/**
	 * 通过用户名查询用户
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uname=#{uname}")
	UserVO selectUserByUname(String uname);
	
	/**
	 * 通过邮箱查询用户
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uemail=#{uemail}")
	UserVO selectUserByUemail(String uemail);
	
	/**
	 * 通过手机号查询用户
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uphone=#{uphone}")
	UserVO selectUserByUphone(String uphone);
	
	
}
