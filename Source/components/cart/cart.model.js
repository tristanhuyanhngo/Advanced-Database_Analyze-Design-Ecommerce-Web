const { conn, sql } = require("../../utils/connectdb");

module.exports = function () {
  this.page = async (id, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "select sanpham.masanpham, sanpham.tensanpham, sanpham.DonGia as gia, ChiTietGioHang.soluong,ChiTietGioHang.dongia as tonggia " +
        "from ChiTietGioHang, sanpham where ChiTietGioHang.makhachhang = 1 and ChiTietGioHang.masanpham = sanpham.masanpham";
      return await pool
        .request()
        .input("varID", sql.Int, id)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, data.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  };
};
