package com.ese.controller.manage;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ese.controller.form.personnel.EmployeeForm;
import com.ese.service.manage.EmployeeService;
import com.ese.vo.afterservice.Center;
import com.ese.vo.hr.Department;
import com.ese.vo.hr.Employee;
import com.ese.vo.hr.Position;

@Controller
public class Employeecontroller {

	
	@Value("${file.upload.directory}")
	String uploadDirectory;
	
	
	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping("/manage/personnel/emplist.do")
	public String getAllEmp(Model model) {
		model.addAttribute("employees", employeeService.getAllEmp());
		return "manage/personnel/personnelList";
	}
	
	@RequestMapping("/manage/personnel/form.do")
	public String form(Model model) {
		model.addAttribute("employeeForm", new EmployeeForm());
		model.addAttribute("centerList", employeeService.getAllCenter());
		return "manage/personnel/personnelAdd";
	}
	
	
	@RequestMapping("/manage/personnel/addemp.do")
	public String register(@Valid EmployeeForm employeeForm, BindingResult errors) throws IOException {
		
		Center center = new Center(); 
		center.setNo(employeeForm.getCenter());
		Department department = new Department();
		department.setId(employeeForm.getDepartment());
		Position position = new Position();
		position.setId(employeeForm.getPosition());
	
		System.out.println(employeeForm);
		Employee employee = new Employee();
		BeanUtils.copyProperties(employeeForm, employee);
		employee.setCenter(center);
		employee.setDepartment(department);
		employee.setPosition(position);
		
		// 첨부파일을 특정 폴더에 저장하는 처리
		MultipartFile pic = employeeForm.getPic();
		if(!pic.isEmpty()){
			String filename = System.currentTimeMillis() + pic.getOriginalFilename();
			employee.setPic(filename);
			
			FileCopyUtils.copy(pic.getBytes(), new File(uploadDirectory, filename));
		}
		
		employeeService.addEmp(employee);
		
		return "redirect:/manage/personnel/form.do";
	}
	
	@RequestMapping("/manage/personnel/getByDetpId.do")
	@ResponseBody
	public List<Employee> getByDetpId(String deptId) {
		List<Employee> emps = employeeService.getByDetpId(deptId);
		return emps;
	}
	
	@RequestMapping("/manage/personnel/getByKeyword.do")
	@ResponseBody
	public List<Employee> getByKeyword(String keyword){
		List<Employee> empNs = employeeService.getByKeyword(keyword);
		return empNs;
	}
	
}


