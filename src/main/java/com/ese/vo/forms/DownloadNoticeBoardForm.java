package com.ese.vo.forms;

import com.ese.vo.notice.FileAttach;

public class DownloadNoticeBoardForm {
	private String title;
	private String contents;
	private FileAttach attachFile;
	private String division;
	
	DownloadNoticeBoardForm() {}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public FileAttach getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(FileAttach attachFile) {
		this.attachFile = attachFile;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	
}
