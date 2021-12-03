const promise = require("bluebird");
const pgp = require("pg-promise")({
  promiseLib: promise,
});

const db = pgp(
  "postgres://strong1133@localhost:5432/study"
);

module.exports = db;
