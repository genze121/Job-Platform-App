package com.databaseconnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

public class DBConnectionProvider {

	private static final String URL = "jdbc:mysql://localhost:3306/Online_Job_Portal";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";

	private static Logger logger = Logger.getLogger(DBConnectionProvider.class.toString());

	private static String DRIVER_CLASS_NAME = "";

	static {
		try {
			DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
			Class.forName(DRIVER_CLASS_NAME);
		} catch (ClassNotFoundException e) {
			logger.info("Error in MYSQL Driver " + e.getMessage());
		}

	}

	public static Connection getConnection() {

		Connection connection = null;

		try {
			if (connection == null) {
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				logger.info("Connected to database successfully......");
			} else {
				logger.info("Something went wrong while connecting.Please try again.....");
			}
		} catch (SQLException ex) {
			printSQLException(ex);
		}

		return connection;

	}

	public static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				if (!ignoreException(((SQLException) e).getSQLState())) {
					e.printStackTrace(System.err);
					System.err.println("SQL STATE :- " + ((SQLException) e).getSQLState());
					System.err.println("ERROR CODE :- " + ((SQLException) e).getErrorCode());
					System.err.println("MESSAGE :- " + ((SQLException) e).getMessage());
					System.err.println("LOCALIZED MESSAGE :- " + ((SQLException) e).getLocalizedMessage());
					Throwable thrown = ex.getCause();
					while (thrown != null) {
						logger.info("CAUSE :- " + thrown);
						thrown = ex.getCause();
					}
				}
			}
		}

	}

	private static boolean ignoreException(String sqlState) {

		if (sqlState == null) {
			logger.info("The Sql State is not defined");
			return false;
		}

		if (sqlState.equalsIgnoreCase("X0Y32")) {
			return true;
		}

		if (sqlState.equalsIgnoreCase("42Y55")) {
			return true;
		}

		return false;
	}

	public static void closeResources_1(PreparedStatement preparedStatement, Connection connection) {

		try {
			if (preparedStatement != null && !preparedStatement.isClosed()) {
				preparedStatement.close();
			}

			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}
	}

	public static void closeResources_2(ResultSet resultSet, PreparedStatement preparedStatement,
			Connection connection) {

		try {

			if (resultSet != null && !resultSet.isClosed()) {
				resultSet.close();
			}

			if (preparedStatement != null && !preparedStatement.isClosed()) {
				preparedStatement.close();
			}

			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}
	}

}
