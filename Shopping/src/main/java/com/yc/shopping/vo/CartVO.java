package com.yc.shopping.vo;

public class CartVO {
	
	private Integer cartId;
	
	private Integer uId;
	
	/**
	 * 服装详情编号
	 */
	private Integer cloDetailId ;

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public Integer getCloDetailId() {
		return cloDetailId;
	}

	public void setCloDetailId(Integer cloDetailId) {
		this.cloDetailId = cloDetailId;
	}
	
	
	
}
