package com.ese.service.servicecenter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.servicecenter.ServicecenterMapper;
import com.ese.vo.User;
@Service
public class ServicecenterServiceImpl implements ServicecenterService {
	
	@Autowired
	ServicecenterMapper serviceMapper;
	
	@Override
	public void addNewUser(User user) {
		int no = serviceMapper.getUserSeq();
		user.setNo(no);
		
		serviceMapper.addUser(user);
	}
	
	@Override
	public User getUserDetail(String id) {
		return serviceMapper.getUserById(id);
	}
}
