package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import domain.Commodity;
import mapper.CommodityMapper;
import service.CommodityService;
import util.Constants;
@Service
public class CommodityServiceImpl implements CommodityService{
	@Autowired
	private CommodityMapper commodityMapper;
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int addCommodity(Commodity commodity) {
		String id=commodity.getId();
	//	if(id!=null&&!"".equals(id)&&!commodityMapper.isExistCommodityById(id)) {
			int i=commodityMapper.addCommodity(commodity);
			return i;
	//	}
	//	return 0;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int deleteCommodity(String id) {
		if(id!=null&&!"".equals(id)&&commodityMapper.isExistCommodityById(id)) {
			Commodity commodity=commodityMapper.queryById(id);
			String brandImg=commodity.getBrandImg();
			String[] paths=commodity.getImgPath().split(";");
			int i = commodityMapper.deleteCommodity(id);
			if(i>0) {
				deletePict(Constants.BRAND_IMG_PATH+brandImg);
				for(String eachPath:paths) {
					deletePict(Constants.IMG_PATH+eachPath);
				}
			}
			return i;
		}
		return 0;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int updateCommodity(Commodity newCommodity,MultipartFile[] file,MultipartFile brandFile) {
		if(brandFile!=null&&brandFile instanceof MultipartFile) {
			String brandImg = saveImage(brandFile,Constants.BRAND_IMG_PATH);
			if(brandImg!=null) {
				deletePict(Constants.BRAND_IMG_PATH+newCommodity.getBrandImg());
				newCommodity.setBrandImg(brandImg);
				
			}
			
		}
		if(file!=null) {
			String imgPath="";
			String[] paths=newCommodity.getImgPath().split(";");
			int j=0;
			for(MultipartFile perFile:file) {
				String perPath=saveImage(perFile, Constants.IMG_PATH);
				if(j!=0) {
					imgPath+=";";
				}
				if(perPath!=null) {
					deletePict(Constants.IMG_PATH+paths[j]);
					imgPath=imgPath+perPath;
				} else if(j<paths.length){
					imgPath=imgPath+paths[j];
				}
				j++;
				
			}
			newCommodity.setImgPath(imgPath);
		}
		int i = commodityMapper.updateCommodity(newCommodity);
		return i;
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
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int addCommodity(Commodity commodity, MultipartFile[] file,MultipartFile brandFile) {
		if(brandFile!=null && brandFile instanceof MultipartFile) {
			String brandImg=saveImage(brandFile,Constants.BRAND_IMG_PATH);
			if(brandImg!=null)
				commodity.setBrandImg(brandImg);
		}
		if(file!=null) {
			String imgPath="";
			int i=0;
			for(MultipartFile perFile:file) {
				if(perFile instanceof MultipartFile) {
					String img=saveImage(perFile,Constants.IMG_PATH);
					if(img!=null) {
						if(i!=0) {
							imgPath+=";";
						}
						imgPath=imgPath+img;
						i++;
					}
				}
			}
			// 记录服务器文件系统图片名称
			commodity.setImgPath(imgPath);
			//commodity.setImgPath(fileName);
		}
		return commodityMapper.addCommodity(commodity);
	}
	public String saveImage(MultipartFile file,String savePath) {
		// 原始文件名
		String originalFileName=file.getOriginalFilename(); 
		if(originalFileName!=null&&!"".equals(originalFileName)) {
			// 获取图片后缀
			String suffix = originalFileName.substring(originalFileName.lastIndexOf("."));
			// 生成图片存储的名称，UUID 避免相同图片名冲突，并加上图片后缀
	        String fileName = UUID.randomUUID().toString() + suffix;
	        String filePath = savePath+fileName;
	        File saveFile = new File(filePath);
	        try {
	            // 将上传的文件保存到服务器文件系统
	        	file.transferTo(saveFile);
	        	return fileName;
//	        	imgPath=imgPath+fileName+";";
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}
		return null;
	}
	public boolean deletePict(String filename) {
		File file = new File(filename);
		if(file.exists()) {
			if(file.delete()) {
				return true;
			}
			return false;
		}
		return true;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public List<Commodity> queryCommodityByTypeTitleTypeId(String title,String type,String typeId){
		return commodityMapper.queryCommodityByTypeTitleTypeId(title, type, typeId);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public Commodity queryById(String id) {
		return commodityMapper.queryById(id);
	}
}
