const express = require("express");
const employee = express.Router();
const source = require("../database/employee_dml");
const {
  responseDto,
} = require("../utils/responseDto");

//GET
employee.get("/employees", (req, res) => {
  source.getEmpList(req.query, (err, value) =>
    responseDto(err, value, res)
  );
});

module.exports = employee;
