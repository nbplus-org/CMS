package com.yc.shopping.vo;

import java.util.Date;

/**
 * 订单表
 * @author wang
 *
 */

public class OrderVO {

	private Integer orderid;//订单编号
	
	private Integer aid;//管理员编号
	
	private Integer uid;//用户编号
	
	private String useraddress;//用户地址
	
	private Date ordertime;//订单时间
	
	private Date arrivaltime;//到达时间
	
	private Integer ordernotes;//订单备注
	
	private String orderstatus;//订单状态

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Date getArrivaltime() {
		return arrivaltime;
	}

	public void setArrivaltime(Date arrivaltime) {
		this.arrivaltime = arrivaltime;
	}

	public Integer getOrdernotes() {
		return ordernotes;
	}

	public void setOrdernotes(Integer ordernotes) {
		this.ordernotes = ordernotes;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}

	
	
	
	
	
	
}
