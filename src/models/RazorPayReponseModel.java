package models;

public class RazorPayReponseModel {
 private String entity;
 private int count;
 private RazorPayOrderModel[] items;
public String getEntity() {
	return entity;
}
public void setEntity(String entity) {
	this.entity = entity;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public RazorPayOrderModel[] getItems() {
	return items;
}
public void setItems(RazorPayOrderModel[] items) {
	this.items = items;
}
 
}


