package mapper;


import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import domain.HtmlPage;

@Repository
public interface HtmlPageMapper {
	int addHtmlPage(HtmlPage htmlPage);
	int deleteHtmlPage(@Param("htmlName")String htmlName,@Param("hostName")String hostName);
	int updateHtmlPageByName(@Param("oldName")String oldName,@Param("newName")String newName,@Param("hostName")String hostName);
	HtmlPage queryByHtmlAndHost(@Param("htmlName")String htmlName,@Param("hostName")String hostName);
	List<HtmlPage> queryAll();
	List<HtmlPage> queryByHost(String hostName);
	List<HtmlPage> queryByDate(Date createTime);
	boolean isExisthtmlByName(@Param("htmlName")String htmlName,@Param("hostName")String hostName);
}
