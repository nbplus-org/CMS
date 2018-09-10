package com.yc.shopping.vo;

import java.util.Date;
import java.util.List;

/**
 * 订单表
 * 
 * @author wang
 *
 */

public class OrderVO {

	private Integer orderid;// 订单编号

	private Integer aid;// 管理员编号

	private Integer uid;// 用户编号
	
	private String uname;//用户账号

	private String uphone;//用户电话
	
	private String useraddress;// 用户地址

	private Date ordertime;// 订单时间

	private Date arrivaltime;// 到达时间
	
	private Double tranprice;//订单价格
	
	private String ordernotes;// 订单备注

	private String orderstatus;// 订单状态

	private List<OrderDetailVO> orderDetailVo;//订单详情属性
	
	private List<ClothesDetailVO> clothesDetailVo;//服装详情属性
	
	
	public List<OrderDetailVO> getOrderDetailVo() {
		return orderDetailVo;
	}

	public void setOrderDetailVo(List<OrderDetailVO> orderDetailVo) {
		this.orderDetailVo = orderDetailVo;
	}

	public List<ClothesDetailVO> getClothesDetailVo() {
		return clothesDetailVo;
	}

	public void setClothesDetailVo(List<ClothesDetailVO> clothesDetailVo) {
		this.clothesDetailVo = clothesDetailVo;
	}

	public Double getTranprice() {
		return tranprice;
	}

	public void setTranprice(Double tranprice) {
		this.tranprice = tranprice;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

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

	

	public String getOrdernotes() {
		return ordernotes;
	}

	public void setOrdernotes(String ordernotes) {
		this.ordernotes = ordernotes;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}


}
