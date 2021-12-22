package com.sist.vo;

import java.sql.Date;

public class BoardVO {
	private int no;
	private String title;
	private String writer;
	private String content;
	private String pwd;
	private Date regdate;
	private long fsize;
	private String fname;
	private int hit;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int no, String title, String writer, String content, String pwd, Date regdate, long fsize,
			String fname, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.pwd = pwd;
		this.regdate = regdate;
		this.fsize = fsize;
		this.fname = fname;
		this.hit = hit;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public long getFsize() {
		return fsize;
	}
	public void setFsize(long fsize) {
		this.fsize = fsize;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
