package com.usts.woerma.entity;

public class CustomerInfo {
	private int userId = 0;
	private String name ="";
	private String email ="";
	private String address ="";
	private String callPhone ="";
	private String permitted ="";
	
	public CustomerInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 创建客户角色模式对象
	public CustomerInfo(int userId, String name, String email, String address,
			String callPhone) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.address = address;
		this.callPhone = callPhone;
	}

	// 创建管理员模式对象
	public CustomerInfo(int userId, String name, String permitted){
		super();
		this.userId = userId;
		this.name = name;
		this.permitted = permitted;
	}
	
	public String getPermitted() {
		return permitted;
	}

	public void setPermitted(String permitted) {
		this.permitted = permitted;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCallPhone() {
		return callPhone;
	}

	public void setCallPhone(String callPhone) {
		this.callPhone = callPhone;
	}

	@Override
	public String toString() {
		return "CustomerInfo [userId=" + userId + ", name=" + name + ", email="
				+ email + ", address=" + address + ", callPhone=" + callPhone
				+ "]";
	}
}
