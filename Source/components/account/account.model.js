const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring = "select * from khachhang where MaKhachHAng = @varID";
      return await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring, (e, data) => {
          if (data.recordset.length > 0) result(null, data.recordset[0]);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };
};
