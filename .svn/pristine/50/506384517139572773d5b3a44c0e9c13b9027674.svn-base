package com.ese.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.notice.EmployeeNoticeMapper;
import com.ese.vo.notice.EmployeeNotice;

@Service
public class EmployeeNoticeServiceImpl implements EmployeeNoticeService {
	
	@Autowired
	EmployeeNoticeMapper employeeNoticeMapper;
	
	public void addBoard(EmployeeNotice employeeNotice) {
		employeeNoticeMapper.addBoard(employeeNotice);
	}
	public List<EmployeeNotice> getAllBoards() {
		return employeeNoticeMapper.getAllBoards();
	}
	public EmployeeNotice getBoardByNo(int boardNo) {
		EmployeeNotice employeeNotice = employeeNoticeMapper.getBoardByNo(boardNo);
		employeeNotice.setCount(employeeNotice.getCount()+1);
		employeeNoticeMapper.updateBoard(employeeNotice);
		
		return employeeNoticeMapper.getBoardByNo(boardNo);
	}
}
