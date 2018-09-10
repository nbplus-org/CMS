package com.yc.shopping.biz.imp;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.dao.ClothesDao;
import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.TypeVO;

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
	public List<TypeVO> showtypename() {
		return cDao.showtypename();
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
	public List<Map<String, Object>> searchBytype(String typename, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchBytype(typename, offset, rows);
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
	public List<Map<String,String>> selectAllClothes(int startPage,int pageSize) {
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
	public List<Map<String, String>> selectClothesByCondition(ClothesVO clothes, int startPage, int pageSize) {
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
	public List<Map<String, String>> modifyOfSelect(String clothesid) {
		return cDao.modifyOfSelect(clothesid);
	}

	@Override
	public int modifyClothes(ClothesVO clothes) {
		return cDao.modifyClothes(clothes);
	}

	/**
	 * 查询品牌图片
	 */
	@Override
	public List<ClothesVO> showbrandpic() {
		return cDao.showbrandpic();
	}

	/**
	 * 根据品牌图片   关联查询
	 */
	@Override
	public List<Map<String, Object>> searchBybrandpic(String brandpic, Integer pages, Integer rows) {
		//计算分页参数  偏移量
		int offset=(pages-1)*rows;
		return cDao.searchBybrandpic(brandpic, offset, rows);
	}

	/**
	 * 根据品牌图片查询数量
	 */
	@Override
	public long countBybrandpic(String brandpic) {
		return cDao.countBybrandpic(brandpic);
	}
	

	/**
	 * 新增服装表
	 */
	@Override
	public int insertToClothes(ClothesVO clothesVO) {
		return cDao.insertToClothes(clothesVO);
		
	}

	/**
	 * 根据类型名称查询TypeVO表已存在
	 */
	@Override
	public TypeVO selectBytype(String typename) {
		return cDao.selectBytype(typename);
	}

	/**
	 * 
	 * 新增typevo表
	 */
	@Override
	public int InsertToTypevo(TypeVO typeVO) {
		return cDao.InsertToTypevo(typeVO);
	}

	/**
	 * 新增typeclothesvo表
	 */
	@Override
	public int insertTotypeclothesvo(Integer typeid, Integer clothesid) {
		return cDao.insertTotypeclothesvo(typeid, clothesid);
	}

	/**
	 *  新增服装详情表
	 */
	@Override
	public int insertToClothdetail(ClothesDetailVO clothesDetailVO) {
		return cDao.insertToClothdetail(clothesDetailVO);
	}

	/**
	 * 服装表，服装详情表关联查询
	 */
	@Override
	public List<Map<String, Object>> selectClothesAndDetail(int clothesid,int pages, int rows) {
		return cDao.selectClothesAndDetail(clothesid,pages, rows);
	}

	/**
	 * 根据服装id 查询数量
	 */
	@Override
	public int selectCount(int clothesid) {
		return cDao.selectCount(clothesid);
	}

	/**
	 * 修改库存
	 */
	@Override
	public int updateStocknum(Integer stocknum,Integer clodetailid) {
		return cDao.updateStocknum(stocknum, clodetailid);
	}

	/**
	 * 根据服装名查询服装表是否与此数据
	 */
	@Override
	public ClothesVO selectByClothesName(String clothesname) {
		return cDao.selectByClothesName(clothesname);
	}

	/**
	 * 根据服装id 和服装颜色查询服装详情表 判断是否有此数据(前提是有尺码) 同名字不同  判断是否有不同颜色
	 */
	@Override
	public List<ClothesDetailVO> selectByclothescolour(String clothescolour,Integer clothesid) {
		return cDao.selectByclothescolour(clothescolour,clothesid);
	}

	/**
	 * 服装颜色确定  根据服装尺寸，服装id，服装颜色判断服装详情表是否有数据(前提有尺码)  同名字同颜色不同尺码
	 */
	@Override
	public ClothesDetailVO selectByclothessize(String clothessize,Integer clothesid,String clothescolour) {
		return cDao.selectByclothessize(clothessize,clothesid,clothescolour);
	}

	/**
	 * 同名字同颜色同尺码     加其库存
	 */
	@Override
	public int updatenum(Integer stocknum, Integer clothesid, String clothescolour, String clothessize) {
		return cDao.updatenum(stocknum, clothesid, clothescolour, clothessize);
	}

	@Override
	public int updatenumNotsize(Integer stocknum, Integer clothesid, String clothescolour) {
		return cDao.updatenumNotsize(stocknum, clothesid, clothescolour);
	}

	//=========================================
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查类型,大标签，品牌,名字
	 * @param model
	 * @param value
	 */
	@Override
	public List<Map<String, String>> clothesType(String value) {
		return cDao.clothesType(value);
	}

	@Override
	public List<Map<String, String>> clothesBigTag(String value) {
		return cDao.clothesBigTag(value);
	}

	@Override
	public List<Map<String, String>> clothesName(String value) {
		return cDao.clothesbrand(value);
	}

	@Override
	public List<Map<String, String>> clothesBrand(String value) {
		return cDao.clothesname(value);
	}

	/**
	 * 降序查找服装表
	 */
	@Override
	public List<ClothesVO> selectClothes(int startPage, int pageSize) {
		return cDao.selectClothes(startPage, pageSize);
	}

}
