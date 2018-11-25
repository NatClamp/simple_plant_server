const pgp = require("pg-promise");
const config = require("./config");

exports.db = pgp(config);
