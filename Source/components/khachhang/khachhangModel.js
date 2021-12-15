const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.customerlogin = async (data, result) => {
    try {
      console.log(data)
      const pool = await conn;
      const sqlstring =
        "select * from khachhang where SDT = @varSDT and pass = @varPass";
      return await pool.request()
        .input("varSDT", sql.VarChar, data.phone)
        .input("varPass", sql.VarChar, data.pass)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length>0) result(null, data2.recordset[0]);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };

  this.customersignin = async (data, result) => {
    try {
      console.log(data)
      const pool = await conn;
      const sqlstring =
        "insert into khachhang(HoTenKhachHang, GioiTinhKhachHang, NgaySinhKhachHang, SoNha, TenDuong,Phuong_Xa, Quan_Huyen, Tinh_ThanhPho, SDT, pass) " +
        "values(@varName, @varGen, @varDate, @varSN, @varTD, @varPX, @varQH, @varTTT, @varSDT, @varPass)";
      return await pool.request()
        .input("varName", sql.NVarChar, data.phone)
        .input("varGen", sql.NVarChar, data.pass)
        .input("varDate", sql.Date, data.pass)
        .input("varSN", sql.VarChar, data.pass)
        .input("varPX", sql.NVarChar, data.pass)
        .input("varQH", sql.NVarChar, data.pass)
        .input("varTTT", sql.NVarChar, data.pass)
        .input("varSDT", sql.VarChar, data.pass)
        .input("varPass", sql.VarChar, data.pass)
        .query(sqlstring, (e, data2) => {
          if (!e) result(null, "ThanhCong");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };
};
