package com.yc.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Repository("ClothesDao")
public interface ClothesDao {

	/**
	 * 服装展示 + 分页
	 * 
	 * @param clothesVO
	 * @param pages
	 * @param rows
	 * @return liu
	 */
	List<ClothesDetailVO> Select(@Param("pages") Integer pages, @Param("rows") Integer rows);

	/**
	 * 查询服装总数量count(*)
	 * 
	 * @param clothesVO
	 * @return liu
	 */
	@Select("select count(*) cnt from clothesvo")
	long count(ClothesVO clothesVO);

	// ==================================================================================

	/**
	 * 查所有服装并分页 huang(后台服装查询)
	 * 
	 * @return
	 */
	@Select("select * from clothesvo limit #{startPage},#{pageSize}")
	List<ClothesVO> selectAllClothes(@Param("startPage") int startPage, @Param("pageSize") int pageSize);

	/**
	 * 查分页总数count
	 */
	@Select("select count(*) from clothesvo")
	int selectAllCount();

	/**
	 * 待条件查询服装并分页 huang(后台带条件服装查询)
	 * 
	 * @return
	 */
	@Select("select * from clothesvo where clothesname like concat('%',#{clothes.clothesname},'%') and "
			+ "clothesbrand like concat('%',#{clothes.clothesbrand},'%') and "
			+ "clothesbigtag like concat('%',#{clothes.clothesbigtag},'%') and "
			+ "clothestype like concat('%',#{clothes.clothestype},'%') limit #{startPage},#{pageSize}")
	List<ClothesVO> selectClothesByCondition(@Param("clothes") ClothesVO clothes, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);

	@Select("select count(*) from clothesvo where clothesname like concat('%',#{clothesname},'%') and "
			+ "clothesbrand like concat('%',#{clothesbrand},'%') and "
			+ "clothesbigtag like concat('%',#{clothesbigtag},'%') and "
			+ "clothestype like concat('%',#{clothestype},'%')")
	int selectCountByCondition(ClothesVO clothes);

	/**
	 * 修改服装信息 huang(后台) 通过服装id得到服装信息
	 * 
	 * @param clothesid
	 * @return
	 */
	@Select("select * from clothesvo where clothesid=#{clothesid}")
	ClothesVO modify(int clothesid);

	@Update("update clothesvo set aid =#{clothesid} and clothesname=#{clothes.clothesname} and clothestype=#{clothes.clothestype} "
			+ "and clothesbigtag=#{clothes.clothesbigtag} and clothesbrand=#{clothes.clothesbrand} and brandpic=#{clothes.brandpic} "
			+ "and clothesintroduce=#{clothes.clothesintroduce} and clothesorigprice=#{clothes.clothesorigprice} "
			+ "and clothesprice=#{clothes.clothesprice}")
	int modifyClothes(@Param("clothesid") int clothesid, @Param("clothes") ClothesVO clothes);
}
