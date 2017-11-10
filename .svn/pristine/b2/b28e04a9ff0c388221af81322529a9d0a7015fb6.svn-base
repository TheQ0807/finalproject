package com.ese.service.manage.part;

import java.util.List;

import com.ese.vo.Category;
import com.ese.vo.Division;
import com.ese.vo.part.Part;

public interface PartService {

	List<Part> getSelectedParts(String categoryId);
	List<Part> getSelectedParts(String divisionId, String categoryId);
	List<Division> getDivisions(String categoryId);
	List<Category> getCategory();
	Part getPartByNo(int partNo);
	void updatePart(int partNo, int increasePart);
	List<Part> getAllParts();
}
