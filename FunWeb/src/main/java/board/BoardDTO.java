package board;

import java.sql.Timestamp;

public class BoardDTO {
	private int num;
	private String name;
	private String pass;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp date;
	// 첨부파일
	private String file;
	
	public String getFile() {
		return file;
	}
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getPass() {
		return pass;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public int getReadcount() {
		return readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
}
