package com.yc.shopping.vo;
/**
 * 订单详情表
 * @author wang
 *
 */
public class OrderDetailVo {
      private Integer orderDetailId;//订单详情编号
      private Integer orderId;//订单号
      private Integer cloDetailId;//服装详情编号
      private Integer tranpPrice;//交易单价
      private Integer num;//数量
	public Integer getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getCloDetailId() {
		return cloDetailId;
	}
	public void setCloDetailId(Integer cloDetailId) {
		this.cloDetailId = cloDetailId;
	}
	public Integer getTranpPrice() {
		return tranpPrice;
	}
	public void setTranpPrice(Integer tranpPrice) {
		this.tranpPrice = tranpPrice;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
    
      
}
