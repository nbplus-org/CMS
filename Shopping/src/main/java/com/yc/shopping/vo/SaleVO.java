package com.yc.shopping.vo;

import java.sql.Timestamp;
/**
 * 销售表（sale）
 * @author Administrator
 *
 */
public class SaleVO {

	//销售编号
	private Integer saleId;
	//服装编号-----外
	private Integer clothesId;
	//服装详情编号-----外
	private Integer cloDetailId;
	//销售时间
	private Timestamp saleDate;
	//销售数量
	private Integer saleNum;
	//销售金额
	private Integer salePrice;
	public Integer getSaleId() {
		return saleId;
	}
	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}
	public Integer getClothesId() {
		return clothesId;
	}
	public void setClothesId(Integer clothesId) {
		this.clothesId = clothesId;
	}
	public Integer getCloDetailId() {
		return cloDetailId;
	}
	public void setCloDetailId(Integer cloDetailId) {
		this.cloDetailId = cloDetailId;
	}
	public Timestamp getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Timestamp saleDate) {
		this.saleDate = saleDate;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	public Integer getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}
	
	
}
