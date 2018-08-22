package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
