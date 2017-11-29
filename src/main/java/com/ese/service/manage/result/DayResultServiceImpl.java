package com.ese.service.manage.result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.vo.common.DayResultCriteria;
import com.ese.vo.pay.BalanceAccount;

@Service
public class DayResultServiceImpl implements DayResultService {

	@Autowired
	private DayResultService service;
	
	@Override
	public List<BalanceAccount> getWeekResult(DayResultCriteria dayResultCriteria) {
		return service.getWeekResult(dayResultCriteria);
	}
}
