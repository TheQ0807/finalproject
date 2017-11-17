package com.ese.service.manage.pay;

import java.util.List;

import com.ese.vo.pay.PayChange;
import com.ese.vo.pay.PayChangeType;

public interface PayChangeService {
	void addPayChange(PayChange pay);
	List<PayChange> getChangeByType(PayChangeType type);
	List<PayChangeType> getAllPayChangeType();
}
