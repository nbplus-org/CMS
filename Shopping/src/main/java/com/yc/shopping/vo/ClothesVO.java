package com.yc.shopping.vo;

import java.util.List;

/**
 * 服装表（clothesTable）
 * 
 * @author Administrator
 *
 */
public class ClothesVO {



	private Integer clothesid;// 服装编号

	private Integer aid;// 管理员编号----外键

	private String clothesname;// 服装名称

	private String clothestype;// 服装类型

	private String clothesbigtag;// 服装大标

	private String clothesbrand;// 服装品牌

	private String brandpic;// 品牌图片

	private String clothesintroduce;// 服装简介

	private Double clothesorigprice;// 服装原价

	private Double clothesprice;// 服装现价

	private String clothespicture; //服装图片
	
	private List<ClothesDetailVO> closthesDetailVo;//服装详情属性
	
	
	
	
	public List<ClothesDetailVO> getClosthesDetailVo() {
		return closthesDetailVo;
	}

	public void setClosthesDetailVo(List<ClothesDetailVO> closthesDetailVo) {
		this.closthesDetailVo = closthesDetailVo;
	}

	public Integer getClothesid() {
		return clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getClothesname() {
		return clothesname;
	}

	public void setClothesname(String clothesname) {
		this.clothesname = clothesname;
	}

	public String getClothestype() {
		return clothestype;
	}

	public void setClothestype(String clothestype) {
		this.clothestype = clothestype;
	}

	public String getClothesbigtag() {
		return clothesbigtag;
	}

	public void setClothesbigtag(String clothesbigtag) {
		this.clothesbigtag = clothesbigtag;
	}

	public String getClothesbrand() {
		return clothesbrand;
	}

	public void setClothesbrand(String clothesbrand) {
		this.clothesbrand = clothesbrand;
	}

	public String getBrandpic() {
		return brandpic;
	}

	public void setBrandpic(String brandpic) {
		this.brandpic = brandpic;
	}

	public String getClothesintroduce() {
		return clothesintroduce;
	}

	public void setClothesintroduce(String clothesintroduce) {
		this.clothesintroduce = clothesintroduce;
	}


	public Double getClothesorigprice() {
		return clothesorigprice;
	}

	public void setClothesorigprice(Double clothesorigprice) {
		this.clothesorigprice = clothesorigprice;
	}

	public Double getClothesprice() {
		return clothesprice;
	}

	public void setClothesprice(Double clothesprice) {
		this.clothesprice = clothesprice;
	}

	public String getClothespicture() {
		return clothespicture;
	}

	public void setClothespicture(String clothespicture) {
		this.clothespicture = clothespicture;
	}


	

	

}
