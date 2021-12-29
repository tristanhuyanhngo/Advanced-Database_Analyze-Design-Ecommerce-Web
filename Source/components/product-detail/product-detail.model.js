const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.getProduct = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring = "select * from sanpham where masanpham = @varID";
      const inforProduct = await pool.request().input("varID", sql.Int, id).query(sqlstring)

      const sqlstring2 = "select * from SanPhamMuaCung where MaSanPham = @varID";
      const spmc = await pool.request().input("varID", sql.Int, id).query(sqlstring2)

      result(null, {
        thongtinsanpham:inforProduct.recordset[0],
        sanphammuacung:spmc.recordset
      });

    } catch {
      result(true, null);
    }
  };
};
