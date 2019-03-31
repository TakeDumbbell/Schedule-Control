package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/add")
	public String add(Commodity commodity) {
		if(commodityService.addCommodity(commodity)>0) {
			return "main";
		}
		return "error";
	}
	@RequestMapping("/queryAll")
	public String queryAll(Model model) {
		List<Commodity> commodityList = commodityService.queryAll();
//		for(Commodity commodity:commodityList) {
//			System.out.println(commodity);
//		}
		model.addAttribute("commodityList",commodityList);
		return "commodity/list";
	}
}
