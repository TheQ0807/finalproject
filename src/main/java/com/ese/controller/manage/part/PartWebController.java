package com.ese.controller.manage.part;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ese.service.manage.part.PartService;
import com.ese.vo.Category;
import com.ese.vo.Division;
import com.ese.vo.part.Part;


@Controller
public class PartWebController {

	@Autowired
	PartService partService;
	
	@RequestMapping("/manage/part/partlist.do")
	public String partlist(Model model) {
		List<Category> categories = partService.getCategory();
		String divisionId = "0";
		String categoryId = "0";
		
		List<Part> parts = partService.getSelectedParts(divisionId,categoryId);
		List<Division> phoneDivisions = partService.getDivisions("CAT-PH");
		List<Division> computerDivisions = partService.getDivisions("CAT-COM");
		List<Division> appliancesDivisions = partService.getDivisions("CAT-AP");
		List<Division> wearableDivisions = partService.getDivisions("CAT-WE");
		List<Division> soundDiviceDivisions = partService.getDivisions("CAT-SD");

		model.addAttribute("categories", categories);
		model.addAttribute("phoneDivisions", phoneDivisions);
		model.addAttribute("computerDivisions", computerDivisions);
		model.addAttribute("appliancesDivisions", appliancesDivisions);
		model.addAttribute("wearableDivisions", wearableDivisions);
		model.addAttribute("soundDiviceDivisions", soundDiviceDivisions);
		model.addAttribute("parts", parts);
		return "manage/part/partList";
	}
	
	@RequestMapping("/manage/part/partStock.do")
	public String partStock(Model model) {
		List<Category> categories = partService.getCategory();
		
		String divisionId = "0";
		String categoryId = "0";
		
		List<Part> parts = partService.getSelectedParts(divisionId,categoryId);
		
		List<Division> phoneDivisions = partService.getDivisions("CAT-PH");
		List<Division> computerDivisions = partService.getDivisions("CAT-COM");
		List<Division> appliancesDivisions = partService.getDivisions("CAT-AP");
		List<Division> wearableDivisions = partService.getDivisions("CAT-WE");
		List<Division> soundDiviceDivisions = partService.getDivisions("CAT-SD");
		
		model.addAttribute("categories", categories);
		model.addAttribute("phoneDivisions", phoneDivisions);
		model.addAttribute("computerDivisions", computerDivisions);
		model.addAttribute("appliancesDivisions", appliancesDivisions);
		model.addAttribute("wearableDivisions", wearableDivisions);
		model.addAttribute("soundDiviceDivisions", soundDiviceDivisions);
		model.addAttribute("parts", parts);
		return "manage/part/partStock";
	}
	
	@RequestMapping("/manage/part/partAdd.do")
	public String partAdd(Model model){
		List<Category> categories = partService.getCategory();
		
		model.addAttribute("categories", categories);
		
		return "manage/part/partAdd";
	}
}
