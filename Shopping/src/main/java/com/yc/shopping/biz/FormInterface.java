package com.yc.shopping.biz;

import java.util.List;
import java.util.Map;

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
	List<Map<String,Object>> findSaleClothesNum();
	
	
}
