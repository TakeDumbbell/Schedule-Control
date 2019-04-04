package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import domain.Commodity;

@Repository
public interface CommodityMapper {
	int addCommodity(Commodity commodity);
	int deleteCommodity(String id);
	int updateCommodity(@Param("newCommodity")Commodity newCommodity);
	Commodity queryById(String id);
	List<Commodity> queryCommodityByTitle(String title);
	List<Commodity> queryCommodityByType(String type);
	List<Commodity> queryAll();
	List<Commodity> queryCommodityByTypeTitleTypeId(@Param("title")String title,@Param("type")String type,@Param("typeId")String typeId);
	boolean isExistCommodityById(String id);
}
