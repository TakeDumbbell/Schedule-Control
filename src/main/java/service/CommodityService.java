package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import domain.Commodity;

public interface CommodityService {
	int addCommodity(Commodity commodity);
	int addCommodity(Commodity commodity,MultipartFile[] file,MultipartFile brandFile);
	int deleteCommodity(String id);
	int updateCommodity(Commodity newCommodity,MultipartFile[] file,MultipartFile brandFile);
	Commodity queryById(String id);
	List<Commodity> queryCommodityByTitle(String title);
	List<Commodity> queryCommodityByType(String type);
	List<Commodity> queryAll();
	boolean isExistCommodityById(String id);
	List<Commodity> queryCommodityByTypeTitleTypeId(String title,String type,String typeId);
}
