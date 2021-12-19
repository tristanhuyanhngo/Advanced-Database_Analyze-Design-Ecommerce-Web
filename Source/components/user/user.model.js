const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {

  this.signin = async (data, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select * from khachhang where SDT = @varSDT and pass = @varPass";
      return await pool
        .request()
        .input("varSDT", sql.VarChar, data.phone)
        .input("varPass", sql.VarChar, data.pass)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, "đăng nhập thành công");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };


};
