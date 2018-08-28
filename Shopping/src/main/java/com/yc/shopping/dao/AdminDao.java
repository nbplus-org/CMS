package com.yc.shopping.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.AdminVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Repository("AdminDao")
public interface AdminDao {
	/**
	 * 后台管理员登陆 huangs
	 * @param admin
	 * @return
	 */
	@Select("select * from adminvo where aname=#{aname} and apwd=#{apwd}")
	AdminVO selectAdmin(AdminVO admin);
	
}
