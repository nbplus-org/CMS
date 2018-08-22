package com.yc.shopping.vo;
/**
 * 订单详情表
 * @author wang
 *
 */
public class OrderDetailVO {
      private Integer orderdetailid;//订单详情编号
      
      private Integer orderid;//订单号
      
      private Integer clodetailid;//服装详情编号
      
      private Integer tranpprice;//交易单价
      
      private Integer num;//数量

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

	public Integer getTranpprice() {
		return tranpprice;
	}

	public void setTranpprice(Integer tranpprice) {
		this.tranpprice = tranpprice;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
      
      
	
}
