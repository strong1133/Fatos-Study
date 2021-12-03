const express = require("express");
const employee = express.Router();
const source = require("../database/employee_dml");
const {
  responseDto,
} = require("../utils/responseDto");

employee.get("/", (req, res) => {
  res.send("employee");
});

employee.get("/employees", (req, res) => {
  source.getEmpList(req.query, (err, value) =>
    responseDto(err, value, res)
  );
});

employee.post("/upEmployee", (req, res) => {
  source.uploadEmp(req.body, (err, value) =>
    responseDto(err, value, res)
  );
});

module.exports = employee;
