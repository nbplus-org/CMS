package com.yc.shopping.vo;

/**
 * 购物车表（CartTable）
 * 
 * @author Administrator
 *
 */
public class CartVO {

	private Integer cartid;// 购物车编号

	private Integer uid;// 用户编号----------外键

	private Integer clodetailid;// 服装详情编号-------外键

	private Integer cnum;//数量
	
	public Integer getCartid() {
		return cartid;
	}

	public Integer getCnum() {
		return cnum;
	}

	public void setCnum(Integer cnum) {
		this.cnum = cnum;
	}

	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getClodetailid() {
		return clodetailid;
	}

	public void setClodetailid(Integer clodetailid) {
		this.clodetailid = clodetailid;
	}

	@Override
	public String toString() {
		return "CartVO [cartid=" + cartid + ", uid=" + uid + ", clodetailid=" + clodetailid + ", cnum=" + cnum + "]"+"\n";
	}
	
}
