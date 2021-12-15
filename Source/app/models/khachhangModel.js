const { conn, sql } = require("../../connectdb");

module.exports = function () {
  this.getInforKH = async (result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM KhachHang";
    return await pool.request().query(sqlstring, (e, data) => {
      if (data.recordset.length > 0) {
        result(null, data.recordset);
      } else {
        result(true, null);
      }
    });
  };

  this.getInforKHByID = async (id, result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM KhachHang Where MaKhachHang = @varID";
    return await pool
      .request()
      .input("varID", sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length > 0) {
          result(null, data.recordset[0]);
        } else {
          result(true, null);
        }
      });
  };

  this.checkKHbySDTAndPassword = async (sdt,pass, result) => {
    const pool = await conn;
    const sqlstring = "SELECT * FROM KhachHang Where sdt = @varSdt and pass = @varPass";
    return await pool
      .request()
      .input("varSdt", sql.VarChar, sdt)
      .input("varPass",sql.VarChar,pass)
      .query(sqlstring, (e, data) => {
          console.log(data.recordset)
        if (data.recordset.length > 0) {
          result(null, data.recordset[0]);
        } else {
          result(true, null);
        }
      });
  };
};


