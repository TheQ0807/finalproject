package com.ese.controller.servicecenter.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ese.service.servicecenter.LocaleService;
import com.ese.service.servicecenter.reservation.ReservationService;
import com.ese.vo.afterservice.Center;
import com.ese.vo.afterservice.City;
import com.ese.vo.afterservice.Locale;
import com.ese.vo.hr.Employee;

@Controller
@RequestMapping("/reserve")
public class ServiceReservationController {

	@Autowired
	ReservationService reservationService;
	@Autowired
	LocaleService localeService;
	
	@RequestMapping("/visitReserve/reserveView.do")
	public String visitReservation(Model model) {
		
		List<Locale> localeList = localeService.getAllLocale();
		
		model.addAttribute("localeList", localeList);
		
		return "/servicecenter/reservation/visit";
	}
	
	@RequestMapping("/getCity.do")
	@ResponseBody
	public List<City> getCity(String localeId) {
		return localeService.getCitysByLocaleId(localeId);
	}
	
	@RequestMapping("/findCenter.do")
	@ResponseBody
	public List<Center> getCenter(String locale, String city) {
		return reservationService.getCenterListByLocale(locale, city);
	}
	
	@RequestMapping("/getCenterEmp.do")
	@ResponseBody
	public List<Employee> getCenterEmployee(String centerId) {
		return reservationService.getCenterEmployee(centerId);
	}
	
	@RequestMapping("/getDivision.do")
	@ResponseBody
	public List<Employee> getDivision(String categoryId) {
		return null;
	}
	
}
