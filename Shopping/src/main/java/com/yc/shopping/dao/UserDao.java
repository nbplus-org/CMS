package com.yc.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
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
	List<UserVO> selectUserByUname(String uname);

	/**
	 * 通过邮箱查询用户
	 * 
	 * @author Computer-huangbiao
	 * @param uname
	 * @return
	 */
	@Select("select * from uservo where uemail=#{uemail}")
	List<UserVO> selectUserByUemail(String uemail);

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
	 * 
	 * @param user
	 * @return
	 */
	@Select("select uemail from uservo where uname=#{uname}")
	UserVO selectEmailByName(UserVO user);

	/**
	 * 找回密码---根据账号修改密码 wang
	 * 
	 * @param zid
	 *            账号
	 * @param pwd
	 *            修改的密码
	 * @return
	 */
	@Update("update  uservo  set upwd=#{pwd} where uname=#{uname}")
	int updatePwdByName(@Param("uname") String zid, @Param("pwd") String pwd);

	/**
	 * 查所有用户 huang(后台)
	 * 
	 * @return
	 */
	@Select("select * from uservo limit #{page} ,#{rows}")
	List<UserVO> selectAllUser(@Param("page") int page, @Param("rows") int rows);

	/**
	 * 重置用户密码通过id huang(后台)
	 * 
	 * @param uid
	 * @return
	 */
	@Delete("update uservo set upwd = #{pwd}  where uid=#{uid}")
	int resetPwd(@Param("uid") Object uid, @Param("pwd") String pwd);

	/**
	 * 查邮箱通过用户的id huang（后台）
	 * 
	 * @param uid
	 * @return
	 */
	@Select("select uemail from uservo where uid=#{uid} ")
	String selectEmailByUid(Object uid);

	/**
	 * 高级查询,通过输入的信息进行高级查询 huang（后台）
	 * 
	 * @param user
	 * @return
	 */
	@Select("select * from uservo where uemail like CONCAT('%', #{user.uemail},'%') and "
			+ "uphone like CONCAT('%', #{user.uphone},'%') and uname like CONCAT('%',#{user.uname},'%') and "
			+ "usex like CONCAT('%', #{user.usex},'%') limit #{startPage},#{pageSize}")
	List<UserVO> topSelect(@Param("user") UserVO user, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);

	/**
	 * 分页查询需要，得到总用户数量 huang (后台)
	 * 
	 * @param user
	 * @return
	 */
	@Select("select count(*) from uservo")
	int selectCount();

	/**
	 * 高级查询count huang（后台）
	 * 
	 * @param user
	 * @return
	 */
	@Select("select count(*) from uservo where uemail like CONCAT('%', #{uemail},'%') and "
			+ "uphone like CONCAT(CONCAT('%', #{uphone}),'%') and usex like CONCAT('%', #{usex},'%') and"
			+ " uname like CONCAT('%',#{uname},'%')")
	int selectCountTop(UserVO user);
}
