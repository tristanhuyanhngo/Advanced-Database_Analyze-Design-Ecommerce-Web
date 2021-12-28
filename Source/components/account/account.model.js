const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      
      const sqlstring1 = "select * from khachhang where MaKhachHAng = @varID";
      const ttkh = await pool.request()
      .input("varID", sql.Int, id).query(sqlstring1);

      const sqlstring2 = "select * from be where khachhang = @varID";
      const be = await pool.request()
      .input("varID", sql.Int, id).query(sqlstring2);

      const sqlstring3 = "select * from PhieuGiamGia where khachhang = @varID";
      const pgg = await pool.request()
      .input("varID", sql.Int, id).query(sqlstring3);

      result(false, {
        thongtinkhachang: ttkh.recordset[0],
        be: be.recordset,
        phieugiamgia: pgg.recordset
      });

    } catch {
      result(true, null);
    }
  };
};
