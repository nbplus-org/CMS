package com.yc.shopping.vo;

/**
 * 
 * @author Computer-huangbiao
 *
 */
public class CartVO {
	
	private Integer cartid;
	
	private Integer uid;
	
	/**
	 * 服装详情编号
	 */
	private Integer clodetailid ;

	public Integer getCartid() {
		return cartid;
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

	
	
}
