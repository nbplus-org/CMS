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
	
	
}
