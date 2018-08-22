package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
//github.com/nbplus-org/CMS.git
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
	 * 
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
	 * 
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uname=#{uname}")
	UserVO selectUserByUname(String uname);

	/**
	 * 通过邮箱查询用户
	 * 
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uemail=#{uemail}")
	UserVO selectUserByUemail(String uemail);

	/**
	 * 通过手机号查询用户
	 * 
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uphone=#{uphone}")
	UserVO selectUserByUphone(String uphone);

	/**
	 * 验证用户名密码是否正确，实现登录
	 * 
	 * @param uname
	 * @param upwd
	 * @return
	 * 
	 * @author liu
	 */
	@Select("select * from uservo where uname=#{uname} and upwd=#{upwd}")
	UserVO loginByNP(@Param("uname") String uname, @Param("upwd") String upwd);
	
	/**
	 * wang 根据用户名查邮箱---忘记密码
	 * @param user
	 * @return
	 */
	@Select("select uemail from uservo where uname=#{uname}")
	UserVO selectEmailByName(UserVO user);

	
    /**
	 * 找回密码---根据账号修改密码
	 * wang
	 * @param zid  账号
	 * @param pwd  修改的密码
	 * @return
	 */
	@Update("update  uservo  set upwd=#{pwd} where uname=#{uname}")
    int updatePwdByName(@Param("uname")String zid,@Param("pwd")String pwd);
	
	
	
}
