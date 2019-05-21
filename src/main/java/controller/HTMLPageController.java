package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String checkboxname(String checkedbox,HttpServletRequest request,Model model) {
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
		if(checkedbox!=null&&!"".equals(checkedbox)) {
			String[] boxes=checkedbox.split(";");
			for(String box:boxes) {
				if(content.indexOf(";"+box+";")>0 || content.indexOf(box+";")==0 || content.indexOf(";"+box)+box.length()+1==content.length()) {
					continue;
				}
				content=content+";"+box;
			}
		}
		HtmlPage htmlPage=new HtmlPage("aaa",content,"1",new Date(System.currentTimeMillis()));
		htmlPageService.addHtmlPage(htmlPage);
		model.addAttribute("commodityList",commodityList);
		return "redirect:/commodity/queryAll";
	}
	@RequestMapping("queryAll")
	public String queryAll(Model model) {
		List<HtmlPage> htmlpageList=htmlPageService.queryAll();
		model.addAttribute("htmlpageList",htmlpageList);
		return "htmlpage/list";
	}
	@RequestMapping("delete")
	public String delete(HttpServletRequest request,HttpServletResponse response,Model model) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String htmlName=request.getParameter("htmlName");
			String hostName=request.getParameter("hostName");
			if(htmlPageService.deleteHtmlPage(htmlName, hostName)>0) {
				out.write("true");
			}
			List<HtmlPage> htmlpageList=htmlPageService.queryAll();
			model.addAttribute("htmlpageList",htmlpageList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "htmlpage/list";
	}
	@RequestMapping("/update")
	public String htmlUpdate(String htmlName,String hostName,HttpServletRequest request,HttpSession session) {
		HtmlPage htmlPage=htmlPageService.queryByHtmlAndHost(htmlName, hostName);
		List<Commodity> commodityList=commodityService.queryAll();
		request.setAttribute("commodityList",commodityList);
		session.setAttribute("htmlName",htmlName);
		session.setAttribute("hostName",hostName);
		request.setAttribute("checkedbox",htmlPage.getContent());
		return "htmlpage/htmlEdit";
	}
	@RequestMapping("/submitUpdate")
	public String submitUpdate(HttpSession session,String checkedbox,HttpServletRequest request,Model model) {
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
		if(checkedbox!=null&&!"".equals(checkedbox)) {
			String[] boxes=checkedbox.split(";");
			for(String box:boxes) {
				if(content.indexOf(";"+box+";")>0 || content.indexOf(box+";")==0 || content.indexOf(";"+box)+box.length()+1==content.length()) {
					continue;
				}
				content=content+";"+box;
			}
		}
		String htmlName=(String) session.getAttribute("htmlName");
		String hostName=(String) session.getAttribute("hostName");
		htmlPageService.updateContent(Integer.valueOf(htmlName), hostName, content);
		model.addAttribute("commodityList",commodityList);
		return "main";
	}
	//查询
	@RequestMapping("/query")
	public String query(String title,String type,String typeId,String checkedbox,Model model) {
		List<Commodity> commodityList = null;
		title="%"+title+"%";
		type="%"+type+"%";
		typeId="%"+typeId+"%";
//		System.out.println(checkedbox);
		commodityList=commodityService.queryCommodityByTypeTitleTypeId(title, type, typeId);
		model.addAttribute("commodityList",commodityList);
		model.addAttribute("checkedbox",checkedbox);
		return "htmlpage/htmlEdit";
	}
}
