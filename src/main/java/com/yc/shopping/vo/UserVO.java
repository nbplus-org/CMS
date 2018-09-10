package com.yc.shopping.vo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 用户表（UserTable）
 * 
 * @author Administrator
 *
 */
public class UserVO {

	
	private Integer uid;// 用户编号

	private String uname;// 用户账号，（用户名）

	private String nickname;// 用户昵称（nickname）

	private String upwd;// 用户密码（userpassword）

	private String usex;// 用户性别（usersex）

	private String uphone;// 用户电话（userphone）

	private String uemail;// 用户邮箱（useremail）

	private Integer uintegral;// 用户积分（默认为-1）

	private Timestamp ubirthday;// 用户生日（或注册日期）

	
	private List<ClothesVO> clothesVo; //服装属性 wang--确认订单需要
	
	private List<ClothesDetailVO> clothesDetailVo;//服装详情wang--确认订单需要
	
	private List<CartVO> cartVo;//购物车属性wang--确认订单需要
	
	
	public List<ClothesDetailVO> getClothesDetailVo() {
		return clothesDetailVo;
	}

	public void setClothesDetailVo(List<ClothesDetailVO> clothesDetailVo) {
		this.clothesDetailVo = clothesDetailVo;
	}

	public List<CartVO> getCartVo() {
		return cartVo;
	}

	public void setCartVo(List<CartVO> cartVo) {
		this.cartVo = cartVo;
	}

	public void setUbirthday(Timestamp ubirthday) {
		this.ubirthday = ubirthday;
	}

	public List<ClothesVO> getClothesVo() {
		return clothesVo;
	}

	public void setClothesVo(List<ClothesVO> clothesVo) {
		this.clothesVo = clothesVo;
	}

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

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
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

	public Integer getUintegral() {
		return uintegral;
	}

	public void setUintegral(Integer uintegral) {
		this.uintegral = uintegral;
	}

	public Timestamp getUbirthday() {
		return ubirthday;
	}

	public void setUbirthday(Date date) {
		this.ubirthday = ubirthday;
	}


	
  
}
