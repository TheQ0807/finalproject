package com.ese.vo.order;

import com.ese.vo.User;
import com.ese.vo.part.Part;

public class Order {
	
	private Integer no;
	private Integer count;
	private Integer purchase;
	private String address;
	private String zipcode;
	private String email;
	private String phone;
	private String recipient;
	private String message;
	private User user;
	private Part part;
	private OrderStatus statudId;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPurchase() {
		return purchase;
	}
	public void setPurchase(Integer purchase) {
		this.purchase = purchase;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Part getPart() {
		return part;
	}
	public void setPart(Part part) {
		this.part = part;
	}
	public OrderStatus getStatudId() {
		return statudId;
	}
	public void setStatudId(OrderStatus statudId) {
		this.statudId = statudId;
	}
	
}
