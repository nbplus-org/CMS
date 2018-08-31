package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;

@Repository("ClothesDao")
public interface ClothesDao {

	/**
	 * 服装展示 + 分页
	 * @param clothesVO
	 * @param pages
	 * @param rows
	 * @return
	 * liu
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid  GROUP BY clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> Select(@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 查询服装总数量count(*)
	 * @param clothesVO
	 * @return
	 * liu
	 */
	@Select("select count(*) cnt from clothesvo")
    long count(ClothesVO clothesVO);
	
	//==================================================================================
	/**
	 * 查询服装标签
	 * @return
	 */
	@Select("select distinct clothesbigtag from clothesvo")
	List<ClothesVO> showClothesbigtag();
	/**
	 * 查询服装品牌
	 * @return
	 */
	@Select("select distinct clothesbrand from clothesvo")
	List<ClothesVO> showClothesbrand();
	
	/**
	 * 查询服装类型
	 * @return
	 */
	@Select("select distinct clothestype from clothesvo")
	List<ClothesVO> showClothestype();
	
	/**
	 * 根据价格   关联查询
	 * @param lower
	 * @param higher
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothesprice between #{lower} and #{higher} GROUP BY clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchByPrice(@Param("lower")Double lower,@Param("higher")Double higher,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据价格范围查询条数
	 * @param lower
	 * @param higher
	 * @return
	 */
	@Select("select count(*) from clothesvo where clothesprice between #{lower} and #{higher} ")
	long countByPrice(@Param("lower")Double lower,@Param("higher")Double higher);
		
	/**
	 * 根据颜色  关联查询
	 * @param clothescolour
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothescolour=#{clothescolour} order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchByColor(@Param("clothescolour")String clothescolour,@Param("pages")Integer pages,@Param("rows")Integer rows);
    
	/**
	 * 根据颜色查询条数
	 * @param clothescolour
	 * @return
	 */
	@Select("select count(*) from clothdetailvo where clothescolour=#{clothescolour}")
	long countByColor(String clothescolour);
	
	/**
	 * 查询服装颜色
	 * @return
	 */
	@Select("select DISTINCT clothescolour from clothdetailvo")
	List<ClothesDetailVO> findcolor();
	
	/**
	 * 查询服装标签
	 * @return
	 */
	@Select("select DISTINCT clothesbigtag from clothesvo ")
	List<ClothesVO> findtag();
	
	
	/**
	 * 根据标签  关联查询
	 * @param clothesbigtag
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select *from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothesbigtag=#{clothesbigtag} GROUP BY clothesname order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchByTag(@Param("clothesbigtag")String clothesbigtag,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据标签 查询条数
	 * @param clothesbigtag
	 * @return
	 */
	@Select("select count(*) from clothesvo where clothesbigtag=#{clothesbigtag}")
	long countByTag(String clothesbigtag);
	
	/**
	 * 根据品牌  关联查询
	 * @param clothesbrand
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothesbrand=#{clothesbrand}  GROUP BY clothesname order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchBybrand(@Param("clothesbrand")String clothesbrand,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据品牌 查询条数
	 * @param clothesbrand
	 * @return
	 */
	@Select("select count(*) from clothesvo where clothesbrand=#{clothesbrand}")
	long countBybrand(String clothesbrand);
	
	/**
	 * 根据类型  关联查询
	 * @param clothestype
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothestype=#{clothestype} GROUP BY clothesname order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchBytype(@Param("clothestype")String clothestype,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据类型   查询条数
	 * @param clothestype
	 * @return
	 */
	@Select("select count(*) from clothesvo where clothestype=#{clothestype}")
	long countBytype(String clothestype);
}
