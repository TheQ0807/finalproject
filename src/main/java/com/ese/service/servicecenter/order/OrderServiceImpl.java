package com.ese.service.servicecenter.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ese.mappers.manage.part.InventoryChangeMapper;
import com.ese.mappers.manage.part.PartMapper;
import com.ese.mappers.servicecenter.order.OrderMapper;
import com.ese.vo.order.Order;
import com.ese.vo.part.InventoryChange;
import com.ese.vo.part.Part;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	PartMapper partmapper; 
	
	@Autowired
	InventoryChangeMapper inventoryChangeMapper;
	
	@Override
	public void addOrder(Order order) {
		
		Part part = partmapper.getPartByNo(order.getPart().getNo());
		InventoryChange inventoryChange = new InventoryChange();
		
		int changedQty = part.getQty()-order.getCount();
		part.setQty(changedQty);
		
		partmapper.updatePart(part);
		
		int changeQty = -order.getCount();
		
		inventoryChange.setPart(part);
		inventoryChange.setQty(changeQty);
		
		inventoryChangeMapper.changeInventory(inventoryChange);
		
		orderMapper.addOrder(order);
	}
}
