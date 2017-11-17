package com.ese.mappers.manage.pay;

import java.util.List;

import com.ese.vo.pay.PayChange;
import com.ese.vo.pay.PayChangeType;

public interface PayChangeMapper {

	void addPayChange(PayChange pay);
	List<PayChange> getPayChanges(PayChangeType type);
	List<PayChangeType> getAllPayChangeType();
	
}
