package service;

import java.util.Date;
import java.util.List;


import domain.HtmlPage;

public interface HtmlPageService {
	int addHtmlPage(HtmlPage htmlPage);
	int deleteHtmlPage(String htmlName,String hostName);
	int updateHtmlPageByName(String oldName,String newName);
	List<HtmlPage> queryAll();
	List<HtmlPage> queryByHost(String hostName);
	List<HtmlPage> queryByDate(Date date);
	boolean isExisthtmlByName(String htmlName,String hostName);
	HtmlPage queryByHtmlAndHost(String htmlName,String hostName);
}
