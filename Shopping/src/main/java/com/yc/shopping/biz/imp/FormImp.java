package com.yc.shopping.biz.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.FormInterface;
import com.yc.shopping.dao.FormDao;

/**
 * 报表实现
 * @author wang
 *
 */
@Service("FormImp")
public class FormImp implements FormInterface{
	
	@Resource(name="FormDao")
	FormDao formdao;
	/**
	 * wang哪一年哪一月的种服装销售数量
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findSaleClothesNum() {
		return formdao.saleClothesNum();
	}

}
