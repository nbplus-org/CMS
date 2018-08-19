package com.yc.shopping.vo;

/**
 * 评论表（ReviewTable）
 * @author Administrator
 *
 */
public class ReviewVO {

	//评论编号
	private Integer reviewId;
	//服装编号------外
	private Integer clothesId;
	//用户编号------外
	private Integer uId;
	//匿名状态
	private String state;
	//评论图片
	private String reviewPic;
	//评论文字
	private String reviewStr;
	public Integer getReviewId() {
		return reviewId;
	}
	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}
	public Integer getClothesId() {
		return clothesId;
	}
	public void setClothesId(Integer clothesId) {
		this.clothesId = clothesId;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReviewPic() {
		return reviewPic;
	}
	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}
	public String getReviewStr() {
		return reviewStr;
	}
	public void setReviewStr(String reviewStr) {
		this.reviewStr = reviewStr;
	}
	

	
	
}
