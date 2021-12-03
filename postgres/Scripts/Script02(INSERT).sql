
-- insert Test Data DEPT - 
insert into dept (dept_name, dept_loc) values
('회장실', 'SEOUL')
,('경영본부', 'SEOUL')
,('서울본부', 'SEOUL')
,('부산본부', 'BUSAN')
,('하남본부', 'HANAM')
;

-- insert Test Data Job - 
insert into job (job_name) values
('회장')
,('이사')
,('본부장')
,('대리')
,('사원')
,('인턴')
;

-- insert Test Data EMP - 
insert into employee (emp_name, emp_age, emp_phone, emp_email, job_no, dept_no) values 
('김병지', 42, '010-1231-1323', 'asd123@naver.com', 1, 1);

-- insert Test Data EMP - 
insert into employee (emp_name, emp_age, emp_phone, emp_email, job_no, dept_no) values 
('박지성', 32, '010-1232-1133', 'asd124@naver.com', 2, 1),
('홍명보', 52, '010-4444-2323', 'asd125@naver.com', 3, 2),
('이설국', 34, '010-6789-3242', 'asd126@naver.com', 3, 3),
('최병찬', 45, '010-4523-7890', 'asd127@naver.com', 3, 4);


