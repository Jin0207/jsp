package com.sist.vo;

public class ProductVO {
	private String productId;		//��ǰ���̵�
	private String pname;			//��ǰ��
	private int unitPrice;			//�ܰ�
	private String description;		//��ǰ ����
	private String manufacturer;	//������
	private String category;		//�з�
	private int unitInStock;		//�����
	private String condition;		//��ǰ����(�Ż�ǰ,�߰�ǰ,���ǰ)
	
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductVO(String productId, String pname, int unitPrice, String description, String manufacturer,
			String category, int unitInStock, String condition) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.description = description;
		this.manufacturer = manufacturer;
		this.category = category;
		this.unitInStock = unitInStock;
		this.condition = condition;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public ProductVO(String productId, String pname, int unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	
	
}