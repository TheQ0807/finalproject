package com.ese.controller.manage.finance;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ese.service.manage.EmployeeService;
import com.ese.service.manage.pay.PayChangeService;
import com.ese.vo.common.PayChangeCriteria;
import com.ese.vo.hr.Department;
import com.ese.vo.hr.Employee;
import com.ese.vo.pay.MonthlyPay;
import com.ese.vo.pay.OtherPay;
import com.ese.vo.pay.PayChange;
import com.ese.vo.pay.PayChangeType;

@Controller
@RequestMapping("/manage/finance")
public class FinanceController {
	
	@Autowired
	PayChangeService changeService;
	@Autowired
	EmployeeService empService;

	@RequestMapping("/main.do")
	public String financePage() {
		
		return "manage/finance/main";
	}
	
	@RequestMapping("/payAnalysis.do")
	public String payChange(Model model) {
		model.addAttribute("CTList", changeService.getAllPayChangeType());
		
		return "manage/finance/payChange";
	}
	
	@RequestMapping("/payChange/getAnalysis.do")
	@ResponseBody
	public List<PayChange> getChange(String startDate, String endDate, String type, String changeType) {
		
		PayChangeCriteria criteria = new PayChangeCriteria();
		
		criteria.setStartDate(startDate);
		criteria.setEndDate(endDate);
		criteria.setType(type);
		criteria.setChangeType(changeType);
		
		System.out.println(startDate + " " + endDate + " " + type + " " + changeType);
		
		return changeService.getChangeByCriteria(criteria);
	}
	
	@RequestMapping("/inputPay.do")
	public String inputPage() {
		return "manage/finance/inputOtherPay";
	}
	
	@RequestMapping("/salary/getAllSalary.do")
	@ResponseBody
	public Map<String, Object> getAllSalary(String month) {
		Map<String, Object> type = new HashMap<String, Object>();
		List<MonthlyPay> monthlyPayList = changeService.getMonthlyPayByMonth(month);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date now = new Date();
		
		type.put("payments", "N");
		if(monthlyPayList.isEmpty()) {
			if(sdf.format(now).equals(month)) {
				type.put("payments", "Y");
				type.put("monthlyEmpList", empService.getAllEmp());
			}
		} else {
			type.put("monthlyList", monthlyPayList);
		}
		
		return type;
	}
	
	@RequestMapping("/salary/paymentsSalary.do")
	@ResponseBody
	public String payments() {
		
		List<Employee> empList = empService.getAllEmp();
		long totalPay = 0;
		for(Employee emp : empList) {
			MonthlyPay pay = new MonthlyPay();
			pay.setEmployee(emp);
			long payments = emp.getSalary()/12;
			pay.setPay(payments);
			totalPay += payments;
			changeService.addMonthlyPay(pay);
		}
		PayChange change = new PayChange();
		change.setMoney(totalPay);
		change.setType("지출");
		PayChangeType changeType = new PayChangeType();
		changeType.setId("PC-MONTH-PAY");
		change.setChangeType(changeType);
		changeService.addPayChange(change);
		
		return "ok";
	}
	
	@RequestMapping("/other/addOtherPay.do")
	@ResponseBody
	public String otherPayAdd(String deptArr, String moneyArr, String reasonArr) {
		
		String[] depts = deptArr.split(",");
		String[] moneys = moneyArr.split(",");
		String[] reasons = reasonArr.split(",");
		
		int size = depts.length;
		
		for(int i = 0; i < size; ++i) {
			OtherPay other = new OtherPay();
			Department dept = new Department();
			
			System.out.println(depts[i]);
			System.out.println(moneys[i]);
			System.out.println(reasons[i]);
			
			dept.setId(depts[i]);
			
			other.setDepartment(dept);
			other.setCost(Long.parseLong(moneys[i]));
			other.setReason(reasons[i]);
			
			changeService.addOtherPay(other);
			
			PayChange change = new PayChange();
			change.setMoney(Long.parseLong(moneys[i]));
			change.setType("지출");
			change.setReason(reasons[i]);
			PayChangeType changeType = new PayChangeType();
			changeType.setId("PC-OTHER-PAY");
			change.setChangeType(changeType);
			changeService.addPayChange(change);
		}
		
		return "ok";
	}
	
	
}
