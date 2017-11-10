package com.ese.service.engineer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.engineer.EngineerMapper;
import com.ese.vo.hr.Employee;

@Service
public class EngineerServiceImpl implements EngineerService {
	
	@Autowired
	EngineerMapper engineerMapper;
	
	@Override
	public Employee getEmployeeDetailById(String email) {
		return engineerMapper.getEmployeeById(email);
	}
}
