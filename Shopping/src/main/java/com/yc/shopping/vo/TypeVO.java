package com.yc.shopping.vo;

/**
 * 类型详情表（typeClothesTable）
 * @author Administrator
 *
 */
public class TypeVO {

	
	private Integer typecloid;//类型详情编号编号
	
	private Integer typeid;//类型编号（外）
	
	private Integer clothesid;//服装编号（外）
	
	
	public Integer getTypecloid() {
		return typecloid;
	}
	public void setTypecloid(Integer typecloid) {
		this.typecloid = typecloid;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Integer getClothesid() {
		return clothesid;
	}
	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}
	
	
}
