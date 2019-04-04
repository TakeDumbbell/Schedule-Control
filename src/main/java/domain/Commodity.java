package domain;

public class Commodity {
	private String id;
	private String brandImg;
	private String brand;
	private String title;
	private String size;
	private String type;
	private String typeId;
	private double price;
	private double nowPrice;
	private String imgPath;
	
	public Commodity(String id, String brandImg, String brand, String title, String size, String type, String typeId,
			double price, double nowPrice, String imgPath) {
		super();
		this.id = id;
		this.brandImg = brandImg;
		this.brand = brand;
		this.title = title;
		this.size = size;
		this.type = type;
		this.typeId = typeId;
		this.price = price;
		this.nowPrice = nowPrice;
		this.imgPath = imgPath;
	}
	public Commodity(String brandImg, String brand, String title, String size, String type, String typeId,
			double price, double nowPrice, String imgPath) {
		super();
		this.brandImg = brandImg;
		this.brand = brand;
		this.title = title;
		this.size = size;
		this.type = type;
		this.typeId = typeId;
		this.price = price;
		this.nowPrice = nowPrice;
		this.imgPath = imgPath;
	}
	public Commodity() {
		super();
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrandImg() {
		return brandImg;
	}
	public void setBrandImg(String brandImg) {
		this.brandImg = brandImg;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(double nowPrice) {
		this.nowPrice = nowPrice;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
//	
//	public Commodity(String id, String title, String introduce, String type, String imgPath) {
//		super();
//		this.id = id;
//		this.title = title;
//		this.introduce = introduce;
//		this.type = type;
//		this.imgPath = imgPath;
//	}
//	public Commodity() {
//		this("","","","","");
//	}
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public String getIntroduce() {
//		return introduce;
//	}
//	public void setIntroduce(String introduce) {
//		this.introduce = introduce;
//	}
//	public String getType() {
//		return type;
//	}
//	public void setType(String type) {
//		this.type = type;
//	}
//	public String getImgPath() {
//		return imgPath;
//	}
//	public void setImgPath(String imgPath) {
//		this.imgPath = imgPath;
//	}
}
