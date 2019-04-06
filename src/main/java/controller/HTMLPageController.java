package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import domain.Commodity;
import domain.HtmlPage;
import service.CommodityService;
import service.HtmlPageService;

@Controller
@RequestMapping("/htmlpage")
public class HTMLPageController {
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private HtmlPageService htmlPageService;
	@RequestMapping("/{path}")
	public String jump(@PathVariable("path")String path) {
		return "htmlpage/"+path;
	}
	@RequestMapping("/checkboxname")
	public String checkboxname(HttpServletRequest request,Model model) {
		String[] checkbox=request.getParameterValues("category");
		String content="";
		List<Commodity> commodityList=new ArrayList<Commodity>();
		Commodity commodity=null;
		for(int i=0;i<checkbox.length;i++) {
			commodity=commodityService.queryById(checkbox[i]);
			commodityList.add(commodity);
			if(i>0)
				content+=";";
			content=content+checkbox[i];
		}
		HtmlPage htmlPage=new HtmlPage("aaa",content,"",new Date(0));
		htmlPageService.addHtmlPage(htmlPage);
//		htmlPage.setHostName("");
		model.addAttribute("commodityList",commodityList);
		return "commodity/list";
	}
}
