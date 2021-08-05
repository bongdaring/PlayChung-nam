package util;

public class foodEntity {
	private String where;
	private String name;
	private String address;
	private String phone;
	private String menu;
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public foodEntity(String where, String name, String address, String phone, String menu) {
		super();
		this.where = where;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.menu = menu;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
}
