package com.ese.controller.manage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ese.common.encrypt.Sha256;
import com.ese.service.engineer.EngineerService;
import com.ese.vo.hr.Employee;

@Controller
public class loginController {

	@Autowired
	EngineerService engineerService;
	
	@RequestMapping(value="/manage/part/main.do", method=RequestMethod.GET)
	public String login() {
		return "manage/part/main";
	}
	
	@RequestMapping(value="/manage/part/main.do", method=RequestMethod.POST)
	public String home(@RequestParam("email") String email,
			@RequestParam("pwd") String pwd,
			HttpSession session) {
		
		Employee employee = engineerService.getEmployeeDetailById(email);
		
		String encpwd = Sha256.encrypt(pwd);
		
		if(employee == null) {
 			return "redirect:/engineer/main.do?error=fail";
 		}
 		if(!employee.getPassword().equals(encpwd)) {
			return "redirect:/engineer/main.do?error=fail";
		}
 		if(employee.getPosition().equals("POS-CEO") || employee.getPosition().equals("POS-CM")) {
 			session.setAttribute("loginEmployee", employee);
 		
 			if(employee.getDepartment().getId().equals("DEPT-ADMIN")) {
 				return "/notice/employee/list.do";
 			}else if(employee.getDepartment().getId().equals("DEPT-HR")){
 				return "/manage/personnel/emplist.do";
 			}else if(employee.getDepartment().getId().equals("DEPT-FIN")){
 				return "/manage/finance/main.do";
 			}else if(employee.getDepartment().getId().equals("DEPT-SC")){
 				return "/manage/part/main.do";
 			}
 		}
 		return "redirect:/engineer/alert.do";
	}
}
