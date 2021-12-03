const e = require("express");
const express = require("express");
const employee = express.Router();
const source = require("../database/employee_dml");
const {
  responseDto,
} = require("../utils/responseDto");

//GET
employee.get("/", (req, res) => {
  res.send("employee");
});

//GET
employee.get("/employees", (req, res) => {
  source.getEmpList(req.query, (err, value) =>
    responseDto(err, value, res)
  );
});

//POST
employee.post("/upEmployee", (req, res) => {
  source.uploadEmp(req.body, (err, value) =>
    responseDto(err, value, res)
  );
});

//DELETE
employee.delete("/delEmployee", (req, res) => {
  source.delEmp(req.query, (err, value) =>
    responseDto(err, value, res)
  );
});

//POST
employee.put("/upEmployee", (req, res) => {
  source.setEmp(
    req.query,
    req.body,
    (err, value) => responseDto(err, value, res)
  );
});

module.exports = employee;
