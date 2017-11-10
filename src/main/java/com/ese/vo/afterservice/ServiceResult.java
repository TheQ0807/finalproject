package com.ese.vo.afterservice;

import java.util.Date;

public class ServiceResult {
	private Integer no;
	private Date complete;
	private AfterService service;
	private RepairInfo repairInfo;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Date getComplete() {
		return complete;
	}
	public void setComplete(Date complete) {
		this.complete = complete;
	}
	public AfterService getService() {
		return service;
	}
	public void setService(AfterService service) {
		this.service = service;
	}
	public RepairInfo getRepairInfo() {
		return repairInfo;
	}
	public void setRepairInfo(RepairInfo repairInfo) {
		this.repairInfo = repairInfo;
	}
}
