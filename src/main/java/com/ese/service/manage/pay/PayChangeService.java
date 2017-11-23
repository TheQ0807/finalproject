package com.ese.service.manage.pay;

import java.util.List;

import com.ese.vo.common.PayChangeCriteria;
import com.ese.vo.pay.MonthlyPay;
import com.ese.vo.pay.OtherPay;
import com.ese.vo.pay.PayChange;
import com.ese.vo.pay.PayChangeType;

public interface PayChangeService {
	void addPayChange(PayChange pay);
	List<PayChange> getChangeByType(PayChangeType type);
	List<PayChangeType> getAllPayChangeType();
	List<PayChange> getChangeByCriteria(PayChangeCriteria criteria);
	
	List<MonthlyPay> getMonthlyPayByMonth(String month);
	void addMonthlyPay(MonthlyPay pay);
	MonthlyPay getMonthlyPayByCriteria(PayChangeCriteria criteria);
	
	void addOtherPay(OtherPay other);
	
}
