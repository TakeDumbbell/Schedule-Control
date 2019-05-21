package service;

import java.sql.Date;
import java.util.List;

import domain.HtmlPage;

public interface HtmlPageService {
	int addHtmlPage(HtmlPage htmlPage);
	int deleteHtmlPage(String htmlName,String hostName);
	int updateHtmlPageByName(String oldName,String newName);
	int updateContent(int htmlName,String hostName,String content);
	List<HtmlPage> queryAll();
	List<HtmlPage> queryByHost(String hostName);
	List<HtmlPage> queryByDate(Date date);
	boolean isExisthtmlByName(String htmlName,String hostName);
	HtmlPage queryByHtmlAndHost(String htmlName,String hostName);
}
