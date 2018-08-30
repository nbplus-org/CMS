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

	@Resource(name = "ClothesDao")
	private ClothesDao cDao;

	/**
	 * 服装展示 + 分页 liu
	 */
	public List<ClothesDetailVO> findAll(Integer pages, Integer rows) {
		// 计算分页参数 偏移量
		int offset = (pages - 1) * rows;
		List<ClothesDetailVO> list = cDao.Select(offset, rows);
		return list;
	}

	/**
	 * 查询服装总数量count(*) liu
	 */
	@Override
	public long count(ClothesVO clothesVO) {
		return cDao.count(clothesVO);
	}

	// ============================================================

	/**
	 * 查所有服装 huang(后台服装查询)
	 * 
	 * @return
	 */
	@Override
	public List<ClothesVO> selectAllClothes(int startPage,int pageSize) {
		return cDao.selectAllClothes(startPage, pageSize);
	}
	/**
	 * 查分页总数count
	 */
	@Override
	public int selectAllCount() {
		return cDao.selectAllCount();
	}

	@Override
	public List<ClothesVO> selectClothesByCondition(ClothesVO clothes, int startPage, int pageSize) {
		return cDao.selectClothesByCondition(clothes, startPage, pageSize);
	}
	
	public int selectCountByCondition(ClothesVO clothes){
		return cDao.selectCountByCondition(clothes);
	}
	
	/**
	 * 修改服装信息 huang(后台)
	 * 通过服装id得到服装信息
	 * @param clothesid
	 * @return
	 */
	@Override
	public ClothesVO modify(int clothesid) {
		return cDao.modify(clothesid);
	}
	
}
