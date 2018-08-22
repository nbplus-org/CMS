package com.yc.shopping.vo;
/**
 * 
 * @author wang
 *
 */
public class ClothesDetailVO {
     private Integer clothesid;//服装编号
     
     private Integer clothesdetailid;//服装详情编号
     
     private String clothescolour;//服装颜色
     
     private String clothessize;//服装尺码
     
     private Integer stocknum;//库存数量
     
     private String  clothespic;//服装图片

	public Integer getClothesid() {
		return clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public Integer getClothesdetailid() {
		return clothesdetailid;
	}

	public void setClothesdetailid(Integer clothesdetailid) {
		this.clothesdetailid = clothesdetailid;
	}

	public String getClothescolour() {
		return clothescolour;
	}

	public void setClothescolour(String clothescolour) {
		this.clothescolour = clothescolour;
	}

	public String getClothessize() {
		return clothessize;
	}

	public void setClothessize(String clothessize) {
		this.clothessize = clothessize;
	}

	public Integer getStocknum() {
		return stocknum;
	}

	public void setStocknum(Integer stocknum) {
		this.stocknum = stocknum;
	}

	public String getClothespic() {
		return clothespic;
	}

	public void setClothespic(String clothespic) {
		this.clothespic = clothespic;
	}
     
	
     
}
