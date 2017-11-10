package com.ese.mappers.servicecenter;

import com.ese.vo.User;

public interface ServicecenterMapper {
	
	int getUserSeq();
	
	void addUser(User user);
	
	User getUserById(String id);
	
}
