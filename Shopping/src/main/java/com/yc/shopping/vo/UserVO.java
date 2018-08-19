package com.yc.shopping.vo;

import java.util.Date;

public class UserVO {
	
	private Integer uId;
	
	private String uName;
	
	/**
	 * 昵称
	 */
	private String nickName;
	
	private String uPwd;
	
	private byte uSex;
	
	private String uPhone;
	
	private String uEmail;
	
	/**
	 * 积分，默认为-1
	 */
	private String uIntegral;
	
	private Date uBirthday;
	
	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public byte getuSex() {
		return uSex;
	}

	public void setuSex(byte uSex) {
		this.uSex = uSex;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuIntegral() {
		return uIntegral;
	}

	public void setuIntegral(String uIntegral) {
		this.uIntegral = uIntegral;
	}

	public Date getuBirthday() {
		return uBirthday;
	}

	public void setuBirthday(Date uBirthday) {
		this.uBirthday = uBirthday;
	}
	
	
	
	
}
