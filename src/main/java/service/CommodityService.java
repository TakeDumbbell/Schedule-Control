package service;

import java.util.List;


import domain.Commodity;

public interface CommodityService {
	int addCommodity(Commodity commodity);
	int deleteCommodity(String id);
	int updateCommodity(String oldId,Commodity newCommodity);
	List<Commodity> queryCommodityByTitle(String title);
	List<Commodity> queryCommodityByType(String type);
	List<Commodity> queryAll();
	boolean isExistCommodityById(String id);
}
