const promise = require("bluebird");
const pgp = require("pg-promise")({
  promiseLib: promise,
});

// const db = pgp(
//   "postgres://strong1133@localhost:5432/study"
// );

// PGBouncer;
// const db = pgp(
//   "postgres://strong1133:1234@localhost:6432/db1"
// );

module.exports = db;
