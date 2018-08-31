package com.yc.shopping.biz.imp;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> findAll(Integer pages,Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		List<Map<String, Object>> list=cDao.Select( offset, rows);
		return list;
	}	

	/**
	 * 查询服装总数量count(*) liu
	 */
	@Override
	public long count(ClothesVO clothesVO) {
		return cDao.count(clothesVO);
	}

	//============================================================ 
	/**
	 * 查询服装标签
	 */
	@Override
	public List<ClothesVO> showClothesbigtag() {
		return cDao.showClothesbigtag();
	}
	/**
	 * 查询服装品牌
	 */
	@Override
	public List<ClothesVO> showClothesbrand() {
		return cDao.showClothesbrand();
	}
	/**
	 * 查询服装类型
	 */
	@Override
	public List<ClothesVO> showClothestype() {
		return cDao.showClothestype();
	}

	/**
	 *  根据价格   关联查询
	 */
	@Override
	public List<Map<String, Object>> searchByPrice(Double lower,Double higher,Integer pages,Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		List<Map<String, Object>> list=cDao.searchByPrice(lower,higher,offset, rows);
		return list;
	}

	/**
	 * 根据价格范围查询条数
	 */
	@Override
	public long countByPrice(Double lower, Double higher) {
		return cDao.countByPrice(lower, higher);
	}

	/**
	 * 根据颜色  关联查询
	 */
	@Override
	public List<Map<String, Object>> searchByColor(String clothescolour, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchByColor(clothescolour, offset, rows);
	}

	/**
	 * 根据颜色查询条数
	 */
	@Override
	public long countByColor(String clothescolour) {
		return cDao.countByColor(clothescolour);
	}

	/**
	 * 查询服装颜色
	 */
	@Override
	public List<ClothesDetailVO> findcolor() {
		return cDao.findcolor();
	}

	/**
	 * 根据标签  关联查询
	 */
	@Override
	public List<Map<String, Object>> searchByTag(String clothesbigtag, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchByTag(clothesbigtag, offset, rows);
	}

	/**
	 * 根据标签 查询条数
	 */
	@Override
	public long countByTag(String clothesbigtag) {
		return cDao.countByTag(clothesbigtag);
	}

	/**
	 * 查询服装标签
	 */
	@Override
	public List<ClothesVO> findtag() {
		return cDao.findtag();
	}

	/**
	 * 根据品牌  关联查询
	 */
	@Override
	public List<Map<String, Object>> searchBybrand(String clothesbrand, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchBybrand(clothesbrand, offset, rows);
	}

	/**
	 * 根据品牌 查询条数
	 */
	@Override
	public long countBybrand(String clothesbrand) {
		return cDao.countBybrand(clothesbrand);
	}

	/**
	 * 根据类型  关联查询
	 */
	@Override
	public List<Map<String, Object>> searchBytype(String clothestype, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchBytype(clothestype, offset, rows);
	}

	/**
	 * 根据类型   查询条数
	 */
	@Override
	public long countBytype(String clothestype) {
		return cDao.countBytype(clothestype);
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
