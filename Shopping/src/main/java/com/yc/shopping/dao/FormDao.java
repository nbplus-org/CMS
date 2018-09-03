package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

/**
 * 报表
 * @author wang
 *
 */
@Repository("FormDao")
public interface FormDao {
	/**
	 * wang哪一年哪一月的种服装销售数量
	 * @return
	 */
    @Select("SELECT SUM(num) value, c.clothesid name from"
    		+ " orderdetailvo a LEFT JOIN ordervo b ON a.orderid=b.orderid  LEFT JOIN"
    		+ " clothdetailvo c ON a.clodetailid=c.clodetailid  WHERE "
    		+ "  substr(ordertime,1,7)='2018-09' GROUP BY clothesid")
	List<Map<String,Object>> saleClothesNum();
	
	/**
	 * wang#库存剩余量折线图
	 * @return
	 */
    @Select("SELECT SUM(stocknum) value ,clothesid name FROM clothdetailvo GROUP BY clothesid")
    List<Map<String,Object>> StockNum();
    
    /**
     * wang #每年度各个月的销售额统计
     * @return
     */
    @Select("SELECT SUM(tranprice) value ,substr(ordertime,6,2) name from "
    		+ "(SELECT * from ordervo where substr(ordertime,1,4)='2018') f1 "
    		+ "group by substr(ordertime,6,2)")
    List<Map<String,Object>> monthSale();
    	

    
    
}
