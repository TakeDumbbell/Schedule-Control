package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import domain.Commodity;
import service.CommodityService;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	@RequestMapping("/{path}")
	public String jump(@PathVariable("path")String path) {
		return "commodity/"+path;
	}
	//增
	@RequestMapping("/add")
	public String add(Commodity commodity,@RequestParam("imgFile")MultipartFile[] file,
			@RequestParam("brandImgPath")MultipartFile brandFile,Model model) {
		if(commodityService.addCommodity(commodity,file,brandFile)>0) {
			model.addAttribute("commodity", commodity);
			return "main";
		}
		return "error";
	}
	//显示所有
	@RequestMapping("/queryAll")
	public String queryAll(Model model) {
		List<Commodity> commodityList = commodityService.queryAll();
//		for(Commodity commodity:commodityList) {
//			System.out.println(commodity.getBrand());
//		}
		model.addAttribute("commodityList",commodityList);
		return "commodity/list";
	}
	//查询
	@RequestMapping("/query")
	public String query(String title,String type,String typeId,Model model) {
		List<Commodity> commodityList = null;
		title="%"+title+"%";
		type="%"+type+"%";
		typeId="%"+typeId+"%";
		commodityList=commodityService.queryCommodityByTypeTitleTypeId(title, type, typeId);
		model.addAttribute("commodityList",commodityList);
		return "commodity/list";
	}
	//删除
	@RequestMapping("/delete")
	public String deleteById(HttpServletRequest request) {
		String id=request.getParameter("id");
		if(id!=null&&!"".equals(id)) {
			if(commodityService.deleteCommodity(id)>0) {
				return "commodity/list";
			}
		}
		return "error";
	}
	//改
	@RequestMapping("/update")
	public String update(Commodity commodity,@RequestParam("imgFile")MultipartFile[] file,
			@RequestParam("brandImgPath")MultipartFile brandFile,Model model) {
		if(commodityService.updateCommodity(commodity,file, brandFile)>0) {
			return "commodity/list";
		}
		return "error";
	}
	@RequestMapping("/queryById")
	public String queryById(HttpServletRequest request,Model model) {
		String id=request.getParameter("id");
		Commodity commodity=commodityService.queryById(id);
		model.addAttribute("commodity",commodity);
		return "commodity/updateForm";
	}
}
