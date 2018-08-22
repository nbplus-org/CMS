package com.yc.shopping.vo;

/**
 * 管理员（AdminTable）
 * 
 * @author Administrator
 *
 */
public class AdminVO {
	
	private Integer aid;// 管理员编号

	private String aname;// 管理员账号

	private String apwd;// 管理员密码

	private String adminrelname;// 管理员真实姓名（）

	private String asex;// 管理员性别

	private String aphone;// 管理员电话

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public String getAdminrelname() {
		return adminrelname;
	}

	public void setAdminrelname(String adminrelname) {
		this.adminrelname = adminrelname;
	}

	public String getAsex() {
		return asex;
	}

	public void setAsex(String asex) {
		this.asex = asex;
	}

	public String getAphone() {
		return aphone;
	}

	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
}
