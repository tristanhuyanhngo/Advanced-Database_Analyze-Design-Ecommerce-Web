const { conn, sql } = require("../../connectdb");

module.exports = function (){
  this.getInforSP = async (result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM sanpham";
    return await pool.request().query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };
};
