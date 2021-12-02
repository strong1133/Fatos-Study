const express = require("express");
const employee = express.Router();

employee.get('/', (req, res)=>{
    res.send('employee')
});

module.exports = employee;