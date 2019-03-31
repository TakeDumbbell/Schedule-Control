package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import domain.Commodity;
import mapper.CommodityMapper;
import service.CommodityService;
@Service
public class CommodityServiceImpl implements CommodityService{
	@Autowired
	private CommodityMapper commodityMapper;
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int addCommodity(Commodity commodity) {
		String id=commodity.getId();
		if(id!=null&&!"".equals(id)&&!commodityMapper.isExistCommodityById(id)) {
			int i=commodityMapper.addCommodity(commodity);
			return i;
		}
		return 0;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int deleteCommodity(String id) {
		if(id!=null&&!"".equals(id)&&commodityMapper.isExistCommodityById(id)) {
			int i = commodityMapper.deleteCommodity(id);
			return i;
		}
		return 0;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int updateCommodity(String oldId, Commodity newCommodity) {
		if(oldId!=null&&!"".equals(oldId)&&commodityMapper.isExistCommodityById(oldId)) {
			int i = commodityMapper.updateCommodity(oldId, newCommodity);
			return i;
		}
		return 0;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<Commodity> queryCommodityByTitle(String title) {
		return commodityMapper.queryCommodityByTitle(title);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<Commodity> queryCommodityByType(String type) {
		return commodityMapper.queryCommodityByType(type);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<Commodity> queryAll() {
		return commodityMapper.queryAll();
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public boolean isExistCommodityById(String id) {
		if(id!=null&&!"".equals(id)) {
			return commodityMapper.isExistCommodityById(id);
		}
		return false;
	}
}
