package com.ese.controller.servicecenter.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ese.service.servicecenter.ServicecenterService;
import com.ese.vo.afterservice.AfterService;
import com.ese.vo.common.UseServiceCriteria;
import com.ese.vo.common.UserOrderCriteria;
import com.ese.vo.order.Order;

@Controller
public class SCUserajaxController {
	
	@Autowired
	ServicecenterService centerService;
	
	@RequestMapping("/user/ordercheck.do")
	@ResponseBody
	public List<Order> ordercheck (int userNo) {
		UserOrderCriteria orderCriteria = new UserOrderCriteria();
		orderCriteria.setUserNo(userNo);
		List<Order> order = centerService.getOrderForUserNo(orderCriteria);
		
		return order;
	}
	
	@RequestMapping("/user/checkclick.do")
	@ResponseBody
	public List<Order> checkclick (int userNo, String startdate, String enddate) {
		UserOrderCriteria orderCriteria = new UserOrderCriteria();
		orderCriteria.setUserNo(userNo);
		orderCriteria.setStartdate(startdate);
		orderCriteria.setEnddate(enddate);
		
		List<Order> order = centerService.getOrderForUserNo(orderCriteria);
		
		return order;
	}
	/*@RequestMapping("/user/serviceCheck.do")
	@ResponseBody
	public List<AfterService> serviceCheck (int userNo, HttpSession session) {
		UseServiceCriteria criteria = new UseServiceCriteria();
		
		criteria.setUserNo(userNo);
		int totalrows = centerService.getTotalRowsVitae(criteria);
		System.out.println(totalrows);
		criteria.setTotalRows(totalrows);
		List<AfterService> services = centerService.getServiceVitaeForUserNo(criteria);
		System.out.println(services);
		
		return services;
	}*/
}
