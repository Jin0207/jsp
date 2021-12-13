package com.sist.vo;

public class Product {
	private int no;
	private String name;
	private int price;
	private int qty;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int no, String name, int price, int qty) {
		super();
		this.no = no;
		this.name = name;
		this.price = price;
		this.qty = qty;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "Product [no=" + no + ", name=" + name + ", price=" + price + ", qty=" + qty + "]";
	}
	
	
}
