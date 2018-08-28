package com.yc.shopping.biz.imp;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.dao.ClothesDao;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Service("ClothesImp")
public class ClothesImp implements ClothesInterface {
	
	@Resource(name="ClothesDao")
	private ClothesDao cDao;

	



	/**
	 * 服装展示 + 分页
	 * liu
	 */
	public List<ClothesDetailVO> findAll(Integer pages,Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		List<ClothesDetailVO> list=cDao.Select( offset, rows);
		return list;
	}

	/**
	 * 查询服装总数量count(*)
	 * liu
	 */
	@Override
	public long count(ClothesVO clothesVO) {
		return cDao.count(clothesVO);
	}
	
	//============================================================ 
	

}
