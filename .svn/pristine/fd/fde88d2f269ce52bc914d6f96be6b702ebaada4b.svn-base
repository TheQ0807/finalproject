package com.ese.service.manage.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.manage.pay.PayChangeMapper;
import com.ese.vo.pay.PayChange;
import com.ese.vo.pay.PayChangeType;

@Service
public class PayChangeServiceImpl implements PayChangeService {

	@Autowired PayChangeMapper changeMapper;
	
	@Override
	public void addPayChange(PayChange pay) {
		changeMapper.addPayChange(pay);
	}

	@Override
	public List<PayChange> getChangeByType(PayChangeType type) {
		return changeMapper.getPayChanges(type);
	}

	@Override
	public List<PayChangeType> getAllPayChangeType() {
		return changeMapper.getAllPayChangeType();
	}

}
