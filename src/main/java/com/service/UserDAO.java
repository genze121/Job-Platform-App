package com.service;

import java.util.List;

import com.model.UserModel;

public interface UserDAO {

	public boolean registerUsers(UserModel userModel);

	public boolean uniqueUsers(String username);

	public UserModel loginUsers(String username, String password);

	public boolean forgotPassword(String password, String username);
	
	public boolean checkPassword(int id,String password);
	
	public boolean updateProfile(UserModel userModel);
	
	public List<UserModel> getAllUsers();

}
