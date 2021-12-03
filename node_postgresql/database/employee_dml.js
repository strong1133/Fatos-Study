const db = require("../database/employee_db");

const employee_dml = {
  getEmpList: (query, callback) => {
    let strQuery = `select * from employee e inner join dept d on e.dept_no = d.dept_no;`;
    db.query(strQuery)
      .then((val) => {
        console.log(val);
        callback(null, val);
      })
      .catch((error) => {
        callback(error.response);
      });
  },
};

module.exports = employee_dml;
