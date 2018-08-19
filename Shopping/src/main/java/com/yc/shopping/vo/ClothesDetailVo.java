package com.yc.shopping.vo;
/**
 * 
 * @author wang
 *
 */
public class ClothesDetailVo {
     private Integer clothesId;//服装编号
     private Integer clothesDetailId;//服装详情编号
     private String clothesColour;//服装颜色
     private String clothesSize;//服装尺码
     private Integer stockNum;//库存数量
     private String  clothesPic;//服装图片
	public Integer getClothesId() {
		return clothesId;
	}
	public void setClothesId(Integer clothesId) {
		this.clothesId = clothesId;
	}
	public Integer getClothesDetailId() {
		return clothesDetailId;
	}
	public void setClothesDetailId(Integer clothesDetailId) {
		this.clothesDetailId = clothesDetailId;
	}
	public String getClothesColour() {
		return clothesColour;
	}
	public void setClothesColour(String clothesColour) {
		this.clothesColour = clothesColour;
	}
	public String getClothesSize() {
		return clothesSize;
	}
	public void setClothesSize(String clothesSize) {
		this.clothesSize = clothesSize;
	}
	public Integer getStockNum() {
		return stockNum;
	}
	public void setStockNum(Integer stockNum) {
		this.stockNum = stockNum;
	}
	public String getClothesPic() {
		return clothesPic;
	}
	public void setClothesPic(String clothesPic) {
		this.clothesPic = clothesPic;
	}
     
     
     
}
