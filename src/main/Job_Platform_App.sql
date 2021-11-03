create database Online_Job_Portal;
use Online_Job_Portal;

create table usertable
(id int primary key not null auto_increment,
name varchar(50),
username varchar(50),
password varchar(500),
user_image varchar(8000));

drop table usertable;

select * from usertable;

create table jobs
(id int primary key not null auto_increment,
job_title varchar(500),
location varchar(100),
category varchar(100),
job_status varchar(50),
job_description varchar(8000),
pub_date datetime default now());

select * from jobs;

