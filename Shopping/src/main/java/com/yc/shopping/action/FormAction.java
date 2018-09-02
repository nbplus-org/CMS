package com.yc.shopping.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.yc.shopping.biz.FormInterface;
import com.yc.shopping.biz.OrderInterface;
/**
 * 报表控制
 * @author wang
 *
 */
@Controller
public class FormAction {
	
	@Resource(name = "FormImp")
	private FormInterface formImp;

}
