package util;

public class movieEntity {
	private String where;
	private String name;
	private String address;
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
	public movieEntity(String where, String name, String address) {
		super();
		this.where = where;
		this.name = name;
		this.address = address;
	}

	
}
