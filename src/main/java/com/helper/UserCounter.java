package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.databaseconnector.DBConnectionProvider;

public class UserCounter {

	private static final String USERS_COUNT = "select count(*) from usertable";

	public static int countUsers() {
		int counter = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(USERS_COUNT);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				counter = resultSet.getInt(1);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);
		}

		return counter;
	}

}
