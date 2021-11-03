package com.model;

import java.util.Date;
import java.util.Objects;

public class JobModel {

	private int id;
	private String title;
	private String location;
	private String category;
	private String status;
	private String description;
	private Date publishDate;

	public JobModel() {
		super();
	}

	public JobModel(int id, String title, String location, String category, String status, String description,
			Date publishDate) {
		super();
		this.id = id;
		this.title = title;
		this.location = location;
		this.category = category;
		this.status = status;
		this.description = description;
		this.publishDate = publishDate;
	}

	public JobModel(String title, String location, String category, String status, String description,
			Date publishDate) {
		super();
		this.title = title;
		this.location = location;
		this.category = category;
		this.status = status;
		this.description = description;
		this.publishDate = publishDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(category, description, id, location, publishDate, status, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JobModel other = (JobModel) obj;
		return Objects.equals(category, other.category) && Objects.equals(description, other.description)
				&& id == other.id && Objects.equals(location, other.location)
				&& Objects.equals(publishDate, other.publishDate) && Objects.equals(status, other.status)
				&& Objects.equals(title, other.title);
	}

	@Override
	public String toString() {
		return "JobModel [id=" + id + ", title=" + title + ", location=" + location + ", category=" + category
				+ ", status=" + status + ", description=" + description + ", publishDate=" + publishDate + "]";
	}

}
