package com.yc.shopping.vo;
/**
 * 订单详情表
 * 
 * @author wang
 *
 */
public class OrderDetailVO {

	private Integer orderdetailid;// 订单详情编号

	private Integer orderid;// 订单号

	private Integer clodetailid;// 服装详情编号

	private Integer num;// 数量
	
	private String reviewstatus;//评论状态
    
	private ClothesDetailVO clothesDetailVo;//服装详情属性
	
	
	
	
	
	public String getReviewstatus() {
		return reviewstatus;
	}

	public void setReviewstatus(String reviewstatus) {
		this.reviewstatus = reviewstatus;
	}

	public ClothesDetailVO getClothesDetailVo() {
		return clothesDetailVo;
	}

	public void setClothesDetailVo(ClothesDetailVO clothesDetailVo) {
		this.clothesDetailVo = clothesDetailVo;
	}

	public Integer getOrderdetailid() {
		return orderdetailid;
	}

	public void setOrderdetailid(Integer orderdetailid) {
		this.orderdetailid = orderdetailid;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getClodetailid() {
		return clodetailid;
	}

	public void setClodetailid(Integer clodetailid) {
		this.clodetailid = clodetailid;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

      
}
