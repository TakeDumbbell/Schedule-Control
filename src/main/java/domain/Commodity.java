package domain;

public class Commodity {
	String id;
	String title;
	String introduce;
	String type;
	String imgPath;
	
	public Commodity(String id, String title, String introduce, String type, String imgPath) {
		super();
		this.id = id;
		this.title = title;
		this.introduce = introduce;
		this.type = type;
		this.imgPath = imgPath;
	}
	public Commodity() {
		this("","","","","");
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
}
