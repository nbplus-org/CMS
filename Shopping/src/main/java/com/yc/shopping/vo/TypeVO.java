package com.yc.shopping.vo;

/**
 * 服装类型表
 * 
 * @author wang
 *
 */
public class TypeVO {

	private Integer typeid;// 类型编号

	private String typename;// 类型名称

	private Integer typenum;// 类型数量

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public Integer getTypenum() {
		return typenum;
	}

	public void setTypenum(Integer typenum) {
		this.typenum = typenum;
	}

}
