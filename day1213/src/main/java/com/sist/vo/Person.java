package com.sist.vo;

public class Person {
	private int id = 20210001;
	private String name = "ȫ?浿";
	
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Person(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
