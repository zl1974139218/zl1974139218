package entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.xml.crypto.Data;

public class User {
private int id;
private String username;
private String password;
private Timestamp time;

public Timestamp getTime() {
	return time;
}
public void setTime(Timestamp time) {
	this.time = time;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
