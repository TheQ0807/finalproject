package com.ese.controller.engineer.alert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ese.service.engineer.EngineerService;
import com.ese.service.notice.EmployeeNoticeService;

@Controller
public class EngineerAlertController {
	
	@Autowired
	EngineerService engineerService;
	
	@Autowired
	EmployeeNoticeService empAlert; 
	
	@RequestMapping("/engineer/alert.do")
	public String alert(Model model) {
		model.addAttribute("alerts", empAlert.getAllBoards());
		return "engineer/alert/alert";
	}
	@RequestMapping("/engineer/recommend.do")
	public String recommend() {
		return "engineer/alert/recommend";
	}
}
