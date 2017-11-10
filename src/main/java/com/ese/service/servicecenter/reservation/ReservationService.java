package com.ese.service.servicecenter.reservation;

import java.util.List;

import com.ese.vo.Division;
import com.ese.vo.afterservice.Center;
import com.ese.vo.hr.Employee;

public interface ReservationService {

	List<Center> getCenterList();
	Center getCenter(String id);
	List<Center> getCenterListByLocale(String locale, String city);
	
	List<Employee> getCenterEmployee(String centerId);
	List<Division> getDivision(String categoryId);
	
}
