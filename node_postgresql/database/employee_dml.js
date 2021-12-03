const e = require("express");
const db = require("../database/employee_db");

const employee_dml = {
  // GET
  getEmpList: (query, callback) => {
    let name = query.name
      ? `and emp_name like '%${query.name}%' `
      : "";
    console.log(name);

    let strQuery = `select 
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
        ${name}`;
    ExcuteQuery(strQuery, callback);
  },

  // POST EMP
  uploadEmp: (query, callback) => {
    let name = query.name;
    let age = query.age;
    let phone = query.phone;
    let email = query.email;
    let job = query.job;
    let dept = query.dept;
    if (!(name, age, phone, email, job, dept)) {
      callback(new Error("입력값을 확인하세요"));
    }

    let strQuery = `
      insert into employee (emp_name, emp_age, emp_phone, emp_email, job_no, dept_no) values ('${name}', ${age}, '${phone}', '${email}', ${job}, ${dept});
    `;

    ExcuteQuery(strQuery, callback);
  },
};

// 쿼리 실행
const ExcuteQuery = (strQuery, callback) => {
  return db
    .query(strQuery)
    .then((val) => {
      console.log(val);
      val =
        val.length > 0
          ? val
          : "transaction complete";
      callback(null, val);
    })
    .catch((error) => {
      callback(error.response);
    });
};

module.exports = employee_dml;
