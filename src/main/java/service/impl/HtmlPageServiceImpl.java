package service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import domain.HtmlPage;
import mapper.CommodityMapper;
import mapper.HtmlPageMapper;
import service.HtmlPageService;
@Service
public class HtmlPageServiceImpl implements HtmlPageService{
	@Autowired
	private HtmlPageMapper htmlPageMapper;
	@Autowired
	private CommodityMapper CommodityMapper;
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int addHtmlPage(HtmlPage htmlPage) {
		int i=htmlPageMapper.addHtmlPage(htmlPage);
//		if(i>0) {
//			String htmlName=htmlPage.getHtmlName();
//			htmlName=Constants.HTML_PATH + htmlName+".jsp";
//			System.out.println(htmlName);
//			StringBuilder sb = new StringBuilder();
//			PrintStream printStream = null ;
//			try {
//				printStream= new PrintStream(new FileOutputStream(htmlName));
//			} catch (FileNotFoundException e) {
//				e.printStackTrace();
//			}
//			sb.append("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" " + 
//					"    pageEncoding=\"UTF-8\" isELIgnored=\"false\"%>");
//			sb.append("<%@taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>");
//			sb.append("<%" + 
//					"	String path = request.getContextPath();" + 
//					"	String basePath = request.getScheme() + \"://\" + request.getServerName() " + 
//					"						+ \":\" + request.getServerPort() + path + \"/\";" + 
//					"%>");
//			sb.append("<!DOCTYPE html>");
//			sb.append("<html>");
//			sb.append("<head>");
//			sb.append("<title>商品列表</title>");
//			sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />");
//			sb.append("<style>.right {padding-left:60px;};.inputText{height:25px;width:250px;}</style>");
//			sb.append("</head>");
//			sb.append("<body>");
//			String[] commodityIds=htmlPage.getContent().split(";");
//			sb.append("<div>");
//			for(int j=0;j<commodityIds.length;j++) {
//				sb.append("<div>");
//				Commodity commodity=CommodityMapper.queryById(commodityIds[j]);;
//				String content="";
//				sb.append("<div id=\"left\">");
//				content="<img src='../brandImg/"+commodity.getBrandImg()+"' width='50' height='50'>&nbsp;";
//				System.out.println(content);
//				sb.append(content);
//				content="";
//				content="<strong style='margin-top:0px;font-size:30px'>"+commodity.getBrand()+"</strong>";
//				sb.append(content);
//				sb.append("</div>");
//				sb.append("</div>");
//			}
//            //样式结尾
//            sb.append("</body></html>");
//            printStream.println(sb.toString());
//		}
		return i;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int deleteHtmlPage(String htmlName, String hostName) {
		return htmlPageMapper.deleteHtmlPage(htmlName, hostName);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public int updateHtmlPageByName(String oldName, String newName) {
		return 0;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public List<HtmlPage> queryAll() {
		return htmlPageMapper.queryAll();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public List<HtmlPage> queryByHost(String hostName) {
		return htmlPageMapper.queryByHost(hostName);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public List<HtmlPage> queryByDate(Date date) {
		return htmlPageMapper.queryByDate(date);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public HtmlPage queryByHtmlAndHost(String htmlName,String hostName) {
		if(Integer.valueOf(htmlName)>=0) {
			return htmlPageMapper.queryByHtmlAndHost(Integer.valueOf(htmlName), hostName);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
	public boolean isExisthtmlByName(String htmlName, String hostName) {
		return htmlPageMapper.isExisthtmlByName(htmlName, hostName);
	}

	@Override
	public int updateContent(int htmlName, String hostName, String content) {
		return htmlPageMapper.updateContent(htmlName, hostName, content);
	}

}
