package com.sist.vo;

public class GasStationVO {
	private String station_no;
	private String station_name;
	private String brand;
	private String addr;
	private String date;
	private String price;
	private String self;
	public GasStationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GasStationVO(String station_no, String station_name, String brand, String addr, String date, String price,
			String self) {
		super();
		this.station_no = station_no;
		this.station_name = station_name;
		this.brand = brand;
		this.addr = addr;
		this.date = date;
		this.price = price;
		this.self = self;
	}
	public String getStation_no() {
		return station_no;
	}
	public void setStation_no(String station_no) {
		this.station_no = station_no;
	}
	public String getStation_name() {
		return station_name;
	}
	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	
	
}
