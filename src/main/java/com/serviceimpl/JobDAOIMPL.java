package com.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseconnector.DBConnectionProvider;
import com.model.JobModel;
import com.service.JobDAO;

public class JobDAOIMPL implements JobDAO {

	private static final String POST_JOBS = "insert into jobs(job_title,location,category,job_status,job_description) values(?,?,?,?,?)";

	private static final String VIEW_JOBS = "select * from jobs order by id desc";

	private static final String JOBS_BY_ID = "select * from jobs where id=?";

	private static final String UPDATE_JOBS = "update jobs set job_title=?,location=?,category=?,job_status=?,job_description=? where id=?";

	private static final String DELETE_JOBS = "delete from jobs where id=?";

	private static final String USER_JOB_STATUS = "select * from jobs where job_status=? order by id desc";

	private static final String JOBS_USING_OR = "select * from jobs where category=? or location=? order by id desc";

	private static final String JOBS_USING_AND = "select * from jobs where category=? and location=? order by id desc";

	@Override
	public boolean postJobs(JobModel jobModel) {

		boolean checkPostJobsFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(POST_JOBS);

			preparedStatement.setString(1, jobModel.getTitle());
			preparedStatement.setString(2, jobModel.getLocation());
			preparedStatement.setString(3, jobModel.getCategory());
			preparedStatement.setString(4, jobModel.getStatus());
			preparedStatement.setString(5, jobModel.getDescription());

			int postedJobs = preparedStatement.executeUpdate();

			if (postedJobs == 1 || postedJobs > 0) {
				checkPostJobsFlag = true;
				System.out.println("Job Details Posted Successfully.....");
			} else {
				System.out.println("Something went wrong.Please try again.....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkPostJobsFlag;
	}

	@Override
	public List<JobModel> getAllJobs() {

		List<JobModel> lists = new ArrayList<JobModel>();
		JobModel jobModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(VIEW_JOBS);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				jobModel = new JobModel();
				jobModel.setId(resultSet.getInt(1));
				jobModel.setTitle(resultSet.getString(2));
				jobModel.setLocation(resultSet.getString(3));
				jobModel.setCategory(resultSet.getString(4));
				jobModel.setStatus(resultSet.getString(5));
				jobModel.setDescription(resultSet.getString(6));
				jobModel.setPublishDate(resultSet.getTimestamp(7));
				lists.add(jobModel);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}
		return lists;
	}

	@Override
	public JobModel getJobsById(int jobId) {

		JobModel jobModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(JOBS_BY_ID);

			preparedStatement.setInt(1, jobId);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				jobModel = new JobModel();
				jobModel.setId(resultSet.getInt(1));
				jobModel.setTitle(resultSet.getString(2));
				jobModel.setLocation(resultSet.getString(3));
				jobModel.setCategory(resultSet.getString(4));
				jobModel.setStatus(resultSet.getString(5));
				jobModel.setDescription(resultSet.getString(6));
				jobModel.setPublishDate(resultSet.getTimestamp(7));
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}

		return jobModel;
	}

	@Override
	public boolean updateJobs(JobModel jobModel) {

		boolean checkUpdateJobsFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(UPDATE_JOBS);

			preparedStatement.setString(1, jobModel.getTitle());
			preparedStatement.setString(2, jobModel.getLocation());
			preparedStatement.setString(3, jobModel.getCategory());
			preparedStatement.setString(4, jobModel.getStatus());
			preparedStatement.setString(5, jobModel.getDescription());
			preparedStatement.setInt(6, jobModel.getId());

			int updatedJobs = preparedStatement.executeUpdate();

			if (updatedJobs == 1 || updatedJobs > 0) {
				checkUpdateJobsFlag = true;
				System.out.println("Job Details Updated Successfully.....");
			} else {
				System.out.println("Something went wrong.Please try again.....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkUpdateJobsFlag;
	}

	@Override
	public boolean deleteJobs(int jobId) {

		boolean checkDeleteJobsFlag = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(DELETE_JOBS);

			preparedStatement.setInt(1, jobId);

			int deletedJobs = preparedStatement.executeUpdate();

			if (deletedJobs == 1 || deletedJobs > 0) {
				checkDeleteJobsFlag = true;
				System.out.println("Job Details Deleted Successfully.....");
			} else {
				System.out.println("Something went wrong.Please try again.....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_1(preparedStatement, connection);
		}

		return checkDeleteJobsFlag;
	}

	@Override
	public List<JobModel> getJobsForUser() {

		List<JobModel> listsUserJobs = new ArrayList<JobModel>();
		JobModel jobModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(USER_JOB_STATUS);

			preparedStatement.setString(1, "Active");

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				jobModel = new JobModel();
				jobModel.setId(resultSet.getInt(1));
				jobModel.setTitle(resultSet.getString(2));
				jobModel.setLocation(resultSet.getString(3));
				jobModel.setCategory(resultSet.getString(4));
				jobModel.setStatus(resultSet.getString(5));
				jobModel.setDescription(resultSet.getString(6));
				jobModel.setPublishDate(resultSet.getTimestamp(7));
				listsUserJobs.add(jobModel);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}
		return listsUserJobs;
	}

	@Override
	public List<JobModel> getJobsByLocationOrCategory(String category, String location) {

		List<JobModel> listsUserJobsOR = new ArrayList<JobModel>();
		JobModel jobModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(JOBS_USING_OR);

			preparedStatement.setString(1, category);
			preparedStatement.setString(2, location);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				jobModel = new JobModel();
				jobModel.setId(resultSet.getInt(1));
				jobModel.setTitle(resultSet.getString(2));
				jobModel.setLocation(resultSet.getString(3));
				jobModel.setCategory(resultSet.getString(4));
				jobModel.setStatus(resultSet.getString(5));
				jobModel.setDescription(resultSet.getString(6));
				jobModel.setPublishDate(resultSet.getTimestamp(7));
				listsUserJobsOR.add(jobModel);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}
		return listsUserJobsOR;
	}

	@Override
	public List<JobModel> getJobsByLocationAndCategory(String category, String location) {

		List<JobModel> listsUserJobsAND = new ArrayList<JobModel>();
		JobModel jobModel = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(JOBS_USING_AND);

			preparedStatement.setString(1, category);
			preparedStatement.setString(2, location);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				jobModel = new JobModel();
				jobModel.setId(resultSet.getInt(1));
				jobModel.setTitle(resultSet.getString(2));
				jobModel.setLocation(resultSet.getString(3));
				jobModel.setCategory(resultSet.getString(4));
				jobModel.setStatus(resultSet.getString(5));
				jobModel.setDescription(resultSet.getString(6));
				jobModel.setPublishDate(resultSet.getTimestamp(7));
				listsUserJobsAND.add(jobModel);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		finally {
			DBConnectionProvider.closeResources_2(resultSet, preparedStatement, connection);

		}
		return listsUserJobsAND;
	}

}
