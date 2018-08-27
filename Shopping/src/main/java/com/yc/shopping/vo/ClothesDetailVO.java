package com.yc.shopping.vo;

import java.util.List;

/**
 * 
 *@author wang
 */
public class ClothesDetailVO {

	private Integer clothesid;// 服装编号

	private Integer clodetailid;// 服装详情编号

	private String clothescolour;// 服装颜色

	private String clothessize;// 服装尺码

	private Integer stocknum;// 库存数量

	private String clothespic;// 服装图片

    private ClothesVO clothesVo;//对应的服装属性
	

    
    
	public ClothesVO getClothesVo() {
		return clothesVo;
	}

	public void setClothesVo(ClothesVO clothesVo) {
		this.clothesVo = clothesVo;
	}

	public Integer getClothesid() {
		return clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
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

	public Integer getClodetailid() {
		return clodetailid;
	}

	public void setClodetailid(Integer clodetailid) {
		this.clodetailid = clodetailid;
	}


	
	
	
	
	
}
