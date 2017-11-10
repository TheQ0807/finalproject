package com.ese.controller.engineer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ese.service.engineer.EngineerService;
import com.ese.vo.hr.Employee;

@Controller
public class EngineerController {
	
	@Autowired
	EngineerService engineerService;
	
	
	@RequestMapping(value="/engineer/main.do", method=RequestMethod.GET)
	public String login () {
		
		return "engineer/main";
	}
	
	@RequestMapping(value="/engineer/main.do", method=RequestMethod.POST)
	public String loginProcess (@RequestParam("email") String email,
								@RequestParam("pwd") String pwd,
								HttpSession session) {
		
 		Employee engineer = engineerService.getEmployeeDetailById(email);
 		
 		System.out.println(engineer);
 		if(engineer == null) {
 			return "redirect:/engineer/index.do?error=fail";
 		}
 		
 		session.setAttribute("loginEng", engineer);
		
		return "redirect:/engineer/alert.do";
	}
	
}
