package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 报表接口
 * @author wang
 *
 */
public interface FormInterface {

	/**
	 * wang哪一年哪一月的种服装销售数量
	 * @return
	 */
	List<Map<String,Object>> findSaleClothesNum(String date);
	
	/**
	 * wang#库存剩余量折线图
	 * @return
	 */
    List<Map<String,Object>> findStockNum();
    
    /**
     * wang #每年度各个月的销售额统计柱状图
     * @return
     */
    List<Map<String,Object>> monthSale(String date);
	
}
