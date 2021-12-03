select * from dept d ;

select * from employee e;

select 
e.emp_no,
e.emp_name,
e.emp_age,
e.emp_phone,
e.emp_email,
view1.job_name,
view1.dept_name,
to_char(emp_reg_timestamp, 'YYYY-MM-DD')as emp_hire_date,
del_yn
from 
employee e inner join
	(select j.job_name, e2.emp_no, d.dept_name
	from job j, employee e2, dept d 
	where j.job_no = e2.job_no
	and d.dept_no = e2.dept_no
	) as view1
on view1.emp_no = e.emp_no 
where 
del_yn=0
order by emp_no asc
