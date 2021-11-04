package com.service;

import java.util.List;

import com.model.ApplyJobModel;
import com.model.JobModel;

public interface JobDAO {
	
	public boolean postJobs(JobModel jobModel);
	
	public List<JobModel> getAllJobs();
	
	public JobModel getJobsById(int jobId);
	
	public boolean updateJobs(JobModel jobModel);
	
	public boolean deleteJobs(int jobId);
	
	public List<JobModel> getJobsForUser();
	
	public List<JobModel> getJobsByLocationOrCategory(String category,String location);
	
	public List<JobModel> getJobsByLocationAndCategory(String category,String location);
	
	public boolean applyJobs(ApplyJobModel applyJobModel);
	
	public List<ApplyJobModel> getAllApplyJobs();

}
