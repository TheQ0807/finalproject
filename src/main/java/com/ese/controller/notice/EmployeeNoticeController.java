package com.ese.controller.notice;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ese.service.notice.EmployeeNoticeService;
import com.ese.vo.forms.BoardForm;
import com.ese.vo.notice.EmployeeNotice;

@Controller
@RequestMapping("/notice/employee")
public class EmployeeNoticeController {
	@Autowired
	EmployeeNoticeService employeeNoticeService;
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("boards", employeeNoticeService.getAllBoards());
		return "/manage/notice/employee/list";
	}
	
	@RequestMapping("/addform.do")
	public String form() {
		return "/manage/notice/employee/addform";
	}
	
	@RequestMapping("/add.do")
	public String addBoard(BoardForm boardForm) {
		EmployeeNotice employeeNotice = new EmployeeNotice();
		BeanUtils.copyProperties(boardForm, employeeNotice);
		employeeNoticeService.addBoard(employeeNotice);
		return "redirect:list.do";
	}
	
	@RequestMapping("detail.do")
	public String detail(@RequestParam("no") int boardNo, Model model) {
		model.addAttribute("board", employeeNoticeService.getBoardByNo(boardNo));
		return "/manage/notice/employee/detail";
	}
	
	
}
