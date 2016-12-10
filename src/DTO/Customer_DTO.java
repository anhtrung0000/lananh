package DTO;

import java.sql.Date;

public class Customer_DTO extends Invoice_DTO{
	int customerId ;
	String email, fullName, phone, address, note;
	String createDate;
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public boolean isTinyint() {
		return tinyint;
	}
	public void setTinyint(boolean tinyint) {
		this.tinyint = tinyint;
	}
	boolean tinyint;
	public float total(){
		return Float.parseFloat(super.money()) + 40000;
	}
}
