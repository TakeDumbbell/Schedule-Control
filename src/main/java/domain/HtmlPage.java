package domain;

import java.sql.Date;

public class HtmlPage {
	private String htmlName;
	private String content;
	private String hostName;
	private Date createTime;
	
	public HtmlPage(String htmlName, String content, String hostName, Date createTime) {
		super();
		this.htmlName = htmlName;
		this.content = content;
		this.hostName = hostName;
		this.createTime = createTime;
	}
	
	public HtmlPage() {
		this("", "", "", new Date(0));
	}

	public String getHtmlName() {
		return htmlName;
	}
	public void setHtmlName(String htmlName) {
		this.htmlName = htmlName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
