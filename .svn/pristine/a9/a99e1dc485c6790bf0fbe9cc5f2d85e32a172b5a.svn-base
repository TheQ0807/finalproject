package com.ese.service.servicecenter.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.servicecenter.CenterMapper;
import com.ese.mappers.servicecenter.LocaleMapper;
import com.ese.vo.afterservice.Center;
import com.ese.vo.afterservice.City;
import com.ese.vo.afterservice.Locale;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	CenterMapper centerMapper;
	@Autowired
	LocaleMapper localeMapper;
	
	@Override
	public List<Center> getCenterList() {
		return centerMapper.getCenterList();
	}

	@Override
	public Center getCenter(String id) {
		return centerMapper.getCenter(id);
	}

	@Override
	public List<Center> getCenterListByLocale(String locale, String city) {
		
		Locale locales = localeMapper.getLocaleById(locale);
		City citys = localeMapper.getCityById(city);
		
		String localeCity = locales.getName() + " " + citys.getName();
		
		System.out.println(localeCity);
		
		return centerMapper.getCenterByLocale(localeCity);
	}
	
}
