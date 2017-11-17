package com.ese.controller.engineer.paystub;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ese.service.engineer.EngineerService;
import com.ese.vo.hr.Employee;

@Controller
public class EngineerPayController {
	
	@Autowired
	EngineerService engineerService;
	
	@RequestMapping("/engineer/paystub.do")
	public String paystub (Model model, HttpSession session) {
		return "engineer/paystub/paystub";
	}
	
	@RequestMapping("/engineer/workcheck.do")
	public String workcheck () {
		return "engineer/paystub/workcheck";
	}
}
