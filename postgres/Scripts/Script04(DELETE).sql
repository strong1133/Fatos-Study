-- 실제 삭제 쿼리는 아님, del_yn 을 바꿔줌.
update employee set del_yn = 0 where emp_no='1';

update employee set del_yn = 0 , emp_name='서인국' where emp_no='1';

update employee set del_yn = 0,emp_name='김수훈',emp_age='27',emp_phone='010-4321-5564',emp_email='suhun@gmail.com',job_no=6,dept_no=3 where emp_no='1';