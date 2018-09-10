package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
    @Select("SELECT SUM(num) value, c.clothesid  name from  salevo e  "
    		+ "LEFT JOIN   orderdetailvo a  ON a.orderid=e.orderid "
    		+ "LEFT JOIN ordervo b ON a.orderid=b.orderid "
    		+ "LEFT JOIN clothdetailvo c ON a.clodetailid=c.clodetailid "
    		+ "WHERE   substr(ordertime,1,7)=#{date} "
    		+ "GROUP BY c.clothesid")
	List<Map<String,Object>> saleClothesNum(String date);
	
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
    @Select("SELECT SUM(tranprice) value ,substr(ordertime,6,2) name from("
    		+ "SELECT tranprice,ordertime from  salevo a "
    		+ "LEFT JOIN ordervo b ON a.orderid=b.orderid where substr(ordertime,1,4)=#{date}) f1 "
    		+ "group by substr(ordertime,6,2)")
    List<Map<String,Object>> monthSale(String date);
    	

    
    
}
