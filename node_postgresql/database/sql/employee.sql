drop table if exists employee cascade;

create table employee(
	emp_no SERIAL NOT NULL,
	emp_name varchar(256) NOT NULL,
	emp_age int NOT NULL,
	emp_phone varchar(32) NULL,
	emp_email varchar(32) null,
	job_no SERIAL constraint fk_job_no references job,
	emp_reg_timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
	emp_upt_timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
	del_yn int DEFAULT 0,
	dept_no SERIAL constraint fk_detp_no references dept,
	PRIMARY KEY (emp_no)
);