const express = require("express");
const path = require("path");

const app = express();
const port = 3000;

/* Routes Import */
const employee = require("./routes/employee");

/* Routes Import */

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "html");

app.use(express.json());
// app.use(express.urlencoded({
//     extended: false
//   }));

app.get("/", (req, res) => {res.send("<H1> Hello </H1>")});
app.use("/employee", employee);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(res.send("찾을 수 없습니다."));
});

app.listen(port, () => console.log(`지금 서버 포트는 ${port}`));

module.exports = app;
