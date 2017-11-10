package com.ese.service.manage.part;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.manage.part.PartMapper;
import com.ese.vo.Category;
import com.ese.vo.Division;
import com.ese.vo.part.Part;


@Service
public class PartServiceImpl implements PartService{

	@Autowired
	PartMapper partMapper;
	
	@Override
	public List<Part> getSelectedParts(String categoryId) {
		Category category = new Category();
		Division division = new Division();
		category.setId(categoryId);
		division.setId("0");
		division.setCategory(category);
		return partMapper.getParts(division);
	}
	
	@Override
	public List<Part> getSelectedParts(String divisionId, String categoryId) {
		Category category = new Category();
		Division division = new Division();
		
		category.setId(categoryId);
		
		division.setId(divisionId);
		division.setCategory(category);
		return partMapper.getParts(division);
	}
	
	@Override
	public List<Division> getDivisions(String categoryId) {
		return partMapper.getDivisions(categoryId);
	}
	
	@Override
	public List<Category> getCategory() {
		return partMapper.getCategory();
	}
	
	@Override
	public Part getPartByNo(int partNo) {
		return partMapper.getPartByNo(partNo);
	}
	
	@Override
	public void updatePart(int partNo, int increasePart) {
		Part part =  partMapper.getPartByNo(partNo);
		int totalQty = part.getQty()+increasePart;
		part.setQty(totalQty);
		partMapper.updatePart(part);
	}
	
	@Override
	public List<Part> getAllParts() {
		return partMapper.getAllParts();
	}
	
	
}
