const e = require("express");
const {
  query,
} = require("../database/employee_db");
const db = require("../database/employee_db");

const employee_dml = {
  // GET
  getEmpList: (query, callback) => {
    let name = query.name
      ? `and emp_name like '%${query.name}%' `
      : "";

    let strQuery = `
      SELECT emp_no, 
      emp_name_kr, 
      emp_stt_date, 
      emp_stt_rp_date, 
      emp_end_date,  
      emp_gender, 
      serve_type, 
      position_type
      FROM taxi.employee;
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
