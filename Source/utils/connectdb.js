const sql = require("mssql/msnodesqlv8");

// khoa:  "DESKTOP-I5NJLCP\\WANDER"
// Thư: "DESKTOP-8PV3Q0P\\SQLEXPRESS"
const config = {
  server: "DESKTOP-I5NJLCP\\WANDER",
  user: "sa",
  password: "1",
  database: "ADB1_6_DATH2",
  driver: "msnodesqlv8",
};
//"ADB1_6_DATH2"
const connect = new sql.ConnectionPool(config).connect().then((pool) => {
  return pool;
});

module.exports = {
  conn: connect,
  sql: sql,
};
