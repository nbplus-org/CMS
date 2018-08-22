package com.yc.shopping.vo;

import java.util.Date;

/**
 * 
 * @author Computer-huangbiao
 *
 */
public class UserVO {
	
	private Integer uid;
	
	private String uname;
	
	/**
	 * 昵称
	 */
	private String nickname;
	
	private String upwd;
	
	private byte usex;
	
	private String uphone;
	
	private String uemail;
	
	/**
	 * 积分，默认为-1
	 */
	private String uintegral;
	
	private Date ubirthday;

	
	
	
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public byte getUsex() {
		return usex;
	}

	public void setUsex(byte usex) {
		this.usex = usex;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUintegral() {
		return uintegral;
	}

	public void setUintegral(String uintegral) {
		this.uintegral = uintegral;
	}

	public Date getUbirthday() {
		return ubirthday;
	}

	public void setUbirthday(Date ubirthday) {
		this.ubirthday = ubirthday;
	}
	

	
	
	
}
