package com.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.databaseconnector.DBConnectionProvider;
import com.model.UserModel;
import com.service.UserDAO;

public class UserDAOIMPL implements UserDAO {

	private static final String REGISTER_USERS = "insert into usertable(name,username,password,user_image) values(?,?,?,?)";

	private static final String UNIQUE_USERS = "select * from usertable where username=?";

	private static final String LOGIN_USERS = "select * from usertable where username=? and password=?";

	private static final String FORGOT_PASSWORD = "update usertable set password=? where username=?";

	private static final String CHECK_PASSWORD = "select * from usertable where id=? and password=?";

	private static final String UPDATE_PROFILE = "update usertable set name=?,username=?,user_image=?,password=? where id=?";

	private static final String GET_ALL_USERS = "select * from usertable";

	@Override
	public boolean registerUsers(UserModel userModel) {

		boolean checkRegisterFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(REGISTER_USERS);

			preparedStatement.setString(1, userModel.getName());
			preparedStatement.setString(2, userModel.getUsername());
			preparedStatement.setString(3, userModel.getPassword());
			preparedStatement.setString(4, userModel.getUserImage());

			int registered = preparedStatement.executeUpdate();

			if (registered < 0 || registered == 0 || registered != 1) {
				checkRegisterFlag = false;
				System.out.println("User Details are not registered successfully....");
			} else if (registered == 1 || registered > 0) {
				checkRegisterFlag = true;
				System.out.println("User Details are registered successfully....");
			} else {
				System.out.println("Something went wrong.......");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkRegisterFlag;
	}

	@Override
	public boolean uniqueUsers(String username) {

		boolean checkUniqueUser = true;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(UNIQUE_USERS);

			preparedStatement.setString(1, username);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				checkUniqueUser = false;
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);
		}

		return checkUniqueUser;
	}

	@Override
	public UserModel loginUsers(String username, String password) {

		UserModel userModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(LOGIN_USERS);

			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				userModel = new UserModel();
				userModel.setId(resultSet.getInt(1));
				userModel.setName(resultSet.getString(2));
				userModel.setUsername(resultSet.getString(3));
				userModel.setPassword(resultSet.getString(4));
				userModel.setUserImage(resultSet.getString(5));
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);
		}
		return userModel;
	}

	@Override
	public boolean forgotPassword(String password, String username) {

		boolean checkForgotPasswordFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(FORGOT_PASSWORD);

			preparedStatement.setString(2, username);
			preparedStatement.setString(1, password);

			int forgotPass = preparedStatement.executeUpdate();

			if (forgotPass < 0 || forgotPass == 0 || forgotPass != 1) {
				checkForgotPasswordFlag = false;
				System.out.println("Password updation failed....");
			} else if (forgotPass == 1 || forgotPass > 0) {
				checkForgotPasswordFlag = true;
				System.out.println("Password updated successfully....");
			} else {
				System.out.println("Something went wrong.......");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkForgotPasswordFlag;
	}

	@Override
	public boolean checkPassword(int id, String password) {

		boolean checkPasswordFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(CHECK_PASSWORD);

			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, password);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				checkPasswordFlag = true;
			}

		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);
		}

		return checkPasswordFlag;
	}

	@Override
	public boolean updateProfile(UserModel userModel) {

		boolean checkUpdateFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(UPDATE_PROFILE);

			preparedStatement.setString(1, userModel.getName());
			preparedStatement.setString(2, userModel.getUsername());
			preparedStatement.setString(3, userModel.getUserImage());
			preparedStatement.setString(4, userModel.getPassword());
			preparedStatement.setInt(5, userModel.getId());

			int updated = preparedStatement.executeUpdate();

			if (updated < 0 || updated == 0 || updated != 1) {
				checkUpdateFlag = false;
				System.out.println("User Details are not updated successfully....");
			} else if (updated == 1 || updated > 0) {
				checkUpdateFlag = true;
				System.out.println("User Details are updated successfully....");
			} else {
				System.out.println("Something went wrong.......");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkUpdateFlag;
	}

	@Override
	public List<UserModel> getAllUsers() {

		List<UserModel> allUsers = new ArrayList<UserModel>();
		UserModel userModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(GET_ALL_USERS);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				userModel = new UserModel();
				userModel.setId(resultSet.getInt(1));
				userModel.setName(resultSet.getString(2));
				userModel.setUsername(resultSet.getString(3));
				userModel.setPassword(resultSet.getString(4));
				userModel.setUserImage(resultSet.getString(5));
				allUsers.add(userModel);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}
		return allUsers;
	}

}
