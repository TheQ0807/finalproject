package com.ese.rest.web.manage.part;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ese.service.manage.part.PartService;
import com.ese.vo.Division;
import com.ese.vo.part.Part;



@RestController
public class PartController {

	@Autowired
	PartService partService;
	
	@GetMapping("/divs/{categoryId}")
	public List<Division> getDivisions(@PathVariable("categoryId") String categoryId){
		System.out.println();
		return partService.getDivisions(categoryId);
	}
	
	@GetMapping("/parts/{divisionId}/{categoryId}")
	public List<Part> getParts(@PathVariable("divisionId") String divisionId, @PathVariable("categoryId") String categoryId){		
		List<Part> parts = partService.getSelectedParts(divisionId, categoryId);
		
		return parts;
	}
	
	@GetMapping("/parts/{categoryId}")
	public List<Part> getCatParts(@PathVariable("categoryId") String categoryId){
		return partService.getSelectedParts(categoryId);
	}
	
	@GetMapping("/part/{partNo}")
	public Part getPartByNo(@PathVariable("partNo") int partNo) {
		return partService.getPartByNo(partNo);
	}
	
	@PutMapping("/modifypart/{categoryId}/{divisionId}/{partNo}/{increasePart}")
	public List<Part> updatePart(@PathVariable("categoryId") String categoryId, @PathVariable("divisionId") String divisionId, @PathVariable("partNo") int partNo, @PathVariable("increasePart") int increasePart) {
		partService.updatePart(partNo, increasePart);
		return partService.getSelectedParts(divisionId,  categoryId);
	}
}
