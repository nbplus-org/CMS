package com.yc.shopping.vo;

import java.sql.Timestamp;

/**
 * 销售表（sale）
 * 
 * @author Administrator
 *
 */
public class SaleVO {

	// 销售编号
	private Integer saleid;

	// 服装编号-----外
	private Integer clothesid;

	// 服装详情编号-----外
	private Integer clodetailid;

	// 销售时间
	private Timestamp saledate;

	// 销售数量
	private Integer salenum;

	// 销售金额
	private Double saleprice;

	public Integer getSaleid() {
		return saleid;
	}

	public void setSaleid(Integer saleid) {
		this.saleid = saleid;
	}

	public Integer getClothesid() {
		return clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public Integer getClodetailid() {
		return clodetailid;
	}

	public void setClodetailid(Integer clodetailid) {
		this.clodetailid = clodetailid;
	}

	public Timestamp getSaledate() {
		return saledate;
	}

	public void setSaledate(Timestamp saledate) {
		this.saledate = saledate;
	}

	public Integer getSalenum() {
		return salenum;
	}

	public void setSalenum(Integer salenum) {
		this.salenum = salenum;
	}

	public Double getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(Double saleprice) {
		this.saleprice = saleprice;
	}

	
}
