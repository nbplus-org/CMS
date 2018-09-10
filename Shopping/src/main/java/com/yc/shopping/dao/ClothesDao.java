package com.yc.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.shopping.vo.ClothesDetailVO;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.TypeVO;

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
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid  GROUP BY clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> Select(@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 查询服装总数量count(*)
	 * 
	 * @param clothesVO
	 * @return liu
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
	@Select("select distinct typename from typevo")
	List<TypeVO> showtypename();
	
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
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND clothestype like concat('%',#{typename},'%') GROUP BY clothesname order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchBytype(@Param("typename")String typename,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据类型   查询条数
	 * @param clothestype
	 * @return
	 */
	@Select("select count(*) from clothesvo where clothestype like concat('%',#{typename},'%')")
	long countBytype(String typename);

	// ==================================================================================

	/**
	 * 查所有服装并分页 huang(后台服装查询)
	 * 
	 * @return
	 */
	@Select("select * from clothesvo c,clothdetailvo cd where c.clothesid=cd.clothesid group by c.clothesid limit #{startPage},#{pageSize}")
	List<Map<String,String>> selectAllClothes(@Param("startPage") int startPage, @Param("pageSize") int pageSize);

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
	@Select("select * from clothesvo c,clothdetailvo cd where c.clothesname like concat('%',#{clothes.clothesname},'%') and "
			+ "c.clothesbrand like concat('%',#{clothes.clothesbrand},'%') and "
			+ "c.clothesbigtag like concat('%',#{clothes.clothesbigtag},'%') and "
			+ "c.clothestype like concat('%',#{clothes.clothestype},'%') and c.clothesid= cd.clothesid group by c.clothesid limit #{startPage},#{pageSize}")
	List<Map<String, String>> selectClothesByCondition(@Param("clothes") ClothesVO clothes, @Param("startPage") int startPage,
			@Param("pageSize") int pageSize);

	@Select("select count(*) from clothesvo where clothesname like concat('%',#{clothesname},'%') and "
			+ "clothesbrand like concat('%',#{clothesbrand},'%') and "
			+ "clothesbigtag like concat('%',#{clothesbigtag},'%') and "
			+ "clothestype like concat('%',#{clothestype},'%')")
	int selectCountByCondition(ClothesVO clothes);

	/**
	 * 修改服装之查询服装信息 huang(后台) 通过服装id得到服装信息
	 * 
	 * @param clothesid
	 * @return
	 */
	@Select("select * from clothesvo c,clothdetailvo cd where c.clothesid=cd.clothesid and c.clothesid=#{clothesid} group by c.clothesid")
	 List<Map<String,String>> modifyOfSelect(String clothesid);

	/**
	 * 修改服装信息之 修改服装信息s
	 * @param clothesid
	 * @param clothes
	 * @return
	 */
	@Update("update clothesvo set aid =#{aid} , clothesname=#{clothesname} , clothestype=#{clothestype} "
			+ ", clothesbigtag=#{clothesbigtag} , clothesbrand=#{clothesbrand} , clothespicture=#{clothespicture} "
			+ ", clothesintroduce=#{clothesintroduce} , clothesorigprice=#{clothesorigprice} "
			+ ", clothesprice=#{clothesprice} where clothesid=#{clothesid}")
	int modifyClothes(ClothesVO clothes);
	
	/**
	 * 查询品牌图片
	 * @return
	 */
	@Select("select distinct brandpic from clothesvo")
	List<ClothesVO> showbrandpic();
	
	/**
	 * 根据品牌图片   关联查询
	 * @param brandpic
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select DISTINCT * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid AND brandpic=#{brandpic} GROUP BY clothesname order by clothesname LIMIT #{pages},#{rows}")
	List<Map<String, Object>> searchBybrandpic(@Param("brandpic")String brandpic,@Param("pages")Integer pages,@Param("rows")Integer rows);
	
	/**
	 * 根据品牌图片查询数量
	 * @param brandpic
	 * @return
	 */
	@Select("select count(*) from clothesvo where brandpic=#{brandpic}")
	long countBybrandpic(String brandpic);
	

	
	/**
	 * 新增服装表
	 * @param clothesVO
	 * @return
	 */
	@Insert("insert into clothesvo(aid,clothesname,clothestype,clothesbigtag,clothesbrand,brandpic,clothesintroduce,clothesorigprice,clothesprice,clothespicture)"
			+ "values(#{aid},#{clothesname},#{clothestype},#{clothesbigtag},#{clothesbrand},#{brandpic},#{clothesintroduce},#{clothesorigprice},#{clothesprice},#{clothespicture})")
	@Options(useGeneratedKeys = true, keyColumn = "clothesid", keyProperty = "clothesid")
	int insertToClothes(ClothesVO clothesVO);
	/**
	 * 根据类型名称查询TypeVO表已存在
	 * @param typename
	 * @return
	 */
	@Select("select * from typevo where typename=#{typename}")
	TypeVO selectBytype(String typename);
	/**
	 * 新增typevo表
	 * @param typeVO
	 * @return
	 */
	@Insert("insert into typevo(typename) values(#{typename})")
	int InsertToTypevo(TypeVO typeVO);
	
	
	/**
	 * 新增typeclothesvo表
	 * @param typeid
	 * @param clothesid
	 * @return
	 */
	@Insert("insert into typeclothesvo(typeid,clothesid) values(#{typeid},#{clothesid})")
	int insertTotypeclothesvo(@Param("typeid")Integer typeid,@Param("clothesid")Integer clothesid);
	
	/**
	 * 新增服装详情表
	 * @param clothesDetailVO
	 * @return
	 */
	@Insert("insert into clothdetailvo(clothesid,clothescolour,clothessize,stocknum,clothespic)"
			+ "values(#{clothesid},#{clothescolour},#{clothessize},#{stocknum},#{clothespic})")
	@Options(useGeneratedKeys = true, keyColumn = "clodetailid", keyProperty = "clodetailid")
	int insertToClothdetail(ClothesDetailVO clothesDetailVO);
	/**
	 * 服装表，服装详情表关联查询
	 * @param clothesid
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("select * from clothesvo a,clothdetailvo b where a.clothesid=b.clothesid and a.clothesid=#{clothesid} LIMIT #{pages},#{rows}")
	List<Map<String, Object>> selectClothesAndDetail(@Param("clothesid") int clothesid,@Param("pages") int pages,@Param("rows") int rows);
	
	/**
	 * 根据服装id 查询数量
	 * @param clothesid
	 * @return
	 */
	@Select("select count(*) from clothdetailvo where clothesid=#{clothesid}")
	int selectCount(int clothesid);
	
	/**
	 * 修改库存
	 * @param stocknum
	 * @param clodetailid
	 * @return
	 */
	@Update("update clothdetailvo set stocknum=stocknum+#{stocknum} where clodetailid=#{clodetailid}")
	int updateStocknum(@Param("stocknum") Integer stocknum,@Param("clodetailid") Integer clodetailid);
	
	//========================================
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查类型
	 * @param model
	 * @param value
	 */
	@Select("select DISTINCT * from clothesvo c,clothdetailvo ct, typevo t,typeclothesvo tc where c.clothesid=tc.clothesid "
			+ "and t.typeid=tc.typeid and c.clothesid=ct.clothesid and t.typename like CONCAT('%',#{value},'%') GROUP BY clothesname ")
	List<Map<String,String>> clothesType(String value);
	
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查大标签
	 * @param model
	 * @param value
	 */
	@Select("select * from clothesvo c,clothdetailvo ct where clothesbigtag like CONCAT('%',#{value},'%') and c.clothesid=ct.clothesid GROUP BY clothesname  ")
	List<Map<String,String>> clothesBigTag(String value);
	
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查品牌
	 * @param model
	 * @param value
	 */
	@Select("select * from clothesvo c,clothdetailvo ct where clothesbrand like CONCAT('%',#{value},'%') and c.clothesid=ct.clothesid GROUP BY clothesname")
	List<Map<String,String>> clothesbrand(String value);
	
	/**
	 * index.jsp查询按钮,模糊查询  huang
	 * 查服装名称
	 * @param model
	 * @param value
	 */
	@Select("select * from clothesvo c,clothdetailvo ct where clothesname like CONCAT('%',#{value},'%') and c.clothesid=ct.clothesid GROUP BY clothesname")
	List<Map<String,String>> clothesname(String value);
	/**
	 * 根据服装名查询服装表是否与此数据
	 * @param clothesname
	 * @return
	 */
	@Select("select * from clothesvo where clothesname=#{clothesname}")
	ClothesVO selectByClothesName(String clothesname);
	/**
	 * 根据服装id 和服装颜色查询服装详情表 判断是否有此数据(前提是有尺码) 同名字不同  判断是否有不同颜色
	 * @param clothescolour
	 * @param clothesid
	 * @return
	 */
	@Select("select * from clothdetailvo where clothescolour=#{clothescolour} and clothesid=#{clothesid}")
	List<ClothesDetailVO> selectByclothescolour(@Param("clothescolour") String clothescolour,@Param("clothesid") Integer clothesid);
	/**
	 * 服装颜色确定  根据服装尺寸，服装id，服装颜色判断服装详情表是否有数据(前提有尺码)  同名字同颜色不同尺码
	 * @param clothessize
	 * @param clothesid
	 * @param clothescolour
	 * @return
	 */
	@Select("select * from clothdetailvo where clothessize=#{clothessize} and clothesid=#{clothesid} and clothescolour=#{clothescolour}")
	ClothesDetailVO selectByclothessize(@Param("clothessize") String clothessize,@Param("clothesid") Integer clothesid,@Param("clothescolour") String clothescolour);
	/**
	 * 同名字同颜色同尺码     加其库存
	 * @param stocknum
	 * @param clothesid
	 * @param clothescolour
	 * @param clothessize
	 * @return
	 */
	@Update("update clothdetailvo set stocknum=stocknum+#{stocknum} where clothesid=#{clothesid} and clothescolour=#{clothescolour} and clothessize=#{clothessize}")
	int updatenum(@Param("stocknum") Integer stocknum,@Param("clothesid") Integer clothesid,@Param("clothescolour") String clothescolour,@Param("clothessize") String clothessize);
   
	/**
	 * 没有尺码的情况下   同名同颜色   加其库存
	 * @param clothessize
	 * @param clothesid
	 * @return
	 */
	@Update("update clothdetailvo set stocknum=stocknum+#{stocknum} where clothesid=#{clothesid} and clothescolour=#{clothescolour}")
    int updatenumNotsize(@Param("stocknum") Integer stocknum,@Param("clothesid") Integer clothesid,@Param("clothescolour") String clothescolour);

    /**
     * 降序查找服装表
     * @param startPage
     * @param pageSize
     * @return
     */
	@Select("select * from clothesvo limit #{startPage},#{pageSize}")

	List<ClothesVO> selectClothes(@Param("startPage") int startPage, @Param("pageSize") int pageSize);
}
