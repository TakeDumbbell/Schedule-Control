package controller;

import java.util.ArrayList;
import java.util.Date;
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
import domain.HtmlPage;
import service.CommodityService;
import service.HtmlPageService;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private HtmlPageService htmlPageService;
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
	
	@RequestMapping("/checkboxname")
	public String checkboxname(HttpServletRequest request,Model model) {
		String[] checkbox=request.getParameterValues("category");
		String content="";
		for(int i=0;i<checkbox.length;i++) {
			if(i>0)
				content+=";";
			content=content+checkbox[i];
		}
//		HtmlPage htmlPage=new HtmlPage("",content,"",new Date());
//		htmlPage.setHostName("");
		List<Commodity> commodityList = commodityService.queryAll();
		model.addAttribute("commodityList",commodityList);
		return "commodity/list";
	}
	@RequestMapping("/share")
	public String shareCommodity(HttpServletRequest request,Model model) {
		String htmlName=request.getParameter("p");
		String hostName=request.getParameter("h");
		HtmlPage htmlPage=htmlPageService.queryByHtmlAndHost(htmlName, hostName);
		List<Commodity> commodityList = new ArrayList<Commodity>();
		if(htmlName!=null&&!"".equals(htmlName)&&hostName!=null&&!"".equals(hostName)) {
			String[] contents=htmlPage.getContent().split(";");
			for(int i=0;i<contents.length;i++) {
				Commodity commodity=commodityService.queryById(contents[i]);
				if(commodity!=null)
					commodityList.add(commodity);
			}
		}
		model.addAttribute("commodityList",commodityList);
		return "commodity/modelList";
	}
}
