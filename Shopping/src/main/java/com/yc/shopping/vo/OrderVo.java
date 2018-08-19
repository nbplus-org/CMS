package com.yc.shopping.vo;

import java.util.Date;

/**
 * 订单表
 * @author wang
 *
 */
public class OrderVo {

	private Integer orderId;//订单编号
	private Integer aId;//管理员编号
	private Integer uId;//用户编号
	private String userAddress;//用户地址
	private Date orderTime;//订单时间
	private Date arrivalTime;//到达时间
	private Integer orderNotes;//订单备注
	private String orderStatus;//订单状态
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Date getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public Integer getOrderNotes() {
		return orderNotes;
	}
	public void setOrderNotes(Integer orderNotes) {
		this.orderNotes = orderNotes;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	
	
	
	
	
	
	
}
