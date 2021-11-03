package com.model;

import java.util.Objects;

public class UserModel {

	private int id;
	private String name;
	private String username;
	private String password;
	private String userImage;

	public UserModel() {
		super();
	}

	public UserModel(int id, String name, String username, String password, String userImage) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.userImage = userImage;
	}

	public UserModel(String name, String username, String password, String userImage) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.userImage = userImage;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name, password, userImage, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserModel other = (UserModel) obj;
		return id == other.id && Objects.equals(name, other.name) && Objects.equals(password, other.password)
				&& Objects.equals(userImage, other.userImage) && Objects.equals(username, other.username);
	}

	public String toString() {

		StringBuilder builder = new StringBuilder();
		builder.append("UserModel => [Id = ");
		builder.append(id);
		builder.append(", ");

		if (name != null) {
			builder.append("Name = ");
			builder.append(name);
			builder.append(", ");
		}

		if (username != null) {
			builder.append("Username = ");
			builder.append(username);
			builder.append(", ");
		}

		if (password != null) {
			builder.append("Password = ");
			builder.append(password);
			builder.append(", ");
		}

		if (userImage != null) {
			builder.append("Userimage = ");
			builder.append(userImage);
			builder.append(", ");
		}

		builder.append("]");
		return builder.toString();
	}

}
