package com.ese.controller.engineer.alert;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ese.service.engineer.EngineerService;
import com.ese.service.notice.EmployeeNoticeService;
import com.ese.service.notice.SuggestBoardService;
import com.ese.vo.forms.SuggestBoardForm;
import com.ese.vo.hr.Employee;
import com.ese.vo.notice.Suggest;

@Controller
public class EngineerAlertController {
	
	@Autowired
	EngineerService engineerService;
	
	@Autowired
	SuggestBoardService suggestBoardService;
	
	@Autowired
	EmployeeNoticeService empAlert; 
	
	@RequestMapping("/engineer/alert.do")
	public String alert(Model model) {
		model.addAttribute("alerts", empAlert.getAllBoards());
		return "engineer/alert/alert";
	}
	@RequestMapping("/engineer/recommend.do")
	public String list(Model model) {
		model.addAttribute("boards", suggestBoardService.getAllBoards());
		return "/engineer/alert/recommend";
	}
	
	@RequestMapping("/engineer/add.do")
	@ResponseBody
	public Suggest addSugest(SuggestBoardForm suggestBoardForm, HttpSession session) {
		System.out.println(suggestBoardForm);
		
		Employee employee = (Employee) session.getAttribute("loginEngineer");
		Suggest suggest = new Suggest();
		suggest.setEmployee(employee);
		BeanUtils.copyProperties(suggestBoardForm, suggest);
		
		suggestBoardService.addBoard(suggest);
		return suggest;
	}
	@RequestMapping("/engineer/detail.do")
	@ResponseBody
	public Suggest detail(@RequestParam("no") int boardNo) {
		return suggestBoardService.getBoardByNo(boardNo);
	}
}
