package com.ese.service.servicecenter;

import com.ese.vo.User;

public interface ServicecenterService {
	
	void addNewUser(User user);
	
	User getUserDetail(String id);
}
