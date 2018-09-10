package com.yc.shopping.vo;

/**
 * 评论表（ReviewTable）
 * 
 * @author Administrator
 *
 */
public class ReviewVO {

	// 评论编号
	private Integer reviewid;

	// 服装编号------外
	private Integer clothesid;

	// 用户编号------外
	private Integer uid;

	// 匿名状态
	private String state;

	// 评论图片
	private String reviewpic;

	// 评论文字
	private String reviewstr;
    //评论星级
	private String reviewstar;
	
	
	public String getReviewstar() {
		return reviewstar;
	}

	public void setReviewstar(String reviewstar) {
		this.reviewstar = reviewstar;
	}

	public Integer getReviewid() {
		return reviewid;
	}

	public void setReviewid(Integer reviewid) {
		this.reviewid = reviewid;
	}

	public Integer getClothesid() {
		return clothesid;
	}

	public void setClothesid(Integer clothesid) {
		this.clothesid = clothesid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getReviewpic() {
		return reviewpic;
	}

	public void setReviewpic(String reviewpic) {
		this.reviewpic = reviewpic;
	}

	public String getReviewstr() {
		return reviewstr;
	}

	public void setReviewstr(String reviewstr) {
		this.reviewstr = reviewstr;
	}

}
