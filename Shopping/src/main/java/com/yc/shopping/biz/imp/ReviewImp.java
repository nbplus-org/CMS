package com.yc.shopping.biz.imp;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yc.shopping.biz.ReviewInterface;
import com.yc.shopping.dao.ReviewDao;
import com.yc.shopping.vo.ReviewVO;


@Service("ReviewImp")
public class ReviewImp implements ReviewInterface {
	
	@Resource(name="ReviewDao")
	private ReviewDao rDao;


	/**
	 * 通过服装编号   获取评论表中的匿名 评论  图片
	 * 
	 * liu
	 */
	@Override
	public List<ReviewVO> selectById(Integer clothesid) {
		return rDao.selectById(clothesid);
	}

    


}
