package com.ese.controller.notice;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ese.service.notice.DownloadNoticeService;
import com.ese.vo.forms.DownloadNoticeBoardForm;
import com.ese.vo.notice.DownloadNotice;

@Controller
@RequestMapping("/notice/download")
public class DownloadNoticeController {
	@Autowired
	DownloadNoticeService downloadNoticeService;
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("boards", downloadNoticeService.getAllBoards());
		return "/manage/notice/download/list";
	}
	@RequestMapping("/addform.do")
	public String addForm() {
		return "/manage/notice/download/addform";
	}
	@RequestMapping("/add.do")
	public String addBoard(DownloadNoticeBoardForm downloadNoticeBoardForm) {
		DownloadNotice downloadNotice = new DownloadNotice();
		BeanUtils.copyProperties(downloadNoticeBoardForm, downloadNotice);
		downloadNoticeService.addBoard(downloadNotice);
		return "redirect:list.do";
	}
}
