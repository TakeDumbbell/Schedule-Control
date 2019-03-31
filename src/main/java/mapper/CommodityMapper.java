package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import domain.Commodity;

@Repository
public interface CommodityMapper {
	int addCommodity(Commodity commodity);
	int deleteCommodity(String id);
	int updateCommodity(@Param("oldId")String oldId,@Param("newCommodity")Commodity newCommodity);
	List<Commodity> queryCommodityByTitle(String title);
	List<Commodity> queryCommodityByType(String type);
	List<Commodity> queryAll();
	boolean isExistCommodityById(String id);
}
