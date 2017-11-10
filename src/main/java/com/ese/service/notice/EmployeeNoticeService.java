package com.ese.service.notice;

import java.util.List;

import com.ese.vo.notice.EmployeeNotice;

public interface EmployeeNoticeService {
	
	void addBoard(EmployeeNotice employeeNotice);
	List<EmployeeNotice> getAllBoards();
	EmployeeNotice getBoardByNo(int boardNo);
}
